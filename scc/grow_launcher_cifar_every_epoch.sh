#qsub -v "args= --output_dir=outputs/cifar/7000/gm_small_baseline_cifar --config=growneuron/cifar/configs/baseline_small_28_5.py " -N gm_small_baseline_cifar -o ../outputs/cifar/7000/gm_small_baseline_cifar/gm_small_baseline_cifar.o grow_template_cifar.sh
#qsub -v "args=  --output_dir=outputs/cifar/7000/gm_gradmax_cifar --config=growneuron/cifar/configs/grow_all_at_once_28_5.py --config.grow_type=add_gradmax" -N gm_gradmax_cifar -o ../outputs/cifar/7000/gm_gradmax_cifar/gm_gradmax_cifar.o grow_template_cifar.sh
#qsub -v "args=  --output_dir=outputs/cifar/7000/gm_firefly_cifar --config=growneuron/cifar/configs/grow_all_at_once_28_5.py --config.grow_type=add_firefly" -N gm_firefly_cifar -o ../outputs/cifar/7000/gm_firefly_cifar/gm_firefly_cifar.o grow_template_cifar.sh
#qsub -v "args=  --output_dir=outputs/cifar/7000/gm_random_cifar --config=growneuron/cifar/configs/grow_all_at_once_28_5.py --config.grow_type=add_random" -N gm_random_cifar -o ../outputs/cifar/7000/gm_random_cifar/gm_random_cifar.o grow_template_cifar.sh


#qsub -v "args=  --output_dir=outputs/cifar/7000_single_2/gm_gradmax_cifar --config=growneuron/cifar/configs/grow_all_at_once_28_5_single.py --config.seed=2 --config.grow_type=add_gradmax --config.updater.start_iteration=7000" -N gm_gradmax_cifar_single_7_2 -o ../outputs/cifar/7000_single_2/gm_gradmax_cifar/gm_gradmax_cifar.o grow_template_cifar.sh
#qsub -v "args=  --output_dir=outputs/cifar/7000_single_2/gm_firefly_cifar --config=growneuron/cifar/configs/grow_all_at_once_28_5_single.py --config.seed=2 --config.grow_type=add_firefly --config.updater.start_iteration=7000" -N gm_firefly_cifar_single_7_2 -o ../outputs/cifar/7000_single_2/gm_firefly_cifar/gm_firefly_cifar.o grow_template_cifar.sh
#qsub -v "args=  --output_dir=outputs/cifar/7000_single_2/gm_random_cifar --config=growneuron/cifar/configs/grow_all_at_once_28_5_single.py --config.seed=2 --config.grow_type=add_random --config.updater.start_iteration=7000" -N gm_random_cifar_single_7_2 -o ../outputs/cifar/7000_single_2/gm_random_cifar/gm_random_cifar.o grow_template_cifar.sh
#
#qsub -v "args=  --output_dir=outputs/cifar/7000_single_3/gm_gradmax_cifar --config=growneuron/cifar/configs/grow_all_at_once_28_5_single.py --config.seed=3 --config.grow_type=add_gradmax --config.updater.start_iteration=7000" -N gm_gradmax_cifar_single_7_3 -o ../outputs/cifar/7000_single_3/gm_gradmax_cifar/gm_gradmax_cifar.o grow_template_cifar.sh
#qsub -v "args=  --output_dir=outputs/cifar/7000_single_3/gm_firefly_cifar --config=growneuron/cifar/configs/grow_all_at_once_28_5_single.py --config.seed=3 --config.grow_type=add_firefly --config.updater.start_iteration=7000" -N gm_firefly_cifar_single_7_3 -o ../outputs/cifar/7000_single_3/gm_firefly_cifar/gm_firefly_cifar.o grow_template_cifar.sh
#qsub -v "args=  --output_dir=outputs/cifar/7000_single_3/gm_random_cifar --config=growneuron/cifar/configs/grow_all_at_once_28_5_single.py --config.seed=3 --config.grow_type=add_random --config.updater.start_iteration=7000" -N gm_random_cifar_single_7_3 -o ../outputs/cifar/7000_single_3/gm_random_cifar/gm_random_cifar.o grow_template_cifar.sh



