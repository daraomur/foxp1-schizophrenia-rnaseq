#!/usr/bin/env bash
set -euo pipefail

# Path to Salmon index
INDEX="salmon_index"

# Output directory
OUTDIR="salmon_out"
mkdir -p "$OUTDIR"

# List of sample IDs
SAMPLES=(
  SRR1630713 SRR1630714 SRR1630715 SRR1630716
  SRR1630717 SRR1630718 SRR1630719 SRR1630720
)

for SAMPLE in "${SAMPLES[@]}"; do
  echo "Running Salmon for ${SAMPLE}..."

  salmon quant \
    -i "$INDEX" \
    -l A \
    -1 "${SAMPLE}_1.paired.trimmed.fastq" \
    -2 "${SAMPLE}_2.paired.trimmed.fastq" \
    --validateMappings \
    --threads 4 \
    -o "${OUTDIR}/${SAMPLE}"

done

echo "Salmon quantification complete."
