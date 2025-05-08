#!/bin/bash
#SBATCH -A uppmax2025-3-3
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 04:00:00
#SBATCH -J RNA-BH-Map-BWA
#SBATCH -o RNA-BH-map-bwa.out
#SBATCH -e RNA-BH-map-bwa.err
#SBATCH --mail-user=dogayalova@gmail.com
#SBATCH --mail-type=ALL

module load bioinfo-tools
module load bwa
module load samtools

# === Paths ===
INPUT_DIR=/proj/uppmax2025-3-3/Genome_Analysis/1_Zhang_2017/transcriptomics_data/RNA-Seq_BH
OUTDIR=/home/doya3905/Genome-Analysis-1MB462-67615-VT2025/results/RNA/BH-Mapped-BWA
REF_GENOME=/home/doya3905/Genome-Analysis-1MB462-67615-VT2025/results/Genome-Assembly-PacBio/Canu-Assembly/E745.contigs.fasta

# === Step 1: Index the reference genome ===
bwa index $REF_GENOME

# === Step 2: Mapping ===
for SAMPLE in ERR1797972 ERR1797973 ERR1797974
do
  READ1=${INPUT_DIR}/trim_paired_${SAMPLE}_pass_1.fastq.gz
  READ2=${INPUT_DIR}/trim_paired_${SAMPLE}_pass_2.fastq.gz

  OUT_SAM=${OUTDIR}/${SAMPLE}_mapped.sam
  OUT_BAM=${OUTDIR}/${SAMPLE}_mapped.sorted.bam

  # Align reads
  bwa mem -M $REF_GENOME $READ1 $READ2 > $OUT_SAM

  # Convert SAM to sorted BAM and index
  samtools view -@ 8 -bS $OUT_SAM | samtools sort -@ 8 -o $OUT_BAM
  samtools index $OUT_BAM

  # Optional: Remove SAM file to save space
  rm ${OUTDIR}/${SAMPLE}_mapped.sam

done

