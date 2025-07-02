#!/bin/bash
#SBATCH --job-name=panet_pitti       # nome del job
#SBATCH --output=panet_pitti_%j.out  # stdout → panet_pitti_<jobid>.out
#SBATCH --error=panet_pitti_%j.err   # stderr → panet_pitti_<jobid>.err
#SBATCH --time=10:00:00              # tempo massimo HH:MM:SS
#SBATCH --nodes=1                    # 1 nodo
#SBATCH --ntasks=1                   # 1 task
#SBATCH --cpus-per-task=4            # CPU cores per task
#SBATCH --mem=40G                    # RAM per nodo
#SBATCH --gres=gpu:1                 # 1 GPU
#SBATCH --partition=gn02_a40-high   # scegli la partizione giusta

# --- Carica i moduli necessari ---
module purge
module load amd/gcc-8.5.0/miniforge3
module load amd/slurm

# --- Attiva conda e l'env CUDA ---
source $(conda info --base)/etc/profile.d/conda.sh
conda activate myenv

# --- Vai nella cartella del progetto ---
cd /home/fruffini/mcastiello/CAPL/GFS-Seg        # entra nella cartella
sh train.sh pitti split0_5shot --use_pitti



