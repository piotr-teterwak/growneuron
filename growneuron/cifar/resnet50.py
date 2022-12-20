# coding=utf-8
# Copyright 2022 GradMax Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

"""VGG Network."""

import functools
from typing import Any, Dict
from growneuron.cifar import wide_resnet
import growneuron.layers as glayers
import tensorflow as tf

NormalizationType = wide_resnet.NormalizationType

BatchNormalization = functools.partial(
    tf.keras.layers.BatchNormalization,
    epsilon=1e-5,  # using epsilon and momentum defaults from Torch
    momentum=0.9)

LayerNormalization = functools.partial(
    tf.keras.layers.LayerNormalization,
    epsilon=1e-5)  # using epsilon and momentum defaults from Torch


def check_grow_layer(layer):
  return (isinstance(layer, glayers.GrowLayer) and
          isinstance(layer.layer,
                     (tf.keras.layers.Dense, tf.keras.layers.Conv2D)) and
          not isinstance(layer.layer, tf.keras.layers.DepthwiseConv2D))


def Conv2D(filters, seed=None, **kwargs):
  """Conv2D layer that is deterministically initialized."""
  default_kwargs = {
      'kernel_size': 3,
      'padding': 'same',
      'strides': 1,
      'use_bias': False,
      # Note that we need to use the class constructor for the initializer to
      # get deterministic initialization.
      'kernel_initializer': tf.keras.initializers.HeNormal(seed=seed),
  }
  # Override defaults with the passed kwargs.
  default_kwargs.update(kwargs)
  return tf.keras.layers.Conv2D(filters, **default_kwargs)


def bottleneck_block(
    in_filters,
    filters,
    normalization_type,
    strides,
    l2,
    seed,
    grow_multiplier=0.25):
  """Bottleneck block.

  Args:
    filters: Number of filters for Conv2D.
    normalization_type: NormalizationType
    strides: Stride dimensions for Conv2D.
    l2: L2 regularization coefficient.
    seed: random seed used for initialization.

  Returns:
    block_layers: list of sequential layers for the main branch.
    skip_layer: tf.keras.Conv2D or None.
  """
  seeds = tf.random.experimental.stateless_split([seed, seed + 1], 4)[:, 0]

  block_layers = [
          glayers.GrowLayer(Conv2D(int(filters * grow_multiplier), kernel_size=1, strides=1, seed=seeds[0],
                 kernel_regularizer=tf.keras.regularizers.l2(l2)))
  ]
  # Maybe add normalization in between the layers.
  if normalization_type == NormalizationType.batchnorm:
        block_layers += [glayers.GrowLayer(BatchNormalization(beta_regularizer=tf.keras.regularizers.l2(l2),
                           gamma_regularizer=tf.keras.regularizers.l2(l2)))]
  elif normalization_type == NormalizationType.layernorm:
        block_layers += [glayers.GrowLayer(LayerNormalization(beta_regularizer=tf.keras.regularizers.l2(l2),
                           gamma_regularizer=tf.keras.regularizers.l2(l2)))]
  elif normalization_type == NormalizationType.none:
    pass
  else:
    raise ValueError

  block_layers += [
      # This is to ensure gradient is 1 at 0 for relu.
      tf.keras.layers.Activation(glayers.get_activation_fn('relu1')),
          glayers.GrowLayer(Conv2D(int(filters * grow_multiplier), strides=strides, seed=seeds[1],
                 kernel_regularizer=tf.keras.regularizers.l2(l2)))
  ]


  # Maybe add normalization in between the layers.
  if normalization_type == NormalizationType.batchnorm:
    block_layers.append(
        glayers.GrowLayer(BatchNormalization(beta_regularizer=tf.keras.regularizers.l2(l2),
                           gamma_regularizer=tf.keras.regularizers.l2(l2))))
  elif normalization_type == NormalizationType.layernorm:
    block_layers.append(
        glayers.GrowLayer(LayerNormalization(beta_regularizer=tf.keras.regularizers.l2(l2),
                           gamma_regularizer=tf.keras.regularizers.l2(l2))))
  elif normalization_type == NormalizationType.none:
    pass
  else:
    raise ValueError


  block_layers += [
      # This is to ensure gradient is 1 at 0 for relu.
      tf.keras.layers.Activation(glayers.get_activation_fn('relu1')),
          glayers.GrowLayer(Conv2D(filters * 4, kernel_size = 1, strides=1, seed=seeds[2],
                 kernel_regularizer=tf.keras.regularizers.l2(l2)))
  ]

  # Maybe add normalization in between the layers.
  if normalization_type == NormalizationType.batchnorm:
    block_layers.append(
        BatchNormalization(beta_regularizer=tf.keras.regularizers.l2(l2),
                           gamma_regularizer=tf.keras.regularizers.l2(l2)))
  elif normalization_type == NormalizationType.layernorm:
    block_layers.append(
        LayerNormalization(beta_regularizer=tf.keras.regularizers.l2(l2),
                           gamma_regularizer=tf.keras.regularizers.l2(l2)))
  elif normalization_type == NormalizationType.none:
    pass
  else:
    raise ValueError
  final_norm = None
  if strides > 1 or in_filters != filters * 4 :
    skip_layer = Conv2D(filters * 4, kernel_size=1, strides=strides, seed=seeds[3],
                        kernel_regularizer=tf.keras.regularizers.l2(l2))
    # Maybe add normalization in between the layers.
    if normalization_type == NormalizationType.batchnorm:
        final_norm = BatchNormalization(beta_regularizer=tf.keras.regularizers.l2(l2),
                           gamma_regularizer=tf.keras.regularizers.l2(l2))
    elif normalization_type == NormalizationType.layernorm:
        final_norm = LayerNormalization(beta_regularizer=tf.keras.regularizers.l2(l2),
                           gamma_regularizer=tf.keras.regularizers.l2(l2))
    elif normalization_type == NormalizationType.none:
        pass
    else:
        raise ValueError

  else:
    skip_layer = None

  final_activation =  tf.keras.layers.Activation(glayers.get_activation_fn('relu1'))
  return (block_layers, skip_layer, final_activation, final_norm)


