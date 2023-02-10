#!/bin/bash
#$ -cwd
#$ -l mem_free=8G,h_vmem=8G,h_fsize=100G
#$ -pe local 8
#$ -N Shi_mouseAMY_LIBD4125_cellranger
#$ -o logs/cellranger.$TASK_ID.txt
#$ -e logs/cellranger.$TASK_ID.txt
#$ -m e
#$ -t 1-6
#$ -tc 10

echo "**** Job starts ****"
date

echo "**** JHPCE info ****"
echo "User: ${USER}"
echo "Job id: ${JOB_ID}"
echo "Job name: ${JOB_NAME}"
echo "Hostname: ${HOSTNAME}"
echo "Task id: ${SGE_TASK_ID}"

## load CellRanger
module load cellranger/7.0.0

## List current modules for reproducibility
module list

## Locate file
SAMPLE=$(awk "NR==${SGE_TASK_ID}" 01_cellranger.txt)
echo "Processing sample ${SAMPLE}"
date

## Run CellRanger
cellranger count --id=${SAMPLE} \
    --transcriptome=/dcs04/lieber/lcolladotor/annotationFiles_LIBD001/10x/refdata-gex-mm10-2020-A \
    --fastqs=/dcs04/lieber/marmaypag/Shi_mouseAMY_LIBD4125/raw-data/FASTQ/${SAMPLE} \
    --sample=${SAMPLE} \
    --jobmode=local \
    --localcores=8 \
    --localmem=64

## Move output
echo "Moving data to new location"
date
mkdir -p /dcs04/lieber/marmaypag/Shi_mouseAMY_LIBD4125/processed-data/01_cellranger/
mv ${SAMPLE} /dcs04/lieber/marmaypag/Shi_mouseAMY_LIBD4125/processed-data/01_cellranger/

echo "**** Job ends ****"
date