#qsub -v "args=  --output_dir=outputs/cifar/11000_single/gm_gradmax_cifar --config=growneuron/cifar/configs/grow_all_at_once_28_5_single.py --config.grow_type=add_gradmax --config.updater.start_iteration=11000" -N gm_gradmax_cifar_single_11 -o ../outputs/cifar/11000_single/gm_gradmax_cifar/gm_gradmax_cifar.o grow_template_cifar.sh
#qsub -v "args=  --output_dir=outputs/cifar/11000_single/gm_firefly_cifar --config=growneuron/cifar/configs/grow_all_at_once_28_5_single.py --config.grow_type=add_firefly --config.updater.start_iteration=11000" -N gm_firefly_cifar_single_11 -o ../outputs/cifar/11000_single/gm_firefly_cifar/gm_firefly_cifar.o grow_template_cifar.sh
#qsub -v "args=  --output_dir=outputs/cifar/11000_single/gm_random_cifar --config=growneuron/cifar/configs/grow_all_at_once_28_5_single.py --config.grow_type=add_random --config.updater.start_iteration=11000" -N gm_random_cifar_single_11 -o ../outputs/cifar/11000_single/gm_random_cifar/gm_random_cifar.o grow_template_cifar.sh
#


#qsub -v "args=  --output_dir=outputs/cifar/11000_single_2/gm_gradmax_cifar --config=growneuron/cifar/configs/grow_all_at_once_28_5_single.py --config.seed=2 --config.grow_type=add_gradmax --config.updater.start_iteration=11000" -N gm_gradmax_cifar_single_11_2 -o ../outputs/cifar/11000_single_2/gm_gradmax_cifar/gm_gradmax_cifar.o grow_template_cifar.sh
#qsub -v "args=  --output_dir=outputs/cifar/11000_single_2/gm_firefly_cifar --config=growneuron/cifar/configs/grow_all_at_once_28_5_single.py --config.seed=2 --config.grow_type=add_firefly --config.updater.start_iteration=11000" -N gm_firefly_cifar_single_11_2 -o ../outputs/cifar/11000_single_2/gm_firefly_cifar/gm_firefly_cifar.o grow_template_cifar.sh
#qsub -v "args=  --output_dir=outputs/cifar/11000_single_2/gm_random_cifar --config=growneuron/cifar/configs/grow_all_at_once_28_5_single.py --config.seed=2 --config.grow_type=add_random --config.updater.start_iteration=11000" -N gm_random_cifar_single_11_2 -o ../outputs/cifar/11000_single_2/gm_random_cifar/gm_random_cifar.o grow_template_cifar.sh
#
#qsub -v "args=  --output_dir=outputs/cifar/11000_single_3/gm_gradmax_cifar --config=growneuron/cifar/configs/grow_all_at_once_28_5_single.py --config.seed=3 --config.grow_type=add_gradmax --config.updater.start_iteration=11000" -N gm_gradmax_cifar_single_11_2 -o ../outputs/cifar/11000_single_3/gm_gradmax_cifar/gm_gradmax_cifar.o grow_template_cifar.sh
#qsub -v "args=  --output_dir=outputs/cifar/11000_single_3/gm_firefly_cifar --config=growneuron/cifar/configs/grow_all_at_once_28_5_single.py --config.seed=3 --config.grow_type=add_firefly --config.updater.start_iteration=11000" -N gm_firefly_cifar_single_11_2 -o ../outputs/cifar/11000_single_3/gm_firefly_cifar/gm_firefly_cifar.o grow_template_cifar.sh
#qsub -v "args=  --output_dir=outputs/cifar/11000_single_3/gm_random_cifar --config=growneuron/cifar/configs/grow_all_at_once_28_5_single.py --config.seed=3 --config.grow_type=add_random --config.updater.start_iteration=11000" -N gm_random_cifar_single_11_2 -o ../outputs/cifar/11000_single_3/gm_random_cifar/gm_random_cifar.o grow_template_cifar.sh





