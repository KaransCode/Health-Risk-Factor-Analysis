
# HEALTH RISK FACTORS ANALYSIS - MINI PROJECT IN R


# Install required packages (run once)
# install.packages("dplyr")
# install.packages("tibble")

getwd()

# Load packages
library(dplyr)  # For data manipulation
library(tibble) # For glimpse() function

cat("========================================\n")
cat("HEALTH RISK FACTORS ANALYSIS - MINI PROJECT\n")
cat("========================================\n\n")

# Load the health dataset
health <- read.csv("health_risk_factors_data.csv")
cat("=== Dataset Loaded Successfully ===\n\n")

# Display first few rows
cat("First 5 patients:\n")
print(head(health, 5))
cat("\n")


# 1. Calculate Health Risk Score (simple weighted calculation)
health$Risk_Score <- (health$Age * 0.2) + (health$BMI * 2) + 
                     (health$Blood_Pressure_Systolic * 0.1) + 
                     (health$Glucose_Level * 0.15)

cat("=== Arithmetic Operation 1: RISK SCORE CALCULATION ===\n")
cat("Formula: Risk Score = (Age × 0.2) + (BMI × 2) + (BP × 0.1) + (Glucose × 0.15)\n")
cat("Sample Risk Score values:\n")
print(head(health[, c("Patient_ID", "Age", "BMI", "Risk_Score")], 5))
cat("\n")

# 2. Calculate Cholesterol Ratio (Total/HDL)
health$Cholesterol_Ratio <- health$Cholesterol_Total / health$Cholesterol_HDL

cat("=== Arithmetic Operation 2: CHOLESTEROL RATIO ===\n")
cat("Formula: Ratio = Total Cholesterol / HDL\n")
cat("Sample values:\n")
print(head(health[, c("Patient_ID", "Cholesterol_Total", "Cholesterol_HDL", "Cholesterol_Ratio")], 5))
cat("\n")

# 3. Calculate BMI Category Score
health$BMI_Score <- health$BMI / 5  # Simplified scoring

cat("=== Arithmetic Operation 3: BMI SCORING ===\n")
cat("Formula: BMI Score = BMI / 5\n")
cat("Sample values:\n")
print(head(health[, c("Patient_ID", "BMI", "BMI_Score")], 5))
cat("\n")

cat("=== MATHEMATICAL FUNCTIONS ON BMI ===\n\n")

# Mean BMI
mean_bmi <- mean(health$BMI)
cat("Mean BMI:", round(mean_bmi, 2), "\n")

# Median BMI
median_bmi <- median(health$BMI)
cat("Median BMI:", round(median_bmi, 2), "\n")

# Standard deviation
sd_bmi <- sd(health$BMI)
cat("Standard Deviation of BMI:", round(sd_bmi, 2), "\n")

# Variance
var_bmi <- var(health$BMI)
cat("Variance of BMI:", round(var_bmi, 2), "\n")

# Minimum and Maximum
min_bmi <- min(health$BMI)
max_bmi <- max(health$BMI)
cat("Minimum BMI:", min_bmi, "\n")
cat("Maximum BMI:", max_bmi, "\n")

# Range
range_bmi <- max_bmi - min_bmi
cat("BMI Range:", range_bmi, "\n")

# Quantiles (25th, 50th, 75th percentile)
quantiles_bmi <- quantile(health$BMI, probs = c(0.25, 0.5, 0.75))
cat("\nBMI Quantiles:\n")
print(quantiles_bmi)
cat("\n")

# Sum of all ages
total_age <- sum(health$Age)
cat("Total Age of All Patients:", total_age, "years\n")

# Square root of average blood pressure
avg_bp <- mean(health$Blood_Pressure_Systolic)
sqrt_bp <- sqrt(avg_bp)
cat("Average Blood Pressure:", round(avg_bp, 2), "mmHg\n")
cat("Square Root of Avg BP:", round(sqrt_bp, 2), "\n")

