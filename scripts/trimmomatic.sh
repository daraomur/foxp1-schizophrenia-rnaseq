#!/usr/bin/env bash
set -euo pipefail

# Path to Trimmomatic executable
TRIMMOMATIC_JAR="/Users/daraomurchu/miniconda3/envs/sra_env/bin/trimmomatic"

# Path to adapter file
ADAPTER_FILE="$CONDA_PREFIX/share/trimmomatic/adapters/TruSeq3-PE.fa"

# Loop through all paired FASTQ files in the current directory
for file in *_1.fastq.gz; do
    # Extract base names (e.g., SRRxxxx from SRRxxxx_1.fastq.gz)
    BASENAME=$(basename "$file" _1.fastq.gz)

    # Define input file names for paired-end reads
    FORWARD_READ="${BASENAME}_1.fastq.gz"
    REVERSE_READ="${BASENAME}_2.fastq.gz"

    # Define output file names (gzipped to match your Salmon script)
    OUTPUT_FORWARD_PAIRED="${BASENAME}_1.paired.trimmed.fastq.gz"
    OUTPUT_FORWARD_UNPAIRED="${BASENAME}_1.unpaired.trimmed.fastq.gz"
    OUTPUT_REVERSE_PAIRED="${BASENAME}_2.paired.trimmed.fastq.gz"
    OUTPUT_REVERSE_UNPAIRED="${BASENAME}_2.unpaired.trimmed.fastq.gz"

    # Run Trimmomatic for paired-end reads
    echo "Trimming $FORWARD_READ and $REVERSE_READ using TruSeq3-PE adapters..."
    "$TRIMMOMATIC_JAR" PE -phred33 \
        "$FORWARD_READ" "$REVERSE_READ" \
        "$OUTPUT_FORWARD_PAIRED" "$OUTPUT_FORWARD_UNPAIRED" \
        "$OUTPUT_REVERSE_PAIRED" "$OUTPUT_REVERSE_UNPAIRED" \
        ILLUMINACLIP:"$ADAPTER_FILE":2:30:10 \
        LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36

    echo "Finished trimming $FORWARD_READ and $REVERSE_READ."
    echo "Paired outputs: $OUTPUT_FORWARD_PAIRED, $OUTPUT_REVERSE_PAIRED"
done
