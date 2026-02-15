#/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com /Homebrew/install/HEAD/install.sh)"
 
# List of SRA accessions
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
 
# Loop through each SRA accession and download the FASTQ files
for sra in "${sra_files[@]}"
do
    echo "Downloading ${sra}..."
    fastq-dump --split-3 --gzip $sra
done

