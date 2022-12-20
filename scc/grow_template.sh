#!/bin/bash -l



#$ -P ivc-ml

# Specify hard time limit for the job.
#   The job will be aborted if it runs longer than this time.
#   The default time is 12 hours
#$ -l h_rt=672:00:00

# Send an email when the job finishes or if it is aborted (by default no email is sent).
#$ -m ea


# Give job a name

# Combine output and error files into a single file
#$ -j y


#$ -pe omp 12

# Specify gpu number and type2
#$ -l gpus=4
#$ -l gpu_c=8.6



# >>> conda nitialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/projectnb/ivc-ml/piotrt/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/projectnb/ivc-ml/piotrt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/projectnb/ivc-ml/piotrt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/projectnb/ivc-ml/piotrt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


conda activate gradmax

cd /projectnb/ivc-ml/piotrt/gradmax/growneuron

export TFDS_DATA_DIR=/projectnb/ivc-ml/piotrt/data/tfds_imagenet
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/projectnb/ivc-ml/piotrt/miniconda3/envs/gradmax/lib/

#python main_natural_images.py -j 2 /projectnb/ivc-ml/piotrt/data/domainnet/real  /projectnb/ivc-ml/piotrt/data/domainnet/painting --save_name v2_aug_real_painting_pt --pretrained checkpoint_v2_erm_strong_aug.pth.tar --strong-aug --save_dir model_checkpoints/painting/ --steps 27390


python growneuron/imagenet/main.py   --download_data $args
