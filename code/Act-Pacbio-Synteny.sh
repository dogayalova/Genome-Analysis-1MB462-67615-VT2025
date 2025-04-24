#!/bin/bash
#SBATCH -A uppmax2025-3-3
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 00:30:00
#SBATCH -J blast_for_ACT
#SBATCH -o blast_for_ACT.out
#SBATCH -e blast_for_ACT.err
#SBATCH --mail-user=dogayalova@gmail.com
#SBATCH --mail-type=ALL

module load bioinfo-tools
module load blast
module load python

# Paths to your files

FASTA_FILE="/home/doya3905/Genome-Analysis-1MB462-67615-VT2025/results/Genome-Assembly-PacBio/Synteny-Comparison/Act-Syteny-Comparison/Efaecalis.fna"
BLAST_DB_DIR="/home/doya3905/Genome-Analysis-1MB462-67615-VT2025/results/Genome-Assembly-PacBio/Synteny-Comparison/Act-Syteny-Comparison/efaecalis_db"
QUERY_FILE="/home/doya3905/Genome-Analysis-1MB462-67615-VT2025/results/Genome-Assembly-PacBio/Prokka-Annotation/prokka/pacbio_assembly.fna"
BLAST_OUT="/home/doya3905/Genome-Analysis-1MB462-67615-VT2025/results/Genome-Assembly-PacBio/Synteny-Comparison/Act-Syteny-Comparison/efaecalis_vs_efaecium.blast"



makeblastdb -in "$FASTA_FILE" -dbtype nucl -out "$BLAST_DB_DIR"

#Perform BLAST search with the query

blastn -query "$QUERY_FILE" \
       -db "$BLAST_DB_DIR" \
       -outfmt 6 \
       -out "$BLAST_OUT"



