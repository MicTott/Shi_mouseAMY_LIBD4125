#!/bin/bash
#$ -cwd
#$ -pe local 6
#$ -l mem_free=16G
#$ -l h_vmem=16G
#$ -l h_fsize=200G
#$ -o ./logs/jobSubmit_tag-s02_gzip_fastq.txt
#$ -e ./logs/jobSubmit_tag-s01_gzip_fastq.txt
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

# zip fastq files
gzip /dcs04/lieber/marmaypag/Shi_mouseAMY_LIBD4125/raw-data/FASTQ/*.fastq

echo "**** Job ends ****"
date