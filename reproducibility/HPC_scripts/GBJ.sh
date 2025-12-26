#!/bin/bash -l
#
#SBATCH --ntasks=1
##SBATCH --cpus-per-task=32
##SBATCH --mem=128G ##no available for GPUs, it will be allocated automatically
##SBATCH --gres=gpu:1
#SBATCH --gres=gpu:a100:1
#SBATCH -p a100
#SBATCH --job-name=LLR_Recon
#SBATCH --time=20:00:00
#SBATCH --mail-user=ab.alhaidari@yahoo.com
#SBATCH --mail-type=ALL
#
# do not export environment variables meas_MID00126_FID00058_32Dir_Seg2_1p2iso_126
#SBATCH --export=NONE


unset SLURM_EXPORT_ENV

module unload python
# module load cuda/12.4.1
module load python/3.12-conda
# conda init bash
eval "$(conda shell.bash hook)"
conda activate Env ##replace Env with your envirnment name
module load cuda/12.4.1

mkdir $TMPDIR/$SLURM_JOB_ID


free -h 

##Original Work
# python reco.py --data 1.0mm_3-shell_R3x3 --slice_idx=32 --jets --pat=2 --split=3 --blk_shape 1 6 6 


# python reco.py --data 1.0mm_3-shell_R3x3 --slice_idx=32 --jets --pat=2 --split=2 --blk_shape 1 1 1 
# python reco.py --data 1.0mm_3-shell_R3x3 --slice_idx=32 --jets --pat=2 --split=2 --blk_shape 1 3 3
# python reco.py --data 1.0mm_3-shell_R3x3 --slice_idx=32 --jets --pat=2 --split=2 --blk_shape 1 6 6 
# python reco.py --data 1.0mm_3-shell_R3x3 --slice_idx=32 --jets --pat=2 --split=2 --blk_shape 1 8 8 
# python reco.py --data 1.0mm_3-shell_R3x3 --slice_idx=32 --jets --pat=2 --split=2 --blk_shape 1 12 12 
# python reco.py --data 1.0mm_3-shell_R3x3 --slice_idx=32 --jets --pat=2 --split=2 --blk_strides 1 3 3
# python reco.py --data 1.0mm_3-shell_R3x3 --slice_idx=32 --jets --pat=2 --split=2 --blk_strides 1 6 6
# python reco.py --data 1.0mm_3-shell_R3x3 --slice_idx=32 --jets --pat=2 --split=2 --blk_strides 1 8 8
# python reco.py --data 1.0mm_3-shell_R3x3 --slice_idx=32 --jets --pat=2 --split=2 --r=0
# python reco.py --data 1.0mm_3-shell_R3x3 --slice_idx=32 --jets --pat=2 --split=2 --r=0.004
# python reco.py --data 1.0mm_3-shell_R3x3 --slice_idx=32 --jets --pat=2 --split=2 --r=0.03
# python reco.py --data 1.0mm_3-shell_R3x3 --slice_idx=32 --jets --pat=2 --split=2 --r=0.05
# python reco.py --data 1.0mm_3-shell_R3x3 --slice_idx=32 --jets --pat=2 --split=2 --r=0.1
# python reco.py --data 1.0mm_3-shell_R3x3 --slice_idx=32 --jets --pat=2 --split=2 --r=0.4
# python reco.py --data 1.0mm_3-shell_R3x3 --slice_idx=32 --jets --pat=2 --split=2 --r=1


# python reco.py --data 1.0mm_3-shell_R3x3 --slice_idx=32 --jets --pat=2 --coil_batch_size=16
# python reco.py --data 1.0mm_3-shell_R3x3 --slice_idx=32 --jets --pat=2 --coil_batch_size=8
# python reco.py --data 1.0mm_3-shell_R3x3 --slice_idx=32 --jets --pat=2 --coil_batch_size=4
# python reco.py --data 1.0mm_3-shell_R3x3 --slice_idx=32 --jets --pat=2 --coil_batch_size=2
# python reco.py --data 1.0mm_3-shell_R3x3 --slice_idx=32 --jets --pat=2 --coil_batch_size=1