# qsub -v "args=  --output_dir=outputs/cifar/15000_single/gm_gradmax_cifar --config=growneuron/cifar/configs/grow_all_at_once_28_5_single.py --config.grow_type=add_gradmax --config.updater.start_iteration=15000" -N gm_gradmax_cifar_single_15 -o ../outputs/cifar/15000_single/gm_gradmax_cifar/gm_gradmax_cifar.o grow_template_cifar.sh
#qsub -v "args=  --output_dir=outputs/cifar/15000_single/gm_firefly_cifar --config=growneuron/cifar/configs/grow_all_at_once_28_5_single.py --config.grow_type=add_firefly --config.updater.start_iteration=15000" -N gm_firefly_cifar_single_15 -o ../outputs/cifar/15000_single/gm_firefly_cifar/gm_firefly_cifar.o grow_template_cifar.sh
#qsub -v "args=  --output_dir=outputs/cifar/15000_single/gm_random_cifar --config=growneuron/cifar/configs/grow_all_at_once_28_5_single.py --config.grow_type=add_random --config.updater.start_iteration=15000" -N gm_random_cifar_single_15 -o ../outputs/cifar/15000_single/gm_random_cifar/gm_random_cifar.o grow_template_cifar.sh
#
#


#qsub -v "args=  --output_dir=outputs/cifar/15000_single_2/gm_gradmax_cifar --config=growneuron/cifar/configs/grow_all_at_once_28_5_single.py --config.seed=2 --config.grow_type=add_gradmax --config.updater.start_iteration=15000" -N gm_gradmax_cifar_single_15_2 -o ../outputs/cifar/15000_single_2/gm_gradmax_cifar/gm_gradmax_cifar.o grow_template_cifar.sh
#qsub -v "args=  --output_dir=outputs/cifar/15000_single_2/gm_firefly_cifar --config=growneuron/cifar/configs/grow_all_at_once_28_5_single.py --config.seed=2 --config.grow_type=add_firefly --config.updater.start_iteration=15000" -N gm_firefly_cifar_single_15_2 -o ../outputs/cifar/15000_single_2/gm_firefly_cifar/gm_firefly_cifar.o grow_template_cifar.sh
#qsub -v "args=  --output_dir=outputs/cifar/15000_single_2/gm_random_cifar --config=growneuron/cifar/configs/grow_all_at_once_28_5_single.py --config.seed=2 --config.grow_type=add_random --config.updater.start_iteration=15000" -N gm_random_cifar_single_15_2 -o ../outputs/cifar/15000_single_2/gm_random_cifar/gm_random_cifar.o grow_template_cifar.sh
#
#qsub -v "args=  --output_dir=outputs/cifar/15000_single_3/gm_gradmax_cifar --config=growneuron/cifar/configs/grow_all_at_once_28_5_single.py --config.seed=3 --config.grow_type=add_gradmax --config.updater.start_iteration=15000" -N gm_gradmax_cifar_single_15_3 -o ../outputs/cifar/15000_single_3/gm_gradmax_cifar/gm_gradmax_cifar.o grow_template_cifar.sh
#qsub -v "args=  --output_dir=outputs/cifar/15000_single_3/gm_firefly_cifar --config=growneuron/cifar/configs/grow_all_at_once_28_5_single.py --config.seed=3 --config.grow_type=add_firefly --config.updater.start_iteration=15000" -N gm_firefly_cifar_single_15_3 -o ../outputs/cifar/15000_single_3/gm_firefly_cifar/gm_firefly_cifar.o grow_template_cifar.sh
#qsub -v "args=  --output_dir=outputs/cifar/15000_single_3/gm_random_cifar --config=growneuron/cifar/configs/grow_all_at_once_28_5_single.py --config.seed=3 --config.grow_type=add_random --config.updater.start_iteration=15000" -N gm_random_cifar_single_15_3 -o ../outputs/cifar/15000_single_3/gm_random_cifar/gm_random_cifar.o grow_template_cifar.sh


