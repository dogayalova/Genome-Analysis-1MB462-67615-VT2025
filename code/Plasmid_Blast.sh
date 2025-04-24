#!/bin/bash
#SBATCH -A uppmax2025-3-3
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 05:00:00
#SBATCH -J plasmid_blast
#SBATCH -o plasmid_blast.out
#SBATCH -e plasmid_blast.err
#SBATCH --mail-user=dogayalova@gmail.com
#SBATCH --mail-type=ALL


# Load modules

module load bioinfo-tools
module load SeqKit/2.4.0
module load blast

# File paths

INPUT_FASTA=/home/doya3905/Genome-Analysis-1MB462-67615-VT2025/results/Genome-Assembly-PacBio/Canu-Assembly/E745.contigs.fasta
OUTPUT_DIR=/home/doya3905/Genome-Analysis-1MB462-67615-VT2025/results/Genome-Assembly-PacBio/Plasmid_Blast_Results


# Step 1: Extract small contigs (likely plasmids)

seqkit seq -M 2000000 $INPUT_FASTA > $OUTPUT_DIR/small_contigs.fasta

# Step 2: Run BLAST against NCBI nt database (remote)

blastn -query $OUTPUT_DIR/small_contigs.fasta -db nt -remote \
-out $OUTPUT_DIR/blast_results.txt \
-outfmt "6 qseqid sseqid pident length evalue bitscore stitle" \
-max_target_seqs 5

# Step 3: Filter hits that mention 'plasmid'

grep -i plasmid $OUTPUT_DIR/blast_results.txt > $OUTPUT_DIR/likely_plasmids.txt



