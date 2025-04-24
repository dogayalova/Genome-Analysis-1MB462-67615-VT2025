#!/bin/bash
#SBATCH -A uppmax2025-3-3
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 01:00:00
#SBATCH -J quast_illumina_notrim
#SBATCH -o quast_illumina_notrim.out
#SBATCH -e quast_illumina_notrim.err
#SBATCH --mail-user=dogayalova@gmail.com
#SBATCH --mail-type=ALL


# Load modules
module load bioinfo-tools
module load quast/5.0.2

# Run QUAST
quast.py /home/doya3905/Genome-Analysis-1MB462-67615-VT2025/results/Genome-Assembly-IlluminaNanopore/IlluminaNanopore-Assembly-Without-Trimming/contigs.fasta \
  -o /home/doya3905/Genome-Analysis-1MB462-67615-VT2025/results/Genome-Assembly-IlluminaNanopore/IlluminaNanopore-Assembly-Without-Trimming-QUAST\
  -t 1\

# --min-contig 500 could be used 