# qsub -v "args=  --output_dir=outputs/cifar/save_16422_single/gm_gradmax_cifar --config=growneuron/cifar/configs/grow_all_at_once_28_5_single.py --config.grow_type=add_gradmax --config.updater.start_iteration=16422" -N gm_gradmax_cifar_single_16 -o ../outputs/cifar/save_16422_single/gm_gradmax_cifar/gm_gradmax_cifar.o grow_template_cifar.sh
#qsub -v "args=  --output_dir=outputs/cifar/save_16422_single/gm_firefly_cifar --config=growneuron/cifar/configs/grow_all_at_once_28_5_single.py --config.grow_type=add_firefly --config.updater.start_iteration=16422" -N gm_firefly_cifar_single_16 -o ../outputs/cifar/save_16422_single/gm_firefly_cifar/gm_firefly_cifar.o grow_template_cifar.sh
qsub -v "args=  --output_dir=outputs/cifar/save_16422_single/gm_random_cifar --config=growneuron/cifar/configs/grow_all_at_once_28_5_single.py --config.grow_type=add_random --config.updater.start_iteration=16422" -N gm_random_cifar_single_16 -o ../outputs/cifar/save_16422_single/gm_random_cifar/gm_random_cifar.o grow_template_cifar.sh


#qsub -v "args=  --output_dir=outputs/cifar/save_16422_single_2/gm_gradmax_cifar --config=growneuron/cifar/configs/grow_all_at_once_28_5_single.py --config.seed=2 --config.grow_type=add_gradmax --config.updater.start_iteration=16422" -N gm_gradmax_cifar_single_16_2 -o ../outputs/cifar/save_16422_single_2/gm_gradmax_cifar/gm_gradmax_cifar.o grow_template_cifar.sh
#qsub -v "args=  --output_dir=outputs/cifar/save_16422_single_2/gm_firefly_cifar --config=growneuron/cifar/configs/grow_all_at_once_28_5_single.py --config.seed=2 --config.grow_type=add_firefly --config.updater.start_iteration=16422" -N gm_firefly_cifar_single_16_2 -o ../outputs/cifar/save_16422_single_2/gm_firefly_cifar/gm_firefly_cifar.o grow_template_cifar.sh
qsub -v "args=  --output_dir=outputs/cifar/save_16422_single_2/gm_random_cifar --config=growneuron/cifar/configs/grow_all_at_once_28_5_single.py --config.seed=2 --config.grow_type=add_random --config.updater.start_iteration=16422" -N gm_random_cifar_single_16_2 -o ../outputs/cifar/save_16422_single_2/gm_random_cifar/gm_random_cifar.o grow_template_cifar.sh

#qsub -v "args=  --output_dir=outputs/cifar/save_16422_single_3/gm_gradmax_cifar --config=growneuron/cifar/configs/grow_all_at_once_28_5_single.py --config.seed=3 --config.grow_type=add_gradmax --config.updater.start_iteration=16422" -N gm_gradmax_cifar_single_16_3 -o ../outputs/cifar/save_16422_single_3/gm_gradmax_cifar/gm_gradmax_cifar.o grow_template_cifar.sh
#qsub -v "args=  --output_dir=outputs/cifar/save_16422_single_3/gm_firefly_cifar --config=growneuron/cifar/configs/grow_all_at_once_28_5_single.py --config.seed=3 --config.grow_type=add_firefly --config.updater.start_iteration=16422" -N gm_firefly_cifar_single_16_3 -o ../outputs/cifar/save_16422_single_3/gm_firefly_cifar/gm_firefly_cifar.o grow_template_cifar.sh
qsub -v "args=  --output_dir=outputs/cifar/save_16422_single_3/gm_random_cifar --config=growneuron/cifar/configs/grow_all_at_once_28_5_single.py --config.seed=3 --config.grow_type=add_random --config.updater.start_iteration=16422" -N gm_random_cifar_single_16_3 -o ../outputs/cifar/save_16422_single_3/gm_random_cifar/gm_random_cifar.o grow_template_cifar.sh




