#!/bin/bash
#$ -l mem_free=128G
#$ -l h_vmem=128G
#$ -l h_fsize=200G
#$ -o logs/mouseAmy_convert_SRA.txt
#$ -e logs/mouseAmy_convert_SRA.txt
#$ -m e
#$ -M michael.totty@libd.org

echo "**** Job starts ****"
date

echo "**** JHPCE info ****"
echo "User: ${USER}"
echo "Job id: ${JOB_ID}"
echo "Job name: ${JOB_NAME}"
echo "Hostname: ${HOSTNAME}"
echo "Task id: ${SGE_TASK_ID}"

# load SRAtoolkit
module load sratoolkit

# change directory to ensure local. sra files are found
# otherwise, fastq-dump will re-download .sra files and take way longer
/dcs04/lieber/marmaypag/Shi_mouseAMY_LIBD4125/raw-data/SRA

# -gzip created zipped file
# --spilt-files to seperate forward and reverse reads into seperate files
# -O output directory
# all files SRR15666956 SRR15666957 SRR15666958 SRR15666959 SRR15666960 SRR15666961
fastq-dump --gzip --split-files SRR15666956 -O /dcs04/lieber/marmaypag/Shi_mouseAMY_LIBD4125/raw-data/FASTQ


echo "**** Job ends ****"
date