# Absolute value example (difference from mean)
health$BMI_Deviation <- abs(health$BMI - mean_bmi)
cat("\nAbsolute deviation from mean BMI (first 5):\n")
print(head(health[, c("Patient_ID", "BMI", "BMI_Deviation")], 5))
cat("\n")

# Display dimensions using dim()
cat("Dataset Dimensions using dim():\n")
dimensions <- dim(health)
cat("Rows (Patients):", dimensions[1], "\n")
cat("Columns (Variables):", dimensions[2], "\n\n")

# Display structure using glimpse()
cat("Dataset Structure using glimpse():\n")
glimpse(health)
cat("\n")

# Additional structure information
cat("Column names:\n")
print(colnames(health))
cat("\n")

cat("Data types:\n")
print(sapply(health, class))
cat("\n")


# Create a vector of high-risk patients (Risk_Score >= 100)
high_risk <- health[health$Risk_Score >= 100, ]
cat("Number of High-Risk Patients (Score >= 100):", nrow(high_risk), "\n")
cat("Top 5 High-Risk Patients:\n")
print(head(high_risk[, c("Patient_ID", "Age", "BMI", "Risk_Score")], 5))
cat("\n")

# Create a subset of diabetic patients
diabetic <- health[health$Diabetes == "Yes", ]
cat("Number of Diabetic Patients:", nrow(diabetic), "\n")
cat("Average BMI of Diabetic Patients:", round(mean(diabetic$BMI), 2), "\n\n")

# Create gender-wise summary object
gender_summary <- health %>%
  group_by(Gender) %>%
  summarise(
    Count = n(),
    Avg_Age = mean(Age),
    Avg_BMI = mean(BMI),
    Avg_BP = mean(Blood_Pressure_Systolic),
    Heart_Disease_Count = sum(Heart_Disease == "Yes")
  ) %>%
  arrange(desc(Avg_BMI))

cat("Gender-wise Summary:\n")
print(gender_summary)
cat("\n")

# Create a new data frame with high-risk patients
top_risk <- data.frame(
  Rank = 1:10,
  Patient_ID = head(health[order(-health$Risk_Score), "Patient_ID"], 10),
  Age = head(health[order(-health$Risk_Score), "Age"], 10),
  BMI = head(health[order(-health$Risk_Score), "BMI"], 10),
  Risk_Score = head(health[order(-health$Risk_Score), "Risk_Score"], 10)
)

cat("Top 10 High-Risk Patients (Custom Data Frame):\n")
print(top_risk)
cat("\n")

# Get structure of the new data frame
cat("Structure of Top Risk Data Frame:\n")
str(top_risk)
cat("\n")

# Loop 1: Find average BMI by age groups
cat("=== Average BMI by Age Groups (Using Loop) ===\n")
age_groups <- list(
  "20-35" = c(20, 35),
  "36-50" = c(36, 50),
  "51-65" = c(51, 65),
  "66-80" = c(66, 80)
)

for (group_name in names(age_groups)) {
  age_range <- age_groups[[group_name]]
  group_data <- health[health$Age >= age_range[1] & health$Age <= age_range[2], ]
  avg_bmi <- mean(group_data$BMI)
  cat("Age", group_name, ":", round(avg_bmi, 2), "\n")
}
cat("\n")

# Loop 2: Count patients in different BMI categories
cat("=== BMI Categories (Using Loop) ===\n")
bmi_breaks <- c(0, 18.5, 25, 30, 100)
bmi_labels <- c("Underweight (<18.5)", "Normal (18.5-25)", "Overweight (25-30)", "Obese (>30)")

for (i in 1:(length(bmi_breaks) - 1)) {
  count <- sum(health$BMI >= bmi_breaks[i] & health$BMI < bmi_breaks[i + 1])
  cat(bmi_labels[i], ":", count, "patients\n")
}
cat("\n")

# Loop 3: Calculate disease prevalence by gender
cat("=== Disease Prevalence by Gender (Using Loop) ===\n")
diseases <- c("Heart_Disease", "Diabetes", "Stroke")