##python reco.py --data 1.0mm_3-shell_R3x3 --slice_idx=32 --muse --pat=2

# python 1.0mm_3-shell_R3x3//comb_slice.py --dir jets_slice_032_Coilbch_all_blk_1x1x1_r_0.04_str_1x1x1_red_1  --method jets --slices 1 --parts 2 --key DWI
# python 1.0mm_3-shell_R3x3//comb_slice.py --dir jets_slice_032_Coilbch_all_blk_1x3x3_r_0.04_str_1x1x1_red_1  --method jets --slices 1 --parts 2 --key DWI
# python 1.0mm_3-shell_R3x3//comb_slice.py --dir jets_slice_032_Coilbch_all_blk_1x6x6_r_0.0_str_1x1x1_red_1  --method jets --slices 1 --parts 2 --key DWI
# python 1.0mm_3-shell_R3x3//comb_slice.py --dir jets_slice_032_Coilbch_all_blk_1x6x6_r_0.1_str_1x1x1_red_1  --method jets --slices 1 --parts 2 --key DWI
# python 1.0mm_3-shell_R3x3//comb_slice.py --dir jets_slice_032_Coilbch_all_blk_1x6x6_r_0.4_str_1x1x1_red_1  --method jets --slices 1 --parts 2 --key DWI
# python 1.0mm_3-shell_R3x3//comb_slice.py --dir jets_slice_032_Coilbch_all_blk_1x6x6_r_0.03_str_1x1x1_red_1  --method jets --slices 1 --parts 2 --key DWI
# python 1.0mm_3-shell_R3x3//comb_slice.py --dir jets_slice_032_Coilbch_all_blk_1x6x6_r_0.04_str_1x1x1_red_1  --method jets --slices 1 --parts 2 --key DWI
# python 1.0mm_3-shell_R3x3//comb_slice.py --dir jets_slice_032_Coilbch_all_blk_1x6x6_r_0.05_str_1x1x1_red_1  --method jets --slices 1 --parts 2 --key DWI
# python 1.0mm_3-shell_R3x3//comb_slice.py --dir jets_slice_032_Coilbch_all_blk_1x6x6_r_0.004_str_1x1x1_red_1  --method jets --slices 1 --parts 2 --key DWI
# python 1.0mm_3-shell_R3x3//comb_slice.py --dir jets_slice_032_Coilbch_all_blk_1x6x6_r_0.04_str_1x3x3_red_1  --method jets --slices 1 --parts 2 --key DWI
# python 1.0mm_3-shell_R3x3//comb_slice.py --dir jets_slice_032_Coilbch_all_blk_1x6x6_r_0.04_str_1x6x6_red_1  --method jets --slices 1 --parts 2 --key DWI
# python 1.0mm_3-shell_R3x3//comb_slice.py --dir jets_slice_032_Coilbch_all_blk_1x6x6_r_0.04_str_1x8x8_red_1  --method jets --slices 1 --parts 2 --key DWI
# python 1.0mm_3-shell_R3x3//comb_slice.py --dir jets_slice_032_Coilbch_all_blk_1x6x6_r_1.0_str_1x1x1_red_1  --method jets --slices 1 --parts 2 --key DWI
# python 1.0mm_3-shell_R3x3//comb_slice.py --dir jets_slice_032_Coilbch_all_blk_1x8x8_r_0.04_str_1x1x1_red_1  --method jets --slices 1 --parts 2 --key DWI
# python 1.0mm_3-shell_R3x3//comb_slice.py --dir jets_slice_032_Coilbch_all_blk_1x12x12_r_0.04_str_1x1x1_red_1  --method jets --slices 1 --parts 2 --key DWI

##3 splits
# python 1.0mm_3-shell_R3x3//comb_slice.py --dir jets_slice_032_splits_3  --method jets --slices 1 --parts 3 --key DWI

rm -r $TMPDIR/$SLURM_JOB_ID
