#!/bin/bash
#$ -pe local 10
#$ -l mem_free=64G
#$ -l h_fsize=100G
#$ -o /dcs04/lieber/marmaypag/Shi_mouseAMY_LIBD4125/FASTQ
#$ -m e
#$ -M michael.totty@libd.org

# load SRAtoolkit
module load sratoolkit

# change directory to ensure local. sra files are found
# otherwise, fastq-dump will re-download .sra files and take way longer
/dcs04/lieber/marmaypag/Shi_mouseAMY_LIBD4125/raw-data/SRA

# -gzip created zipped file
# --spilt-files to seperate forward and reverse reads into seperate files
# -O output directory
fastq-dump --gzip --split-files SRR15666956 SRR15666957 SRR15666958 SRR15666959 SRR15666960 SRR15666961 -O /dcs04/lieber/marmaypag/Shi_mouseAMY_LIBD4125/raw-data/FASTQ