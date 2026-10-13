CREATE DATABASE bank_loan;
use bank_loan;
select * from l_approved;
select count(*) from loan_approved_clean;
alter table loan_approved_clean rename to l_approved;
alter table l_approved drop column MyUnknownColumn;
 
select count(loan_id) from l_approved;

select loan_status, count(*) as L_Status_Count from l_approved
group by loan_status;

select round(avg(loanamount),2) as Avg_Loan_Amount from l_approved 
where loan_status = 'Y';

select round(avg(coapplicantincome+applicantincome),2) from l_approved;

-- View the first 10 records from the table.
select * from l_approved limit 10;

-- Count the total number of loan applications.
select  count(*) as Total_Applicant from l_approved;

-- List all unique property areas.
select distinct(property_area) from l_approved;

-- Show all applicants who are self-employed and have an income above 5000.
select * from l_approved where self_employed = 'Yes' and applicantincome > 5000;

-- Find the total number of approved loans.
select count(*) from l_approved where loan_status = 'Y';

-- Find average loan amount by education level.
select education, avg(loanamount) as Avg_Loan_Amt from l_approved group by education;

-- Find average total income (Applicant + Coapplicant) by marital status.
select married ,avg(applicantincome+coapplicantincome) as Total_avg_income from l_approved GROUP BY married;

-- Show average loan amount by credit history.
select credit_history, avg(loanamount) as Avg_loan_Amt from l_approved group by credit_history;

-- Find total applications and approval rate by gender.
 SELECT gender,
		count(*) as total_application,
		count(case when loan_status = 'Y' then 1 end) as approved,
		round(count(case when loan_status = 'Y' then 1 end)*100.0/ count(*),2) as Approval_Rate 
		from l_approved 
group by gender;
 
--  Show approval rate by property area.
SELECT property_area,
		count(*) as total_application,
		count(case when loan_status = 'Y' then 1 end) as approved,
		round(count(case when property_area = 'Y' then 1 end)*100.0/ count(*),2) as Approval_Rate 
		from l_approved 
group by property_area;


-- Show applicants who are graduates, not self-employed, and have loan amount greater than 150.
select * from  l_approved
where education = 'Graduate'
and self_employed = 'No'
and loanamount > 150
order by loanamount asc; 

--  Display approved loans from urban area with good credit history.
select * from l_approved
where loan_status = 'Y'
and property_area = 'Urban'
and credit_history = 1.0
order by credit_history asc;

-- List top 5 applicants with highest total income.
select *  from l_approved order by applicantincome+coapplicantincome desc limit 5;

-- Create derived columns for total income for each applicant.

select * ,applicantincome+coapplicantincome as Total_income from l_approved;  

-- Classify applicants into income groups (Low, Medium, High) based on applicant income.
select loan_id,
	   applicantincome,
       case
		   when applicantincome <= 3000 then 'Low_Income'
		   when applicantincome >= 3000  and applicantincome <= 5000 then 'Medium_Income'
		   else 'High_Income'
       end as Income_Group
from l_approved;
       
-- Find average loan amount for each income group.
select loan_id,
	   applicantincome,
       case
           when applicantincome <= 3000 then 'Low_Income'
           when applicantincome >= 3000  and applicantincome <= 5000 then 'Medium_Income'
           else 'High_Income'
       end as Income_Group,
       round(avg(loanamount),2) as avg_loanamount
from l_approved 
group by case
           when applicantincome <= 3000 then 'Low_Income'
           when applicantincome >= 3000  and applicantincome <= 5000 then 'Medium_Income'
           else 'High_Income'
       end;
