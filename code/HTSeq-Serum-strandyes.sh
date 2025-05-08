#!/bin/bash
#SBATCH -A uppmax2025-3-3
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 05:00:00
#SBATCH -J htseq_count_serum
#SBATCH -o htseq_count_serum.out
#SBATCH -e htseq_count_serum.err
#SBATCH --mail-user=dogayalova@gmail.com
#SBATCH --mail-type=ALL


# Load modules
module load bioinfo-tools
module load htseq

# Define paths
OUTDIR=/proj/uppmax2025-3-3/nobackup/work/doga
GFF=/proj/uppmax2025-3-3/nobackup/work/doga/pacbio_assembly_no_fasta.gff
BAMDIR=/proj/uppmax2025-3-3/nobackup/work/doga


# Serum samples
htseq-count -f bam -r pos -s yes -t CDS -i ID $BAMDIR/ERR1797969_mapped.sorted.bam $GFF > $OUTDIR/ERR1797969_counts_yes.txt 
 
htseq-count -f bam -r pos -s yes -t CDS -i ID $BAMDIR/ERR1797970_mapped.sorted.bam $GFF > $OUTDIR/ERR1797970_counts_yes.txt 

htseq-count -f bam -r pos -s yes -t CDS -i ID $BAMDIR/ERR1797971_mapped.sorted.bam $GFF > $OUTDIR/ERR1797971_counts_yes.txt 
