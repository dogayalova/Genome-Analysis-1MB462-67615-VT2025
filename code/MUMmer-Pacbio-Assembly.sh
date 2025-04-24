#!/bin/bash
#SBATCH -A uppmax2025-3-3
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 01:00:00
#SBATCH -J mummer
#SBATCH -o mummer.out
#SBATCH -e mummer.err
#SBATCH --mail-user=dogayalova@gmail.com
#SBATCH --mail-type=ALL


module load bioinfo-tools
module load MUMmer/4.0.0rc1

QUERY_GENOME="/home/doya3905/Genome-Analysis-1MB462-67615-VT2025/results/Genome-Assembly-PacBio/Prokka-Annotation/prokka/pacbio_assembly.fna"     
REF_GENOME="/home/doya3905/Genome-Analysis-1MB462-67615-VT2025/results/Genome-Assembly-PacBio/Synteny-Comparison/MUMmer-Synteny-Comparison/Efaecium.fna"
OUT_PREFIX="assembly-vs-ref"

# Step 1: Align genomes
nucmer --prefix=$OUT_PREFIX $REF_GENOME $QUERY_GENOME

# Step 2: Filter alignments (1-to-1 best matches)
delta-filter -1 ${OUT_PREFIX}.delta > ${OUT_PREFIX}.filtered.delta

# Step 3: Create dot plot
mummerplot --png --layout -p $OUT_PREFIX ${OUT_PREFIX}.filtered.delta


