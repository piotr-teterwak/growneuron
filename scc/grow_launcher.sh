qsub -v "args= --config=growneuron/imagenet/configs/baseline_small_resnet.py " -N gm_small_baseline -o gm_small_baseline.o grow_template.sh
qsub -v "args= --config=growneuron/imagenet/configs/grow_all_at_once_resnet.py --config.grow_type=add_gradmax" -N gm_gradmax -o gm_gradmax.o grow_template.sh
qsub -v "args= --config=growneuron/imagenet/configs/grow_all_at_once_resnet.py --config.grow_type=add_firefly" -N gm_firefly -o gm_firefly.o grow_template.sh
qsub -v "args= --config=growneuron/imagenet/configs/grow_all_at_once_resnet.py --config.grow_type=add_random" -N gm_random -o gm_random.o grow_template.sh