class ResNet50(tf.keras.Model):
  """Builds Wide ResNet.

  Following Zagoruyko and Komodakis (2016), it accepts a width multiplier on the
  number of filters. Using three groups of residual blocks, the network maps
  spatial features of size 32x32 -> 16x16 -> 8x8.

  Attributes:
    depth: Total number of convolutional layers. "n" in WRN-n-k. It differs from
      He et al. (2015)'s notation which uses the maximum depth of the network
      counting non-conv layers like dense.
    width_multiplier: Integer to multiply the number of typical filters by. "k"
      in WRN-n-k.
    block_width_multiplier: Multiplies the filters in the first conv for each
      block.
    normalization_type: NormalizationType, of the normalization used inside
      blocks.
    num_classes: Number of output classes.
    l2: L2 regularization coefficient.
    seed: random seed used for initialization.

  """

  def __init__(
      self,
      normalization_type,
      num_classes,
      l2,
      seed = 42
      ):
    super().__init__(name='resnet50')
    l2_reg = tf.keras.regularizers.l2
    # Start here
    seeds = tf.random.experimental.stateless_split([seed, seed + 1], 6)[:, 0]
    num_blocks = [3,4,6,3]

    self.conv_stem = []
    self.group_seq = []
    self.conv_stem += [Conv2D(64,
                            strides=1,
                            kernel_size=3,
                            seed=seeds[0],
                            kernel_regularizer=l2_reg(l2))]
    if normalization_type == NormalizationType.batchnorm:
        self.conv_stem.append(
            BatchNormalization(beta_regularizer=tf.keras.regularizers.l2(l2),
                           gamma_regularizer=tf.keras.regularizers.l2(l2)))
    elif normalization_type == NormalizationType.layernorm:
        self.conv_stem.append(
            LayerNormalization(beta_regularizer=tf.keras.regularizers.l2(l2),
                           gamma_regularizer=tf.keras.regularizers.l2(l2)))
    elif normalization_type == NormalizationType.none:
        pass
    else:
        raise ValueError


    self.conv_stem += [tf.keras.layers.Activation(glayers.get_activation_fn('relu1')),
                       tf.keras.layers.MaxPool2D(pool_size=3, strides=2, padding='same')]

    in_filters = 64
    for i, (filters, strides, seed, blocks) in enumerate(
        zip([64,128,256,512], [1, 2, 2,2], seeds[1:5],num_blocks)):
      block_seq = []
      group_seeds = tf.random.experimental.stateless_split(
          [seed, seed + 1], blocks)[:, 0]
      for j, group_seed in enumerate(group_seeds):
        block_strides = strides if j == 0 else 1
        block_seq.append(
            bottleneck_block(in_filters = in_filters, # Figure out infilters
                        filters=filters,
                        normalization_type=normalization_type,
                        strides=block_strides, l2=l2, seed=group_seed)
            )
        in_filters = filters * 4
      self.group_seq.append(block_seq)

    self.final_layers = [
        tf.keras.layers.GlobalAveragePooling2D(),
        tf.keras.layers.Flatten(),
        tf.keras.layers.Dense(
            num_classes,
            kernel_initializer=tf.keras.initializers.HeNormal(seed=seeds[4]),
            kernel_regularizer=l2_reg(l2),
            bias_regularizer=l2_reg(l2))
    ]

  def call(self, inputs):
    x = inputs
    for s in self.conv_stem:
        x = s(x)
    for block_seq in self.group_seq:
      for block_layers, skip_layer, final_act, final_norm in block_seq:
        y = x
        # Main branch.
        for layer in block_layers:
          y = layer(y)
        # Skip branch
        if skip_layer:
          x = skip_layer(x)
          if final_norm:
            x = final_norm(x)
        x = x + y
        x = final_act(x)
    for layer in self.final_layers:
      x = layer(x)
    return x


def create_model(
    normalization_type = 'batchnorm',
    num_classes = 10,
    l2_coef = 0.0,
    **unused_kwargs):
  """Creates model."""
  normalization_type = NormalizationType[normalization_type]
  model = ResNet50(num_classes=num_classes,
                     normalization_type=normalization_type,
                     l2=l2_coef)
  return model
