#!/bin/bash
#SBATCH -A uppmax2025-3-3
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 00:10:00
#SBATCH -J trim_reads
#SBATCH -o trim.out
#SBATCH -e trim.err
#SBATCH --mail-user=dogayalova@gmail.com
#SBATCH --mail-type=ALL


module load bioinfo-tools
module load trimmomatic/0.39


READ1=/proj/uppmax2025-3-3/Genome_Analysis/1_Zhang_2017/genomics_data/Illumina/E745-1.L500_SZAXPI015146-56_1_clean.fq.gz

READ2=/proj/uppmax2025-3-3/Genome_Analysis/1_Zhang_2017/genomics_data/Illumina/E745-1.L500_SZAXPI015146-56_2_clean.fq.gz

OUTDIR=/home/doya3905/Genome-Analysis-1MB462-67615-VT2025/Genome-Assembly-IlluminaNanopore/Illumina-Trimming


trimmomatic PE -threads 1 \
  $READ1 $READ2 \
  $OUTDIR/E745_R1_paired.fastq.gz $OUTDIR/E745_R1_unpaired.fastq.gz \
  $OUTDIR/E745_R2_paired.fastq.gz $OUTDIR/E745_R2_unpaired.fastq.gz \
  ILLUMINACLIP:/sw/apps/bioinfo/trimmomatic/0.39/rackham/adapters/TruSeq3-PE.fa:2:30:10 \
  LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36

