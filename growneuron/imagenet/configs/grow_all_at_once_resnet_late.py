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

"""Default config for random growing."""
from growneuron.imagenet.configs import baseline_small_resnet


def get_config():
  """Builds and returns config."""
  config = baseline_small_resnet.get_config()
  config.updater_type = 'all_at_once'
  config.grow_type = 'add_random'
  config.grow_epsilon = 0.
  config.is_outgoing_zero = False
  config.grow_scale_method = 'mean_norm'
  #config.model.normalization_type = 'none'
  config.updater.carry_optimizer = True

  config.updater.update_frequency = 4000
  config.grow_frequency_multiplier = 1.
  config.updater.start_iteration = 122000
  # 1 cyle is 12 growth steps.
  config.updater.n_growth_steps = 12
  # Use one of the following
  # config.updater.n_grow = 2
  config.updater.n_grow_fraction = 0.25
  config.updater.scale = 0.5

  return config