for (disease in diseases) {
  cat("\n", disease, ":\n", sep = "")
  for (gender in c("Male", "Female")) {
    gender_data <- health[health$Gender == gender, ]
    disease_count <- sum(gender_data[[disease]] == "Yes")
    prevalence <- (disease_count / nrow(gender_data)) * 100
    cat("  ", gender, ": ", disease_count, " (", round(prevalence, 1), "%)\n", sep = "")
  }
}
cat("\n")

# Histogram 1: Distribution of Age
cat("Creating Histogram 1: Age Distribution\n")
hist(
  health$Age,
  main = "Distribution of Patient Age",
  col = "skyblue",
  xlab = "Age (years)",
  border = "darkblue",
  xlim = c(20, 80),
  ylim = c(0, 80),
  breaks = 15
)
cat("Histogram shows the frequency distribution of patient ages\n")
cat("Most patients are between 40-60 years\n\n")

# Histogram 2: Distribution of BMI
cat("Creating Histogram 2: BMI Distribution\n")
hist(
  health$BMI,
  main = "Distribution of Body Mass Index",
  col = "lightgreen",
  xlab = "BMI",
  border = "darkgreen",
  xlim = c(15, 45),
  ylim = c(0, 100),
  breaks = 20
)
cat("Histogram shows most patients have BMI between 25-30\n")
cat("Some patients show very high BMI indicating obesity\n\n")

# Histogram 3: Distribution of Blood Pressure
cat("Creating Histogram 3: Blood Pressure Distribution\n")
hist(
  health$Blood_Pressure_Systolic,
  main = "Distribution of Systolic Blood Pressure",
  col = "coral",
  xlab = "Blood Pressure (mmHg)",
  border = "red",
  xlim = c(100, 180),
  ylim = c(0, 60),
  breaks = 15
)
cat("Most patients have blood pressure between 120-140 mmHg\n\n")

# Histogram 4: Distribution of Glucose
cat("Creating Histogram 4: Glucose Level Distribution\n")
hist(
  health$Glucose_Level,
  main = "Distribution of Blood Glucose Levels",
  col = "gold",
  xlab = "Glucose (mg/dL)",
  border = "orange",
  xlim = c(70, 200),
  ylim = c(0, 60),
  breaks = 15
)
cat("Glucose levels show variation, with some high values indicating diabetes risk\n\n")

# Pie Chart 1: Gender Distribution
cat("Creating Pie Chart 1: Gender Distribution\n")
gender_counts <- table(health$Gender)
pie(
  gender_counts,
  main = "Gender Distribution of Patients",
  col = c("lightblue", "pink"),
  labels = paste(names(gender_counts), "\n", gender_counts, " patients")
)
cat("Pie chart shows the proportion of male and female patients\n\n")

# Pie Chart 2: Heart Disease Distribution
cat("Creating Pie Chart 2: Heart Disease Distribution\n")
heart_disease_counts <- table(health$Heart_Disease)
pie(
  heart_disease_counts,
  main = "Heart Disease Prevalence",
  col = c("lightgreen", "salmon"),
  labels = paste(names(heart_disease_counts), "\n", heart_disease_counts, " patients")
)
cat("Shows percentage of patients with and without heart disease\n\n")

# Pie Chart 3: Diabetes Distribution
cat("Creating Pie Chart 3: Diabetes Distribution\n")
diabetes_counts <- table(health$Diabetes)
pie(
  diabetes_counts,
  main = "Diabetes Prevalence",
  col = c("lightyellow", "orange"),
  labels = paste(names(diabetes_counts), "\n", diabetes_counts, " patients")
)
cat("Shows percentage of patients with and without diabetes\n\n")

# Pie Chart 4: Smoking Status Distribution
cat("Creating Pie Chart 4: Smoking Status Distribution\n")
smoking_counts <- table(health$Smoking_Status)
pie(
  smoking_counts,
  main = "Smoking Status Distribution",
  col = rainbow(length(smoking_counts)),
  labels = paste(names(smoking_counts), "\n", smoking_counts, " patients")
)
cat("Shows distribution of smoking habits among patients\n\n")

