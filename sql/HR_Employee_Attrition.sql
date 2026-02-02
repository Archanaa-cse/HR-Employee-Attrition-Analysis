create database hr_attrition;
use hr_attrition;
select count(*) from employees;

# total_employees
select count(employee_id) as total_employees
from employees;

#count attrition
SELECT COUNT(*) AS total_attrition
FROM employees
WHERE attrition = 1;

# % attrition
SELECT 
    ROUND(SUM(attrition) * 100.0 / COUNT(*), 2) AS attrition_percentage
FROM employees;

# department wise %
select department,
ROUND(SUM(attrition) * 100.0 / COUNT(*), 2) AS attrition_percentage
FROM employees
group by department;

# gender wise total employees
select gender,
count(employee_id) as total_employees
from employees
group by gender;

# job role count
select job_role,
count(*) as attrition_count
from employees
where attrition = 1
group by job_role;

# % count
select job_role,
round(sum(attrition) * 100.0 / count(*), 2) as attrition_percentage
from employees
group by job_role;

# highest attrition count dept
select department,
count(*) AS attrition_count
FROM employees
where attrition=1
group by department
order by attrition_count desc
limit 1;

# attrition by job role
SELECT job_role,
       ROUND(SUM(attrition) * 100.0 / COUNT(*), 2) AS attrition_percentage
FROM employees
GROUP BY job_role
HAVING ROUND(SUM(attrition) * 100.0 / COUNT(*), 2) > 20;

# dep has highest avg income
SELECT department,
       AVG(monthly_income) AS avg_monthly_income
FROM employees
WHERE attrition = 1
GROUP BY department
ORDER BY avg_monthly_income DESC
LIMIT 1;

#average work-life balance score for employees who left vs stayed.
SELECT attrition,
       ROUND(AVG(work_life_risk), 2) AS avg_work_life_balance
FROM employees
GROUP BY attrition;

# overtime assoicated with attrition
SELECT over_time,
       ROUND(SUM(attrition) * 100.0 / COUNT(*), 2) AS attrition_percentage
FROM employees
GROUP BY over_time;

# top 3 factors most associated with attrition
SELECT 'department' AS factor_name,
       department AS factor_value,
       ROUND(SUM(attrition) * 100.0 / COUNT(*), 2) AS attrition_percentage
FROM employees
GROUP BY department

UNION ALL

SELECT 'job_role' AS factor_name,
       job_role AS factor_value,
       ROUND(SUM(attrition) * 100.0 / COUNT(*), 2) AS attrition_percentage
FROM employees
GROUP BY job_role

UNION ALL

SELECT 'over_time' AS factor_name,
       over_time AS factor_value,
       ROUND(SUM(attrition) * 100.0 / COUNT(*), 2) AS attrition_percentage
FROM employees
GROUP BY over_time

UNION ALL

SELECT 'gender' AS factor_name,
       gender AS factor_value,
       ROUND(SUM(attrition) * 100.0 / COUNT(*), 2) AS attrition_percentage
FROM employees
GROUP BY gender

UNION ALL

SELECT 'marital_status' AS factor_name,
       marital_status AS factor_value,
       ROUND(SUM(attrition) * 100.0 / COUNT(*), 2) AS attrition_percentage
FROM employees
GROUP BY marital_status

ORDER BY attrition_percentage DESC
LIMIT 3;
