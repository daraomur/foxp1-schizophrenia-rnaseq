#!/usr/bin/env bash
set -euo pipefail

# Download FASTQ files from SRA accessions using fastq-dump
# Requirements: SRA Toolkit installed and in PATH

OUTDIR="data/raw"
mkdir -p "$OUTDIR"

sra_files=(
  SRR1630713
  SRR1630714
  SRR1630715
  SRR1630716
  SRR1630717
  SRR1630718
  SRR1630719
  SRR1630720
)

for sra in "${sra_files[@]}"; do
  echo "Downloading ${sra}..."
  fastq-dump --split-3 --gzip -O "$OUTDIR" "$sra"
done

echo "Done. Files saved in: $OUTDIR"
