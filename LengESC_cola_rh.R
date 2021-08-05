setwd("/omics/groups/OE0246/internal/guz/cola_hc/examples/LengESC")
library(cola)
library(scRNAseq)
data = readRDS('/omics/groups/OE0246/internal/guz/cola_hc/examples/LengESC/LengESC_data.rds')

mat = assays(data)$normcounts
mat = log2(mat + 1)
mat = adjust_matrix(mat)

anno = colData(data)
anno = as.data.frame(anno)

rh = hierarchical_partition(mat, subset = 500, cores = 4, anno = anno)
saveRDS(rh, file = "LengESC_cola_rh.rds")

cola_report(rh, output = "LengESC_cola_rh_report", title = "cola Report for Hierarchical Partitioning - 'LengESC'")
