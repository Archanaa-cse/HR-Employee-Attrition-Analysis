Create database Hr_attrition;
use hr_attrition;

-- total employees
select count(employee_id) as total_employees
from employees;

-- total attrition
SELECT COUNT(*) AS total_attrition
FROM employees
WHERE attrition = 1;

-- overall attrition %
SELECT 
    ROUND(SUM(attrition) * 100.0 / COUNT(*), 2) AS attrition_percentage
FROM employees;

-- department-wise attrition %
select department,
ROUND(SUM(attrition) * 100.0 / COUNT(*), 2) AS attrition_percentage
FROM employees
group by department;

-- gender-wise total employees
select gender,
count(employee_id) as total_employees
from employees
group by gender;

-- job role count
SELECT job_role,
       COUNT(*) AS attrition_count
FROM employees
WHERE attrition = 1
GROUP BY job_role;

# highest attrition count dept
select department,
count(*) AS attrition_count
FROM employees
where attrition=1
group by department
order by attrition_count desc
limit 1;

-- job roles with high attrition (>20%)
SELECT job_role,
       ROUND(SUM(attrition) * 100.0 / COUNT(*), 2) AS attrition_percentage
FROM employees
GROUP BY job_role
HAVING ROUND(SUM(attrition) * 100.0 / COUNT(*), 2) > 20;

-- attrition by salary range
SELECT 
  CASE
    WHEN monthly_income < 3000 THEN 'Low'
    WHEN monthly_income BETWEEN 3000 AND 7000 THEN 'Medium'
    ELSE 'High'
  END AS salary_range,
  ROUND(SUM(attrition) * 100.0 / COUNT(*), 2) AS attrition_percentage
FROM employees
GROUP BY salary_range;

-- work life balance vs attrition
SELECT attrition,
       ROUND(AVG(work_life_risk), 2) AS avg_work_life_balance
FROM employees
GROUP BY attrition;

-- overtime vs attrition %
SELECT over_time,
       ROUND(SUM(attrition) * 100.0 / COUNT(*), 2) AS attrition_percentage
FROM employees
GROUP BY over_time;

-- Attrition by age group
SELECT 
  CASE
    WHEN age < 30 THEN 'Under 30'
    WHEN age BETWEEN 30 AND 40 THEN '30-40'
    WHEN age BETWEEN 41 AND 50 THEN '41-50'
    ELSE 'Above 50'
  END AS age_group,
  ROUND(SUM(attrition) * 100.0 / COUNT(*), 2) AS attrition_percentage
FROM employees
GROUP BY age_group;

-- Attrition by years at company
SELECT 
  CASE
    WHEN years_at_company < 2 THEN '0-2 years'
    WHEN years_at_company BETWEEN 2 AND 5 THEN '2-5 years'
    WHEN years_at_company BETWEEN 6 AND 10 THEN '6-10 years'
    ELSE '10+ years'
  END AS experience_group,
  ROUND(SUM(attrition) * 100.0 / COUNT(*), 2) AS attrition_percentage
FROM employees
GROUP BY experience_group;

-- key attrition drivers
SELECT department AS factor,
       ROUND(SUM(attrition) * 100.0 / COUNT(*), 2) AS attrition_percentage
FROM employees
GROUP BY department
ORDER BY attrition_percentage DESC
LIMIT 3;