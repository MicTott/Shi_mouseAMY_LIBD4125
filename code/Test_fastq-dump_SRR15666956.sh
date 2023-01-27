#!/bin/bash

# load SRAtoolkit
module load sratoolkit

# -X how many reads to convert
# -gzip created zipped file
# --spilt-files to seperate forward and reverse reads into seperate files
# -O output directory
time fastq-dump -X 1000 --gzip --split-files SRR15666956 -O /dcs04/lieber/marmaypag/Shi_mouseAMY_LIBD4125/raw-data/FASTQ