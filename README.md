# Loan Approval Analysis

Analysis of 614 bank loan applications to find which factors influence loan approval.

## Tools
MySQL, Power BI, Python (Pandas, Matplotlib, Seaborn)

## Files
- `loan_approved.csv` - dataset (614 rows, 13 columns)
- `loan_approval_eda.ipynb` - data cleaning and EDA
- `loan_approval_queries.sql` - MySQL business queries
- `Loan_Approval_Dashboard.pbix` - 5-page Power BI dashboard

## What I did
- Cleaned missing values and ran univariate and bivariate EDA in Python
- Wrote SQL queries for approval rate by gender, property area, education and credit history
- Created total income and Low/Medium/High income groups
- Built a Power BI dashboard: Overview, Applicant Demographics, Financial Insight, Property Analysis, Credit Risk

## Key findings
- 422 of 614 applications (68.7%) were approved
- Credit history is the strongest factor: about 79.6% approval with good history vs 7.9% without
- Semiurban applicants had the highest approval rate (about 76.8%)
