#!/bin/bash -l



#$ -P ivc-ml

# Specify hard time limit for the job.
#   The job will be aborted if it runs longer than this time.
#   The default time is 12 hours
#$ -l h_rt=12:00:00

# Send an email when the job finishes or if it is aborted (by default no email is sent).
#$ -m ea


# Give job a name

# Combine output and error files into a single file
#$ -j y


#$ -pe omp 3

# Specify gpu number and type2
#$ -l gpus=1
#$ -l gpu_c=6.0



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



python growneuron/cifar/main.py --download_data $args
