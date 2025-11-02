# Health Risk Factors Analysis - Mini Project Guide

## Project Overview
This mini project analyzes healthcare data to identify risk factors for major diseases including heart disease, diabetes, and stroke. The project uses R programming and statistical methods aligned with your course curriculum.

---

## Course Alignment

### Unit 1: Mathematics Context (Contact Hours: 15)
- **Data initialization with arithmetic operations**
- Creating and manipulating data structures
- Using dim() and glimpse() functions
- Data frame creation and display

### Unit 2: Data Frame Context (Contact Hours: 15)
- **Data frame creation and structure analysis**
- Indexing and looping in R
- Data frame manipulation and exploration

### Unit 3: Histogram Context (Contact Hours: 15)
- **Creating simple histograms with customizable parameters**
  - main: title of the chart
  - col: color of the bars
  - xlab: label for horizontal axis
  - ylab: label for y-axis
  - xlim & ylim: plotting values range
  - breaks: width of each bar

### Experiment 6: Boxplot Analysis
- Creating boxplots to compare distributions
- Analyzing relationships between categorical and numerical variables

### Project 2: Regression Analysis
- **Linear regression** for continuous outcome prediction
- **Polynomial regression** for non-linear relationships
- **Multiple regression** with several independent variables
- Model evaluation and performance interpretation

---

## Dataset Description

### File: `health_risk_factors_data.csv`
**500 patient records with 20 variables:**

#### Demographic Variables:
- **Patient_ID**: Unique identifier
- **Age**: Patient age (20-80 years)
- **Gender**: Male/Female

#### Clinical Measurements:
- **BMI**: Body Mass Index
- **Blood_Pressure_Systolic**: Systolic blood pressure (mmHg)
- **Blood_Pressure_Diastolic**: Diastolic blood pressure (mmHg)
- **Cholesterol_Total**: Total cholesterol level (mg/dL)
- **Cholesterol_HDL**: High-density lipoprotein cholesterol
- **Cholesterol_LDL**: Low-density lipoprotein cholesterol
- **Glucose_Level**: Blood glucose level (mg/dL)

#### Lifestyle Factors:
- **Smoking_Status**: Never/Former/Current
- **Alcohol_Consumption**: None/Moderate/Heavy
- **Physical_Activity**: Sedentary/Light/Moderate/Active
- **Sleep_Hours**: Average sleep hours per night
- **Stress_Level**: Stress rating (1-10 scale)

#### Health History:
- **Family_History_Heart_Disease**: Yes/No
- **Diabetes**: Yes/No
- **Heart_Disease**: Yes/No
- **Stroke**: Yes/No

#### Healthcare Access:
- **Medical_Checkup_Frequency**: Rarely/Annually/Bi-annually/Quarterly

---

## Analysis Components

### 1. Data Exploration (Unit 1 & 2)
- Load and inspect dataset structure
- Display dimensions and data types
- Generate summary statistics
- Check for missing values
- Create frequency tables for categorical variables

### 2. Distribution Analysis (Unit 3)
**Histograms for:**
- Age distribution
- BMI distribution
- Blood pressure patterns
- Cholesterol levels
- Glucose levels
- Sleep patterns

### 3. Comparative Analysis (Experiment 6)
**Boxplots to compare:**
- BMI by heart disease status
- Age by diabetes status
- Blood pressure by gender
- Risk factors across different groups

### 4. Regression Analysis (Project 2)

#### Linear Regression:
- **Model**: BMI ~ Age
- Understand relationship between age and body mass

#### Polynomial Regression:
- **Model**: Cholesterol_Total ~ Age + Age²
- Capture non-linear age effects on cholesterol

#### Multiple Linear Regression:
- **Model**: Glucose_Level ~ Age + BMI + Blood_Pressure_Systolic
- Predict glucose from multiple risk factors

### 5. Hypothesis Testing
Statistical tests to validate findings:

- **T-tests**: Compare means between two groups
  - BMI differences in heart disease patients
  - Age differences in diabetes patients

- **ANOVA**: Compare means across multiple groups
  - Cholesterol levels across smoking status

- **Chi-Square Tests**: Test associations between categorical variables
  - Gender and heart disease relationship
  - Smoking status and heart disease association

### 6. Correlation Analysis
- Calculate correlation matrix for numerical variables
- Visualize relationships using correlation plot
- Identify strong predictors of disease

### 7. Logistic Regression
- **Binary outcome prediction**: Heart disease (Yes/No)
- **Predictors**: Age, BMI, Blood Pressure, Cholesterol, Glucose
- Calculate odds ratios to interpret risk factors
- Evaluate model performance

### 8. Risk Factor Analysis
- Calculate disease prevalence rates
- Analyze risk by age groups
- Examine risk by BMI categories
- Identify high-risk population segments

---

## How to Run the Project

### Step 1: Setup
1. Ensure R and RStudio are installed
2. Place both files in the same directory:
   - `health_risk_factors_data.csv`
   - `Health_Risk_Factors_Analysis.R`

