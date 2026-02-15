# FOXP1-Regulated Gene Networks and Schizophrenia Risk

## Project Overview

This project investigates the contribution of FOXP1-regulated genes to schizophrenia risk using transcriptomic analysis of a heterozygous _FOXP1_ knockout mouse model.

The study integrates:

- RNA-seq differential expression analysis  
- Functional enrichment analysis  
- Cross-species gene mapping  
- Integration with schizophrenia GWAS data  
- Regulatory variant annotation  

The objective was to determine whether transcriptional disruption of FOXP1-regulated genes overlaps with known genetic risk architecture for schizophrenia.

---

## Dataset

- **GEO Accession:** GSE62718  
- **Species:** *Mus musculus*  
- **Tissue:** Hippocampus  
- **Total samples:** 8  
  - 4 FOXP1 heterozygous knockout  
  - 4 Wild-type controls  

### SRA Accessions

- KO: `SRR1630713`, `SRR1630714`, `SRR1630715`, `SRR1630716`  
- WT: `SRR1630717`, `SRR1630718`, `SRR1630719`, `SRR1630720`  

---

## Workflow Summary

```
SRA → FASTQ → QC → Trimming → Salmon quantification → DESeq2 → ORA → MAGMA → Variant annotation
```

---

## Analysis Pipeline

### 1. Data Acquisition
- SRA Toolkit (`fastq-dump`)

### 2. Quality Control
- FastQC

### 3. Adapter Trimming
- Trimmomatic (TruSeq3-PE adapters)

### 4. Transcript Quantification
- Salmon (quasi-mapping with selective alignment)

### 5. Differential Expression
- `tximport`
- DESeq2  
- Design formula: `~ condition`

### 6. Functional Enrichment
- ConsensusPathDB (ORA)
- SynGO synaptic ontology enrichment

### 7. GWAS Integration
- MAGMA gene-level association testing
- Mouse-to-human homolog mapping

### 8. Variant Annotation
- Ensembl VEP
- HaploReg
- GTEx
- RegulomeDB

---

## Differential Expression Results

- **30,949 genes analysed**
- **2,255 genes significant at FDR < 0.05**
- **305 genes significant at FDR < 0.001**

The 305 most significant genes were prioritised for downstream functional enrichment and GWAS integration.

---

## Functional Enrichment Findings

Overrepresentation analysis revealed significant enrichment in:

- Synaptic signalling pathways  
- Ion transport processes  
- Postsynaptic membrane components  

SynGO analysis supported synaptic localisation and signalling-related functional enrichment.

---

## GWAS Integration Results

- 232 human homologs of FOXP1-regulated genes were analysed using MAGMA  
- No significant global gene-set enrichment observed (p = 0.37)  
- However, individual candidate genes were identified:

  - **ITIH3**
  - **ITPR3**
  - **EFNA5**
  - **ZSWIM6**

---

## Candidate Variant Highlight

- Missense variant **rs3617** in **ITIH3**
- Annotated using VEP, HaploReg, GTEx, and RegulomeDB
- Identified as a potential functional regulatory candidate

---

## Repository Structure

```
scripts/
    fastq_dump.sh
    trimmomatic.sh
    salmon.sh
    deseq2_analysis.R

results/
    deseq2_results.xls
    ora_results_scz.xls
    regulomedb_results.tsv
```

---

## Reproducibility Notes

- All scripts used in the RNA-seq analysis pipeline are provided in the `scripts/` directory.
- Differential expression analysis was performed using DESeq2 with transcript-level quantification from Salmon.
- External tools (MAGMA, CPDB, SynGO, VEP, HaploReg, GTEx, RegulomeDB) were run following their respective documentation.
- Full methodological detail is provided in the final project report.

---

## Author

**Dara Ó Murchú**  
BSc Genetics and Genomics  
Final Year Project

