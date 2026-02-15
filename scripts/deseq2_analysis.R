# Load the relevant libraries
library(tximport)
library(DESeq2)
 
# Define the directory path
dir_path <- "/Users/daraomurchu/Downloads/"
 
# List all subdirectories
subdirs <- list.dirs(dir_path, full.names = TRUE, recursive = FALSE)
 
# List the quant.sf files within each subdirectory
quant_files <- unlist(lapply(subdirs, function(subdir) {
  list.files(subdir, pattern = "quant.sf", full.names = TRUE)
}))
 
# Print the files to check if they are correctly listed
print(quant_files)

# Check if the number of files is as expected
if (length(quant_files) != 8) {
  stop("The number of quant.sf files found does not match the expected number (8). Check the directory and pattern.")
}

# Define Sample Names
sample_names <- c("SRR1630713","SRR1630714", "SRR1630715", "SRR1630716", "SRR1630717","SRR1630718","SRR1630719","SRR1630720")
 
# Create a sample table
sample_table <- data.frame(
  sampleName = sample_names,
  fileName = quant_files,
  condition = factor(rep(c("knockout", "control"), each = 4))
)
 
# Print the sample table to ensure it's correct
print(sample_table)
 
# Read in Salmon quantification data
txi <- tximport(quant_files, type = "salmon", txOut = TRUE)
 
# Create DESeq2 dataset
dds <- DESeqDataSetFromTximport(txi,
                                colData = sample_table,
                                design = ~ condition)
 
# Pre-filtering
dds <- dds[ rowSums(counts(dds)) > 1, ]
 
# Run the DESeq2 pipeline
dds <- DESeq(dds)
 
# Results
res <- results(dds)
 
# Output results to a file
write.csv(as.data.frame(res), 
          file = "/Users/daraomurchu/Downloads/deseq2_results_M.csv")