### Step 2: Install Required Packages
The script will automatically install these packages if needed:
- `ggplot2` - Advanced visualizations
- `dplyr` - Data manipulation
- `corrplot` - Correlation visualization
- `gridExtra` - Multiple plot arrangements
- `reshape2` - Data reshaping
- `car` - Regression diagnostics

### Step 3: Execute
1. Open `Health_Risk_Factors_Analysis.R` in RStudio
2. Set working directory to file location: `setwd("your/path/here")`
3. Run the entire script or execute section by section
4. Observe output in Console and Plots pane

---

## Key Statistical Concepts Demonstrated

### Descriptive Statistics
- Mean, median, mode, standard deviation
- Frequency distributions and contingency tables
- Percentiles and quartiles

### Inferential Statistics
- Hypothesis testing with significance levels
- Confidence intervals
- P-values interpretation

### Regression Analysis
- Simple and multiple linear regression
- Polynomial regression for non-linear relationships
- Logistic regression for binary outcomes
- Model diagnostics and validation

### Association Measures
- Pearson correlation coefficients
- Chi-square test of independence
- Odds ratios in logistic regression

---

## Expected Outputs

### Console Outputs:
- Dataset structure and summary statistics
- Statistical test results (t-tests, ANOVA, chi-square)
- Regression model summaries
- Correlation matrices
- Risk prevalence calculations
- Age and BMI-based risk profiles

### Visualizations:
- 6 histograms showing variable distributions
- Multiple boxplots for group comparisons
- Correlation heatmap
- Scatter plots with regression lines
- Grouped bar charts
- Density plots
- Regression diagnostic plots

---

## Learning Outcomes

By completing this project, you will:

1. **Master data manipulation** using R data frames
2. **Apply statistical methods** including hypothesis testing and regression
3. **Create professional visualizations** using base R and ggplot2
4. **Interpret statistical results** in a healthcare context
5. **Identify health risk factors** using data-driven approaches
6. **Develop analytical thinking** for real-world problems
7. **Document and present findings** effectively

---

## Extensions and Further Analysis

### Possible Enhancements:
- **Time series analysis** if follow-up data is available
- **Survival analysis** for disease progression
- **Machine learning models** (Random Forest, SVM) for prediction
- **Cluster analysis** to identify patient subgroups
- **ROC curve analysis** for model performance evaluation
- **Interactive dashboards** using Shiny

### Additional Statistical Techniques:
- **ANCOVA** (Analysis of Covariance)
- **Mixed-effects models** for hierarchical data
- **Propensity score matching** for causal inference
- **Bootstrap methods** for confidence interval estimation

---

## Reporting Your Findings

### Structure Your Report:
1. **Introduction**: Background on health risk factors
2. **Data Description**: Dataset overview and variables
3. **Methodology**: Statistical techniques applied
4. **Results**: Present findings with visualizations
5. **Discussion**: Interpret results in healthcare context
6. **Conclusion**: Key insights and recommendations
7. **References**: Cite relevant health literature

### Key Findings to Report:
- Prevalence rates of diseases in the dataset
- Significant risk factors identified
- Strength of associations (correlation coefficients, odds ratios)
- Predictive model performance
- High-risk population characteristics
- Clinical and public health implications

---

## Troubleshooting

### Common Issues:

**Issue**: Package installation fails
- **Solution**: Check internet connection, try CRAN mirror selection

**Issue**: CSV file not found
- **Solution**: Verify working directory with `getwd()`, use `setwd()` to correct

**Issue**: Plotting errors
- **Solution**: Ensure graphics device is open, try `dev.off()` to reset

**Issue**: Memory issues with large datasets
- **Solution**: Use data sampling or increase R memory allocation

---

## Project Checklist

- [ ] Dataset loaded successfully
- [ ] Data exploration completed
- [ ] Histograms created for all numerical variables
- [ ] Boxplots generated for group comparisons
- [ ] Linear regression models fitted and interpreted
- [ ] Hypothesis tests conducted
- [ ] Correlation analysis performed
- [ ] Logistic regression completed
- [ ] Risk factor analysis documented
- [ ] All visualizations saved
- [ ] Results interpreted in healthcare context
- [ ] Report/documentation prepared

---

## Additional Resources

### R Documentation:
- `?lm` - Linear regression help
- `?glm` - Generalized linear models
- `?ggplot2` - Advanced plotting
- `?cor` - Correlation functions

### Statistical Concepts:
- Understanding p-values and significance
- Interpreting regression coefficients
- Odds ratios in logistic regression
- Multiple testing corrections

---

## Contact and Support

For questions about this project:
- Review R documentation and help files
- Consult course materials and textbooks
- Discuss with peers and instructors
- Explore online R communities (Stack Overflow, RStudio Community)

---

**Good luck with your Health Risk Factors Analysis project! This comprehensive mini project demonstrates your proficiency in R programming, statistical analysis, and healthcare data interpretation.**
