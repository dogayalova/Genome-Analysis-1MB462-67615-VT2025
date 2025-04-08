#!/bin/bash
#SBATCH -A uppmax2025-3-3
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 00:10:00
#SBATCH -J quast
#SBATCH -o quast.out
#SBATCH -e quast.err
#SBATCH --mail-user=dogayalova@gmail.com
#SBATCH --mail-type=ALL


# Load modules
module load bioinfo-tools
module load quast/5.0.2

# Run QUAST
quast.py /home/doya3905/Genome-Analysis-1MB462-67615-VT2025/Genome-Assembly-PacBio/Canu-Assembly/E745.contigs.fasta \
  -o /home/doya3905/Genome-Analysis-1MB462-67615-VT2025/Genome-Assembly-PacBio/QUAST-After-Assembly\
  -t 1\

# --min-contig 500 could be used 