# Scatter Plot 1: Age vs BMI
cat("Creating Scatter Plot 1: Age vs BMI\n")
plot(
  health$Age, 
  health$BMI,
  main = "Relationship between Age and BMI",
  xlab = "Age (years)",
  ylab = "Body Mass Index",
  col = "blue",
  pch = 19,
  cex = 0.8
)
abline(lm(health$BMI ~ health$Age), col = "red", lwd = 2)
cat("Scatter plot shows relationship between age and BMI with trend line\n\n")

# Scatter Plot 2: BMI vs Blood Pressure
cat("Creating Scatter Plot 2: BMI vs Blood Pressure\n")
plot(
  health$BMI, 
  health$Blood_Pressure_Systolic,
  main = "BMI vs Blood Pressure",
  xlab = "Body Mass Index",
  ylab = "Systolic BP (mmHg)",
  col = "darkgreen",
  pch = 19,
  cex = 0.8
)
abline(lm(health$Blood_Pressure_Systolic ~ health$BMI), col = "red", lwd = 2)
cat("Higher BMI tends to correlate with higher blood pressure\n\n")

# Scatter Plot 3: Age vs Glucose Level
cat("Creating Scatter Plot 3: Age vs Glucose Level\n")
plot(
  health$Age, 
  health$Glucose_Level,
  main = "Age vs Blood Glucose Level",
  xlab = "Age (years)",
  ylab = "Glucose (mg/dL)",
  col = "purple",
  pch = 19,
  cex = 0.8
)
abline(lm(health$Glucose_Level ~ health$Age), col = "red", lwd = 2)
cat("Shows how glucose levels change with age\n\n")

# Scatter Plot 4: Cholesterol vs Age (colored by Heart Disease)
cat("Creating Scatter Plot 4: Cholesterol vs Age (by Heart Disease)\n")
colors <- ifelse(health$Heart_Disease == "Yes", "red", "blue")
plot(
  health$Age, 
  health$Cholesterol_Total,
  main = "Cholesterol vs Age (Colored by Heart Disease)",
  xlab = "Age (years)",
  ylab = "Total Cholesterol (mg/dL)",
  col = colors,
  pch = 19,
  cex = 0.8
)
legend("topright", legend = c("No Heart Disease", "Heart Disease"), 
       col = c("blue", "red"), pch = 19)
cat("Red points indicate patients with heart disease\n\n")

# Boxplot 1: BMI by Heart Disease Status
cat("Creating Boxplot 1: BMI by Heart Disease Status\n")
boxplot(
  BMI ~ Heart_Disease,
  data = health,
  main = "BMI Distribution by Heart Disease Status",
  xlab = "Heart Disease",
  ylab = "Body Mass Index",
  col = c("lightgreen", "salmon"),
  border = "black"
)
cat("Boxplot compares BMI between patients with and without heart disease\n\n")

# Boxplot 2: Age by Diabetes Status
cat("Creating Boxplot 2: Age by Diabetes Status\n")
boxplot(
  Age ~ Diabetes,
  data = health,
  main = "Age Distribution by Diabetes Status",
  xlab = "Diabetes",
  ylab = "Age (years)",
  col = c("lightblue", "orange"),
  border = "black"
)
cat("Shows age differences between diabetic and non-diabetic patients\n\n")

# Boxplot 3: Blood Pressure by Gender
cat("Creating Boxplot 3: Blood Pressure by Gender\n")
boxplot(
  Blood_Pressure_Systolic ~ Gender,
  data = health,
  main = "Blood Pressure by Gender",
  xlab = "Gender",
  ylab = "Systolic BP (mmHg)",
  col = c("pink", "lightblue"),
  border = "black"
)
cat("Compares blood pressure levels between male and female patients\n\n")

