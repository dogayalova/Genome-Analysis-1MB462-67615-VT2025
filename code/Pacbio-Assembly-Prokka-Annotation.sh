#!/bin/bash
#SBATCH -A uppmax2025-3-3
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 00:15:00
#SBATCH -J annotation
#SBATCH -o prokka.out
#SBATCH -e prokka.err
#SBATCH --mail-user=dogayalova@gmail.com
#SBATCH --mail-type=ALL


module load bioinfo-tools
module load prokka


OUTPUT_DIR="/home/doya3905/Genome-Analysis-1MB462-67615-VT2025/results/Genome-Assembly-PacBio/Prokka-Annotation"
GENOME_FILE="/home/doya3905/Genome-Analysis-1MB462-67615-VT2025/results/Genome-Assembly-PacBio/Canu-Assembly/E745.contigs.fasta"


prokka --outdir ${OUTPUT_DIR}/prokka --prefix pacbio_assembly --genus Enterococcus --species faecium ${GENOME_FILE}

