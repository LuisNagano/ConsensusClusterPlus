# **Medulloblastoma molecular subgroup classification using lncRNA expression data**

## **Overview**

This project aims to identify the optimal number of molecular subgroups in medulloblastoma (MB) based on lncRNA expression profiles, using RNA-seq data from 167 MB samples. We leveraged the **ConsensusClusterPlus** R package to perform consensus clustering, and applied Cohen's Kappa coefficient to evaluate the agreement between the identified molecular subgroups and the original classification of MB patients from the ICGC cohort.

Our analysis highlights four distinct molecular subgroups, corresponding to the known MB subtypes (Group 3, Group 4, SHH, and WNT), with robust intra-cluster consistency. The clustering results are supported by numerical metrics and visualizations, such as consensus matrices, CDF plots, delta area plots, and correlation analyses between clustering outputs and the original MB classification.

## **Objectives**

1. **Identify the optimal number of molecular subgroups** in medulloblastoma using high-variance lncRNAs.
2. **Validate the agreement between the new lncRNA-based classification** and the original molecular subgroups using **Cohen's Kappa**.
3. **Visualize the clustering stability** across different numbers of subgroups using consensus matrices, CDF, and delta area plots.
4. **Provide insights into the molecular distinction** between the identified subgroups based on lncRNA profiles.

## **Methodology**

### 1. **Data Preprocessing**
- The dataset consists of 167 MB samples, each with RNA-seq normalized expression data. From this dataset, we selected the **5000 lncRNAs with the highest variance** to ensure we captured significant expression differences across MB subgroups.
  
### 2. **Consensus Clustering**
- Consensus clustering was performed using **ConsensusClusterPlus**. We evaluated the number of clusters (k) ranging from 2 to 10, with 1000 resamplings to ensure the stability of the clustering solution.
- The clustering algorithm used **partitioning around medoids (PAM)** and **Euclidean distance** for hierarchical clustering.
- Cumulative distribution function (CDF) plots and delta area plots were used to assess clustering stability and to determine the optimal number of subgroups.
  
### 3. **Validation Using Cohen’s Kappa**
- To assess the agreement between the **lncRNA-based clustering** (k=4) and the original MB classification, we calculated **Cohen’s Kappa coefficient** using the psych package in R.
- We computed both **unweighted** and **weighted Kappa values**, along with 95% confidence intervals, to evaluate the strength of the agreement.

## **Results**

### 1. **Optimal Number of Subgroups (k = 4)**
- The consensus clustering analysis identified **four subgroups** as the optimal number of molecular subgroups for MB.
- The CDF plot (Figure 1) shows the stabilization of clustering as the number of clusters increased, with k=4 showing the highest clustering stability. The delta area plot (Figure 2) further confirms that the most significant improvement in clustering stability occurred at k=4.
  
  ![Consensus CDF](https://github.com/LuisNagano/ConsensusClusterPlus/blob/main/Results/consensus011.png)

  *Figure 1: Cumulative Distribution Function (CDF) for k=2 to k=10 clusters.*

  ![Delta Area Plot](https://github.com/LuisNagano/ConsensusClusterPlus/blob/main/Results/consensus012.png)

  *Figure 2: Delta Area Plot showing relative changes in area under the CDF curve.*

### 2. **Consensus Matrix for k = 4**
- The consensus matrix for k=4 (Figure 3) reveals clear and well-separated clusters, corresponding to the four known molecular subgroups of MB: **Group 3, Group 4, SHH, and WNT**.
- Each subgroup exhibited high intra-cluster consensus, indicating the robustness of the clustering solution.

  ![Consensus Matrix](https://github.com/LuisNagano/ConsensusClusterPlus/blob/main/Results/consensus004.png)

  *Figure 3: Consensus matrix for k=4, showing clear separation between MB subgroups.*

### 3. **Cohen’s Kappa: Agreement with Original MB Classification**
- To validate the clustering solution, we calculated Cohen’s Kappa to measure the agreement between the lncRNA-based classification and the original MB molecular diagnosis.
- **Unweighted Kappa**: 0.80 (95% CI: 0.72 - 0.87) indicates substantial agreement.
- **Weighted Kappa**: 0.87 (95% CI: 0.78 - 0.95) suggests excellent agreement, reinforcing the accuracy of the lncRNA-based classification.

  ![Kappa Results](https://github.com/LuisNagano/ConsensusClusterPlus/blob/main/Results/Kappa_Table.png)
  
  *Figure 4: Cohen’s Kappa results, comparing lncRNA-based classification (k=4) with original MB subgroups.*

## **Discussion and Insights**

- The four subgroups identified correspond to the **well-established molecular subgroups** of medulloblastoma: **Group 3**, **Group 4**, **SHH**, and **WNT**, supporting the validity of our lncRNA-based approach.
- The high Kappa values indicate that the **lncRNA expression profiles provide a reliable molecular signature** for MB classification, closely mirroring the ICGC classification based on traditional molecular markers.
- The **robust intra-cluster consensus** highlights the ability of lncRNAs to distinguish between MB subgroups, offering potential biomarkers for molecular classification and therapeutic targeting.

## **Future Directions**

1. **Functional validation of key lncRNAs**: Investigate the role of top lncRNAs in driving the molecular subtypes of MB.
2. **Integration of multi-omics data**: Incorporate genomic, epigenomic, and proteomic data to enhance the understanding of MB biology.
3. **Therapeutic insights**: Explore the potential for targeting lncRNA-mediated pathways in MB treatment.

## **Dependencies**

- R (v4.0 or higher)
- **ConsensusClusterPlus** R package (v1.48.0)
- **psych** R package for Kappa analysis
- RNA-seq normalized expression data from 167 medulloblastoma patients (ICGC cohort)

## **References**

1. **ConsensusClusterPlus**: Wilkerson, M.D. & Hayes, D.N. (2010). ConsensusClusterPlus: A class discovery tool with confidence assessments and item tracking. *Bioinformatics, 26*(12), 1572-1573.
2. **Cohen’s Kappa**: Cohen, J. (1960). A coefficient of agreement for nominal scales. *Educational and Psychological Measurement, 20*, 37-46.
3. **ICGC Medulloblastoma Data**: Available at [ICGC Data Portal](https://dcc.icgc.org/projects).

---

Com esse README, seu projeto será bem estruturado e visualmente atraente para recrutadores e pesquisadores, além de detalhar claramente a metodologia e resultados obtidos.
