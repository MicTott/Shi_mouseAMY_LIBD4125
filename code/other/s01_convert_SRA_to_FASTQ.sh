#!/bin/bash
#$ -cwd
#$ -pe local 6
#$ -l mem_free=16G
#$ -l h_vmem=16G
#$ -l h_fsize=200G
#$ -o ./logs/jobSubmit_tag-s01_convert_SRA_to_FASTQ_log_4.txt
#$ -e ./logs/jobSubmit_tag-s01_convert_SRA_to_FASTQ_log_$.txt
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


# files to download found below
# https://www.ncbi.nlm.nih.gov/biosample?Db=biosample&DbFrom=bioproject&Cmd=Link&LinkName=bioproject_biosample&LinkReadableName=BioSample&ordinalpos=1&IdsFromResult=758270
for f in SRR15666956 SRR15666957 SRR15666958 SRR15666959 SRR15666960 SRR15666961
do
    echo "Processing $f"
    # -gzip created zipped file
    # --spilt-files to seperate forward and reverse reads into seperate files
    # -O output directory   
    fasterq-dump --split-files /dcs04/lieber/marmaypag/Shi_mouseAMY_LIBD4125/raw-data/SRA/$f -O /dcs04/lieber/marmaypag/Shi_mouseAMY_LIBD4125/raw-data/FASTQ/

done

echo "**** Job ends ****"
date