# qsub -v "args=  --output_dir=outputs/cifar/19000_single/gm_gradmax_cifar --config=growneuron/cifar/configs/grow_all_at_once_28_5_single.py --config.grow_type=add_gradmax --config.updater.start_iteration=19000" -N gm_gradmax_cifar_single_19 -o ../outputs/cifar/19000_single/gm_gradmax_cifar/gm_gradmax_cifar.o grow_template_cifar.sh
#qsub -v "args=  --output_dir=outputs/cifar/19000_single/gm_firefly_cifar --config=growneuron/cifar/configs/grow_all_at_once_28_5_single.py --config.grow_type=add_firefly  --config.updater.start_iteration=19000" -N gm_firefly_cifar_single_19 -o ../outputs/cifar/19000_single/gm_firefly_cifar/gm_firefly_cifar.o grow_template_cifar.sh
#qsub -v "args=  --output_dir=outputs/cifar/19000_single/gm_random_cifar --config=growneuron/cifar/configs/grow_all_at_once_28_5_single.py --config.grow_type=add_random --config.updater.start_iteration=19000" -N gm_random_cifar_single_19 -o ../outputs/cifar/19000_single/gm_random_cifar/gm_random_cifar.o grow_template_cifar.sh



#qsub -v "args=  --output_dir=outputs/cifar/19000_single_2/gm_gradmax_cifar --config=growneuron/cifar/configs/grow_all_at_once_28_5_single.py --config.seed=2 --config.grow_type=add_gradmax --config.updater.start_iteration=19000" -N gm_gradmax_cifar_single_19_2 -o ../outputs/cifar/19000_single_2/gm_gradmax_cifar/gm_gradmax_cifar.o grow_template_cifar.sh
#qsub -v "args=  --output_dir=outputs/cifar/19000_single_2/gm_firefly_cifar --config=growneuron/cifar/configs/grow_all_at_once_28_5_single.py --config.seed=2 --config.grow_type=add_firefly --config.updater.start_iteration=19000" -N gm_firefly_cifar_single_19_2 -o ../outputs/cifar/19000_single_2/gm_firefly_cifar/gm_firefly_cifar.o grow_template_cifar.sh
#qsub -v "args=  --output_dir=outputs/cifar/19000_single_2/gm_random_cifar --config=growneuron/cifar/configs/grow_all_at_once_28_5_single.py --config.seed=2 --config.grow_type=add_random --config.updater.start_iteration=19000" -N gm_random_cifar_single_19_2 -o ../outputs/cifar/19000_single_2/gm_random_cifar/gm_random_cifar.o grow_template_cifar.sh
#
#qsub -v "args=  --output_dir=outputs/cifar/19000_single_3/gm_gradmax_cifar --config=growneuron/cifar/configs/grow_all_at_once_28_5_single.py --config.seed=3 --config.grow_type=add_gradmax --config.updater.start_iteration=19000" -N gm_gradmax_cifar_single_19_3 -o ../outputs/cifar/19000_single_3/gm_gradmax_cifar/gm_gradmax_cifar.o grow_template_cifar.sh
#qsub -v "args=  --output_dir=outputs/cifar/19000_single_3/gm_firefly_cifar --config=growneuron/cifar/configs/grow_all_at_once_28_5_single.py --config.seed=3 --config.grow_type=add_firefly --config.updater.start_iteration=19000" -N gm_firefly_cifar_single_19_3 -o ../outputs/cifar/19000_single_3/gm_firefly_cifar/gm_firefly_cifar.o grow_template_cifar.sh
#qsub -v "args=  --output_dir=outputs/cifar/19000_single_3/gm_random_cifar --config=growneuron/cifar/configs/grow_all_at_once_28_5_single.py --config.seed=3 --config.grow_type=add_random --config.updater.start_iteration=19000" -N gm_random_cifar_single_19_3 -o ../outputs/cifar/19000_single_3/gm_random_cifar/gm_random_cifar.o grow_template_cifar.sh



