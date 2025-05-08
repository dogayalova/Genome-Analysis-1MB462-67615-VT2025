#!/bin/bash
#SBATCH -A uppmax2025-3-3
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 04:00:00
#SBATCH -J htseq_count_BH
#SBATCH -o htseq_count_BH.out
#SBATCH -e htseq_count_BH.err
#SBATCH --mail-user=dogayalova@gmail.com
#SBATCH --mail-type=ALL

# Load modules
module load bioinfo-tools
module load htseq

# Define paths
OUTDIR=/proj/uppmax2025-3-3/nobackup/work/doga
GFF=/proj/uppmax2025-3-3/nobackup/work/doga/pacbio_assembly_no_fasta.gff
BAMDIR=/home/doya3905/Genome-Analysis-1MB462-67615-VT2025/results/RNA/BH-Mapped-BWA

# BH samples
htseq-count -f bam -r pos -s yes -t CDS -i ID $BAMDIR/ERR1797972_mapped.sorted.bam $GFF > $OUTDIR/ERR1797972_counts_yes.txt 

htseq-count -f bam -r pos -s yes -t CDS -i ID $BAMDIR/ERR1797973_mapped.sorted.bam $GFF > $OUTDIR/ERR1797973_counts_yes.txt 

htseq-count -f bam -r pos -s yes -t CDS -i ID $BAMDIR/ERR1797974_mapped.sorted.bam $GFF > $OUTDIR/ERR1797974_counts_yes.txt 


