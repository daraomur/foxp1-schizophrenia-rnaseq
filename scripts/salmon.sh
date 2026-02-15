#!/bin/bash
 
# Define the index and other parameters
INDEX="salmon_index"
 
# List of sample IDs
SAMPLES=("SRR1630713" "SRR1630714" "SRR1630715" "SRR1630716" "SRR1630717" "SRR1630718" "SRR1630719" "SRR1630720")
 
# Loop through each sample ID
for SAMPLE in "${SAMPLES[@]}"
do
# Run salmon quant
salmon quant -i $INDEX -l A -r ${SAMPLE}_1.paired.trimmed.fastq -2 ${SAMPLE}_2.paired.trimmed.fastq --validateMappings -o salmon_out/${SAMPLE} --threads 3
  
done