#qsub -v "args=  --output_dir=outputs/cifar/24570_single/gm_gradmax_cifar --config=growneuron/cifar/configs/grow_all_at_once_28_5_single.py --config.grow_type=add_gradmax --config.updater.start_iteration=24570" -N gm_gradmax_cifar_single_24 -o ../outputs/cifar/24570_single/gm_gradmax_cifar/gm_gradmax_cifar.o grow_template_cifar.sh
#qsub -v "args=  --output_dir=outputs/cifar/24570_single/gm_firefly_cifar --config=growneuron/cifar/configs/grow_all_at_once_28_5_single.py --config.grow_type=add_firefly --config.updater.start_iteration=24570" -N gm_firefly_cifar_single_24 -o ../outputs/cifar/24570_single/gm_firefly_cifar/gm_firefly_cifar.o grow_template_cifar.sh
#qsub -v "args=  --output_dir=outputs/cifar/24570_single/gm_random_cifar --config=growneuron/cifar/configs/grow_all_at_once_28_5_single.py --config.grow_type=add_random --config.updater.start_iteration=24570" -N gm_random_cifar_single_24 -o ../outputs/cifar/24570_single/gm_random_cifar/gm_random_cifar.o grow_template_cifar.sh

#qsub -v "args=  --output_dir=outputs/cifar/24570_single_2/gm_gradmax_cifar --config=growneuron/cifar/configs/grow_all_at_once_28_5_single.py --config.seed=2 --config.grow_type=add_gradmax --config.updater.start_iteration=24570" -N gm_gradmax_cifar_single_24_2 -o ../outputs/cifar/24570_single_2/gm_gradmax_cifar/gm_gradmax_cifar.o grow_template_cifar.sh
#qsub -v "args=  --output_dir=outputs/cifar/24570_single_2/gm_firefly_cifar --config=growneuron/cifar/configs/grow_all_at_once_28_5_single.py --config.seed=2 --config.grow_type=add_firefly --config.updater.start_iteration=24570" -N gm_firefly_cifar_single_24_2 -o ../outputs/cifar/24570_single_2/gm_firefly_cifar/gm_firefly_cifar.o grow_template_cifar.sh
#qsub -v "args=  --output_dir=outputs/cifar/24570_single_2/gm_random_cifar --config=growneuron/cifar/configs/grow_all_at_once_28_5_single.py --config.seed=2 --config.grow_type=add_random --config.updater.start_iteration=24570" -N gm_random_cifar_single_24_2 -o ../outputs/cifar/24570_single_2/gm_random_cifar/gm_random_cifar.o grow_template_cifar.sh
#
#qsub -v "args=  --output_dir=outputs/cifar/24570_single_3/gm_gradmax_cifar --config=growneuron/cifar/configs/grow_all_at_once_28_5_single.py --config.seed=3 --config.grow_type=add_gradmax --config.updater.start_iteration=24570" -N gm_gradmax_cifar_single_24_3 -o ../outputs/cifar/24570_single_3/gm_gradmax_cifar/gm_gradmax_cifar.o grow_template_cifar.sh
#qsub -v "args=  --output_dir=outputs/cifar/24570_single_3/gm_firefly_cifar --config=growneuron/cifar/configs/grow_all_at_once_28_5_single.py --config.seed=3 --config.grow_type=add_firefly --config.updater.start_iteration=24570" -N gm_firefly_cifar_single_24_3 -o ../outputs/cifar/24570_single_3/gm_firefly_cifar/gm_firefly_cifar.o grow_template_cifar.sh
#qsub -v "args=  --output_dir=outputs/cifar/24570_single_3/gm_random_cifar --config=growneuron/cifar/configs/grow_all_at_once_28_5_single.py --config.seed=3 --config.grow_type=add_random --config.updater.start_iteration=24570" -N gm_random_cifar_single_24_3 -o ../outputs/cifar/24570_single_3/gm_random_cifar/gm_random_cifar.o grow_template_cifar.sh


