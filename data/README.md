# Data Access

## RNA-seq Dataset

The RNA-seq dataset used in this project is publicly available:

- GEO Accession: GSE62718
- Organism: *Mus musculus*
- Tissue: Hippocampus
- Samples: 4 FOXP1 heterozygous knockout, 4 wild-type controls

### SRA Accessions

KO samples:
- SRR1630713
- SRR1630714
- SRR1630715
- SRR1630716

WT samples:
- SRR1630717
- SRR1630718
- SRR1630719
- SRR1630720

Raw FASTQ files can be downloaded using the SRA Toolkit:

```
fastq-dump --split-3 --gzip SRR1630713
```

---

## Reference Transcriptome

Salmon quantification was performed using a mouse reference transcriptome.
The exact reference version is described in the main project report.

---

## GWAS Data

Schizophrenia GWAS summary statistics used for MAGMA gene-level analysis were obtained from publicly available consortium data. These summary statistics are not included in this repository due to redistribution restrictions.

Researchers should obtain the appropriate GWAS summary statistics directly from the original source and run MAGMA according to the documentation.

---

## Notes

This repository does not include raw sequencing data or large GWAS summary statistics files. All analysis scripts required to reproduce the computational workflow are provided in the `scripts/` directory.
