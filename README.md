# NFHS5-Domestic-Violence-Analysis
Statistical analysis using STATA, weighted tabulation, Chi-square tests, and NFHS-5 (IR file) to understand domestic violence patterns among women in India.

🔧Tools Used:
STATA · Excel · PowerPoint

📘Project Overview
This project explores how domestic violence varies across key socio-demographic factors such as education, wealth, marital status, residence, age, religion, and husband’s alcohol consumption, using the NFHS-5 dataset.

🔍 Steps Performed
 • Imported the NFHS-5 IR dataset
 • Filtered DV-eligible women (v044 != 0)
 • Reconstructed physical violence variable (d105a–d105f)
 • Created combined domestic violence variable (physical + emotional + sexual)
 • Applied sampling weights (d005)
 • Performed weighted cross-tabulations
 • Conducted Chi-square tests
 • Created visual charts and a presentation summary

📊Key Results
 • ~30% of women reported some form of domestic violence
 • Violence is higher among rural women, less educated groups, and poorer households
 • Husband’s alcohol consumption strongly increases violence risk
 • Women who are separated/divorced show the highest prevalence
 • Education (woman & husband) and wealth act as protective factors

📁Files in This Repository
 • code/nfhs5_dv_analysis.do — STATA analysis script
 • visuals/ — PNG charts generated from the analysis
 • report/DOMESTIC VIOLENCE IN INDIA.pptx — Presentation summarizing all findings


👤 Author
 Pratim Sen
 Master’s Student, Survey Research & Data Analytics
 International Institute for Population Sciences (IIPS)
