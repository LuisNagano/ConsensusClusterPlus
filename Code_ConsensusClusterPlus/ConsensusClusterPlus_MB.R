setwd("C:/Users/bruep/OneDrive/Área de Trabalho/ClusterConsensusPlus/Analises_2024")

# Carregar os datasets
df <- read.delim("C:/Users/bruep/OneDrive/Área de Trabalho/ClusterConsensusPlus/MB_167_Pfister_RNAseq_completo.txt", row.names = 1)
lncRNAs_vector <- read.table("C:/Users/bruep/OneDrive/Área de Trabalho/ClusterConsensusPlus/lncRNAs_vector.txt", row.names = NULL, quote = "\"", comment.char = "")
mRNAs_vector <- read.table("C:/Users/bruep/OneDrive/Área de Trabalho/ClusterConsensusPlus/mRNAs_vector.txt", row.names = NULL, quote = "\"", comment.char = "")

# Selecionar os lncRNAs e mRNAs que estão presentes nos rownames do dataset df
df_l <- df[rownames(df) %in% lncRNAs_vector$V1, ]
df_m <- df[rownames(df) %in% mRNAs_vector$V1, ]

# Verificar se os datasets foram criados corretamente
head(df_l)
head(df_m)

# Expression Matrix data
mydata <- as.matrix(df_l)

# Seleção dos 5000 genes com maior variância
# Corrigido para usar var() ao invés de mad(), se o objetivo for variância
variances <- apply(mydata, 1, var)
mydata <- mydata[rev(order(variances))[1:5000], ]

# Selecione os top 5000 genes com maior variância
top_genes <- names(sort(variances, decreasing = TRUE))[1:5000]
write.csv(top_genes, file = "top_5000_genes.csv", row.names = FALSE)

# Subtrair a mediana de cada linha (gene) para centralizar os dados
mydata <- sweep(mydata, 1, apply(mydata, 1, median, na.rm = TRUE))

# Carregar a biblioteca ConsensusClusterPlus
library(ConsensusClusterPlus)

# Otimização dos parâmetros de ConsensusClusterPlus
results <- ConsensusClusterPlus(mydata,
                                maxK = 10,              # Testar até 15 clusters
                                reps = 1000,            # Aumentar o número de repetições para maior robustez
                                pItem = 0.7,            # Amostrar 70% dos itens
                                pFeature = 0.9,         # Amostrar 90% das características
                                title = "lncRNAs_MB_CCP_results_OK_Final",
                                clusterAlg = "pam",      # Algoritmo de clustering PAM (Partitioning Around Medoids)
                                distance = "spearman",  # Usar Spearman como métrica de distância
                                seed = 1262118388.71279, # Manter semente fixa para reprodutibilidade
                                plot = "png")



ConsensusClasses_k4 = as.data.frame(results[[4]][["consensusClass"]])
write.table(ConsensusClasses_k4, file="ConsensusClasses_k4.txt")
