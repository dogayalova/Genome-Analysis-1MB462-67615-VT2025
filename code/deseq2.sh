#!/bin/bash
#SBATCH -A uppmax2025-3-3
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 02:00:00
#SBATCH -J deseq2
#SBATCH -o deseq2.out
#SBATCH -e deseq2.err
#SBATCH --mail-user=dogayalova@gmail.com
#SBATCH --mail-type=ALL

module load bioinfo-tools
module load R/4.4.2
module load DESeq2/1.36.0
cd /proj/uppmax2025-3-3/nobackup/work/doga
Rscript deseq2_analysis.R

