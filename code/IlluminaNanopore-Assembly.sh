#!/bin/bash
#SBATCH -A uppmax2025-3-3
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 05:00:00
#SBATCH -J spades
#SBATCH -o spades.out
#SBATCH -e spades.err
#SBATCH --mail-user=dogayalova@gmail.com
#SBATCH --mail-type=ALL

module load bioinfo-tools
module load spades/4.0.0

spades.py --pe1-1 /home/doya3905/Genome-Analysis-1MB462-67615-VT2025/results/Genome-Assembly-IlluminaNanopore/Illumina-Trimming/E745_R1_paired.fastq.gz --pe1-2 /home/doya3905/Genome-Analysis-1MB462-67615-VT2025/results/Genome-Assembly-IlluminaNanopore/Illumina-Trimming/E745_R2_paired.fastq.gz --nanopore /proj/uppmax2025-3-3/Genome_Analysis/1_Zhang_2017/genomics_data/Nanopore/E745_all.fasta.gz -o /home/doya3905/Genome-Analysis-1MB462-67615-VT2025/results/Genome-Assembly-IlluminaNanopore/IlluminaNanopore-Assembly

