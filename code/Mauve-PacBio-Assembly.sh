#!/bin/bash -l
#SBATCH -A uppmax2025-3-3
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 00:20:00
#SBATCH -J mauve_alignment
#SBATCH -o mauve.out
#SBATCH -e mauve.err
#SBATCH --mail-user=dogayalova@gmail.com
#SBATCH --mail-type=ALL


module load bioinfo-tools
module load mauve/2015-02-13


# Run progressiveMauve
progressiveMauve --output=mauve.xmfa /home/doya3905/Genome-Analysis-1MB462-67615-VT2025/results/Genome-Assembly-PacBio/Synteny-Comparison/Efaecalis.fna /home/doya3905/Genome-Analysis-1MB462-67615-VT2025/results/Genome-Assembly-PacBio/Prokka-Annotation/prokka/pacbio_assembly.fna

