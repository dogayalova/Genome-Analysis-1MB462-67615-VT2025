# Load DESeq2
library("DESeq2")

# Set working directory to where the count files are
setwd("/proj/uppmax2025-3-3/nobackup/work/doga")

# List of your HTSeq count files
count_files <- c(
  "ERR1797969_counts_yes.txt",
  "ERR1797970_counts_yes.txt",
  "ERR1797971_counts_yes.txt",
  "ERR1797972_counts_yes.txt",
  "ERR1797973_counts_yes.txt",
  "ERR1797974_counts_yes.txt"
)

# Sample condition metadata
sample_info <- data.frame(
  sampleName = count_files,
  fileName = count_files,
  condition = c("Serum", "Serum", "Serum", "BH", "BH", "BH")
)

# Create DESeq2 dataset from HTSeq output
dds <- DESeqDataSetFromHTSeqCount(
  sampleTable = sample_info,
  design = ~ condition
)

# Filter out low count genes
dds <- dds[rowSums(counts(dds)) > 1, ]

# Run DESeq2
dds <- DESeq(dds)

# Results
res <- results(dds)
res <- lfcShrink(dds, coef=2, res=res) # For accurate log2 fold change

# Order by adjusted p-value
res_ordered <- res[order(res$padj), ]

# Save results
write.csv(as.data.frame(res_ordered), file = "deseq2_results.csv")

# Optional: Plot MA plot
pdf("MA_plot.pdf")
plotMA(res, main="DESeq2 MA-Plot", ylim=c(-5,5))
dev.off()

# Optional: Volcano plot
library(EnhancedVolcano)
pdf("volcano_plot.pdf")
EnhancedVolcano(res,
    lab = rownames(res),
    x = 'log2FoldChange',
    y = 'pvalue',
    pCutoff = 0.05,
    FCcutoff = 1.5,
    title = 'Differential Expression: BH vs Serum')
dev.off()

