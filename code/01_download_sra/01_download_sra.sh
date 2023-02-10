#!/bin/bash

# load SRAtoolkit
module load sratoolkit

# --max-size to increase max download size
# -O to define output directory
# --force all if partial download exists and file is locked
prefetch SRR15666956 SRR15666957 SRR15666958 SRR15666959 SRR15666960 SRR15666961 --max-size 50GB -O /dcs04/lieber/marmaypag/Shi_mouseAMY_LIBD4125/raw-data/SRA