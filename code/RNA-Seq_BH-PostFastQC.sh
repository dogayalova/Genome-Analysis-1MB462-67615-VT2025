#!/bin/bash
#SBATCH -A uppmax2025-3-3
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 01:00:00
#SBATCH -J post-fastqc-RNA-BH
#SBATCH -o post-fastqc-RNA-BH.out
#SBATCH -e post-fastqc-RNA-BH.err
#SBATCH --mail-user=dogayalova@gmail.com
#SBATCH --mail-type=ALL


# Load FastQC module
module load bioinfo-tools
module load FastQC


# Run FastQC 
fastqc --outdir /home/doya3905/Genome-Analysis-1MB462-67615-VT2025/results/RNA/PostFastQC-RNA-seq_BH \
/home/doya3905/Genome-Analysis-1MB462-67615-VT2025/results/RNA/BH-Trimmed/*

