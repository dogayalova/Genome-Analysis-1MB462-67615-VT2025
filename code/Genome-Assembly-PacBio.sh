#!/bin/bash
#SBATCH -A uppmax2025-3-3
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 05:00:00
#SBATCH -J canu_assembly
#SBATCH -o canu.out
#SBATCH -e canu.err
#SBATCH --mail-user dogayalova@gmail.com

module purge
module load bioinfo-tools
module load canu/2.2


# Run Canu
canu -p E745 -d /home/doya3905/Genome-Analysis-1MB462-67615-VT2025/Genome-Assembly-PacBio genomeSize=2.8m \
     -pacbio-raw /proj/uppmax2025-3-3/Genome_Analysis/1_Zhang_2017/genomics_data/PacBio/* \
     


#-p E745: prefix for output files
#-d /home/doya3905/Genome-Analysis-1MB462-67615-VT2025/Genome-Assembly-PacBio: folder where output will go
#genomeSize=2.8m: estimate of genome size in megabases (adjust this for E. faecium)
#-pacbio: you’re using PacBio reads
#maxThreads = 1 specifies the number of cores used
#useGrid=false: if you're not using Canu's grid mode (makes it simpler on HPC)

