#!/bin/bash
#SBATCH -A uppmax2025-3-3
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 02:00:00
#SBATCH -J RNA-BH-trim_reads
#SBATCH -o RNA-BH-trim.out
#SBATCH -e RNA-BH-trim.err
#SBATCH --mail-user=dogayalova@gmail.com
#SBATCH --mail-type=ALL

module load bioinfo-tools
module load trimmomatic

INPUT_DIR=/proj/uppmax2025-3-3/Genome_Analysis/1_Zhang_2017/transcriptomics_data/RNA-Seq_BH
OUTDIR=/home/doya3905/Genome-Analysis-1MB462-67615-VT2025/results/RNA/BH-Trimmed


for SAMPLE in ERR1797972 ERR1797973 ERR1797974
do
  READ1=${INPUT_DIR}/trim_paired_${SAMPLE}_pass_1.fastq.gz
  READ2=${INPUT_DIR}/trim_paired_${SAMPLE}_pass_2.fastq.gz

  OUT_P1=${OUTDIR}/trim_paired_${SAMPLE}_pass_1_v2.fastq.gz
  OUT_U1=${OUTDIR}/trim_single_${SAMPLE}_pass_1_v2.fastq.gz
  OUT_P2=${OUTDIR}/trim_paired_${SAMPLE}_pass_2_v2.fastq.gz
  OUT_U2=${OUTDIR}/trim_single_${SAMPLE}_pass_2_v2.fastq.gz

  trimmomatic PE -threads 1 \
    $READ1 $READ2 \
    $OUT_P1 $OUT_U1 \
    $OUT_P2 $OUT_U2 \
    ILLUMINACLIP:/sw/bioinfo/trimmomatic/0.39/rackham/adapters/TruSeq3-PE.fa:2:30:10 \
    LEADING:3 TRAILING:3 SLIDINGWINDOW:4:20 MINLEN:50
done