# Boxplot 4: Cholesterol by Smoking Status
cat("Creating Boxplot 4: Cholesterol by Smoking Status\n")
boxplot(
  Cholesterol_Total ~ Smoking_Status,
  data = health,
  main = "Cholesterol Levels by Smoking Status",
  xlab = "Smoking Status",
  ylab = "Total Cholesterol (mg/dL)",
  col = rainbow(length(unique(health$Smoking_Status))),
  border = "black",
  las = 2
)
cat("Shows how cholesterol varies across different smoking habits\n\n")

cat("=================================================\n")
cat("        FINAL INSIGHTS & CONCLUSIONS        \n")
cat("=================================================\n\n")

# Key Statistics
cat("1. OVERALL STATISTICS:\n")
cat("   - Total Patients Analyzed:", nrow(health), "\n")
cat("   - Average Age:", round(mean(health$Age), 2), "years\n")
cat("   - Average BMI:", round(mean(health$BMI), 2), "\n")
cat("   - Average Blood Pressure:", round(mean(health$Blood_Pressure_Systolic), 2), "mmHg\n\n")

# Disease Prevalence
heart_disease_prev <- (sum(health$Heart_Disease == "Yes") / nrow(health)) * 100
diabetes_prev <- (sum(health$Diabetes == "Yes") / nrow(health)) * 100
stroke_prev <- (sum(health$Stroke == "Yes") / nrow(health)) * 100

cat("2. DISEASE PREVALENCE:\n")
cat("   - Heart Disease:", round(heart_disease_prev, 1), "%\n")
cat("   - Diabetes:", round(diabetes_prev, 1), "%\n")
cat("   - Stroke:", round(stroke_prev, 1), "%\n\n")

# Risk Factors
highest_risk <- health[which.max(health$Risk_Score), ]
cat("3. HIGHEST RISK PATIENT:\n")
cat("   - Patient ID:", highest_risk$Patient_ID, "\n")
cat("   - Age:", highest_risk$Age, "years\n")
cat("   - BMI:", highest_risk$BMI, "\n")
cat("   - Risk Score:", round(highest_risk$Risk_Score, 2), "\n\n")

# Correlation Analysis
correlation_age_bmi <- cor(health$Age, health$BMI)
correlation_bmi_bp <- cor(health$BMI, health$Blood_Pressure_Systolic)

cat("4. CORRELATIONS:\n")
cat("   - Age vs BMI:", round(correlation_age_bmi, 3), "\n")
cat("   - BMI vs Blood Pressure:", round(correlation_bmi_bp, 3), "\n\n")

# BMI Categories
underweight <- sum(health$BMI < 18.5)
normal <- sum(health$BMI >= 18.5 & health$BMI < 25)
overweight <- sum(health$BMI >= 25 & health$BMI < 30)
obese <- sum(health$BMI >= 30)

cat("5. BMI CATEGORIES:\n")
cat("   - Underweight:", underweight, "patients\n")
cat("   - Normal:", normal, "patients\n")
cat("   - Overweight:", overweight, "patients\n")
cat("   - Obese:", obese, "patients\n\n")

cat("=================================================\n")
cat("      ANALYSIS COMPLETED SUCCESSFULLY      \n")
cat("=================================================\n")

# Save results to a summary file
summary_data <- data.frame(
  Metric = c("Total Patients", "Avg Age", "Avg BMI", "Avg BP", 
             "Heart Disease %", "Diabetes %", "Stroke %"),
  Value = c(nrow(health), round(mean(health$Age), 2),
            round(mean(health$BMI), 2), round(mean(health$Blood_Pressure_Systolic), 2),
            round(heart_disease_prev, 1), round(diabetes_prev, 1), round(stroke_prev, 1))
)

write.csv(summary_data, "health_analysis_summary.csv", row.names = FALSE)
cat("\nSummary saved to: health_analysis_summary.csv\n")

# END OF HEALTH RISK FACTORS ANALYSIS MINI PROJECT
