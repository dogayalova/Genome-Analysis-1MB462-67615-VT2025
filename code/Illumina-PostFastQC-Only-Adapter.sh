#!/bin/bash
#SBATCH -A uppmax2025-3-3
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 00:15:00
#SBATCH -J post-fastqc-illumina-only-adapter
#SBATCH -o post-fastqc-illumina-only-adapter.out
#SBATCH -e post-fastqc-illumina-only-adapter.err
#SBATCH --mail-user=dogayalova@gmail.com
#SBATCH --mail-type=ALL


# Load FastQC module
module load bioinfo-tools
module load FastQC


# Run FastQC on all Illumina reads 
fastqc /home/doya3905/Genome-Analysis-1MB462-67615-VT2025/results/Genome-Assembly-IlluminaNanopore/Illumina-Trimming-Only-Adapter/*fastq.gz\
       --outdir /home/doya3905/Genome-Analysis-1MB462-67615-VT2025/results/Genome-Assembly-IlluminaNanopore/Illumina-PostFastQC-Only-Adapter
