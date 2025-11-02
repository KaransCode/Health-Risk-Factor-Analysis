Project Overview

This project analyzes key health risk factors—age, BMI, blood pressure, cholesterol, glucose, and lifestyle habits—using R programming and a dataset of 500 patients. By applying statistical and visualization techniques, it aims to identify patterns, risk groups, and correlations to better understand disease determinants and support preventive healthcare.

Files Included

health_risk_factors_data.csv: Contains anonymized records of 500 patients with 20 relevant variables.

Health_Risk_Factors_Analysis.R: Main R script for analysis and visualization.

How to Run

Install R and RStudio.

Place both files in the same folder.

Open RStudio, set working directory:
setwd("your/folder/path")

Open the R script and run line by line, or click "Source".

Key Analytical Steps

Data Exploration: Display sample records, structure, and summary statistics.

Risk Calculations: Compute Risk Score, Cholesterol Ratio, and BMI Score for each patient.

Mathematical Functions: Calculate mean, median, standard deviation, quantiles, and prevalence.

Grouping: Identify high-risk and diabetic patients, summarize data by gender.

Visualization:

Histograms: Age, BMI, blood pressure, glucose

Pie charts: Gender, disease status, smoking

Scatter plots: Age vs BMI, BMI vs BP, Age vs glucose

Boxplots: BMI by heart disease, age by diabetes

Findings & Insights

Reveals major risk factors and high-risk groups.

Disease prevalence rates and patterns by age, gender, and lifestyle.

Correlations between core health metrics.

Extensions

Add more variables or patient data.

Integrate machine learning for risk prediction.

Build dashboards for interactive analysis.

Best Practices

Document all code, comments, and analysis steps.

Interpret plots and summary metrics to draw conclusions.

Ensure patient data privacy and data integrity.
