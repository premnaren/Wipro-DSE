-- MUST RUN THIS FIRST IN SQL DEVELOPER TO ACCESS THE PLUGGABLE DATABASE
ALTER SESSION SET CONTAINER = FREEPDB1;

-- Assignment 1 & 2: Find the highest, lowest, sum, and average salary of all employees. Label the columns Maximum, Minimum, Sum, and Average, respectively. Round your results to the nearest whole number.
SELECT MAX(salary) AS "Maximum", MIN(salary) AS "Minimum", SUM(salary) AS "Sum", ROUND(AVG(salary)) AS "Average" 
FROM hr.employees;

-- Assignment 3: Modify the above query to display the minimum, maximum, sum, and average salary for each job type.
SELECT job_id, MAX(salary) AS "Maximum", MIN(salary) AS "Minimum", SUM(salary) AS "Sum", ROUND(AVG(salary)) AS "Average" 
FROM hr.employees 
GROUP BY job_id;

-- Assignment 4: Write a query to display the number of people with the same job
SELECT job_id, COUNT(*) 
FROM hr.employees 
GROUP BY job_id;

-- Assignment 5: Determine the number of managers without listing them. Label the column Number of Managers
SELECT COUNT(DISTINCT manager_id) AS "Number of Managers" 
FROM hr.employees;

-- Assignment 6: Find the difference between the highest and lowest salaries. Label the column DIFFERENCE.
SELECT MAX(salary) - MIN(salary) AS DIFFERENCE 
FROM hr.employees;

-- Assignment 7: Create a report to display the manager number and the salary of the lowest-paid employee for that manager. Exclude anyone whose manager is not known. Exclude any groups where the minimum salary is $2000 or less. Sort the output in descending order of salary.
SELECT manager_id, MIN(salary) 
FROM hr.employees 
WHERE manager_id IS NOT NULL 
GROUP BY manager_id 
HAVING MIN(salary) > 2000 
ORDER BY MIN(salary) DESC;

-- Assignment 8: Create a query to display the total number of employees and, of that total, the number of employees hired in 1980, 1981, and 1982. Create appropriate column headings.
SELECT COUNT(*) AS "TOTAL",
       COUNT(DECODE(TO_CHAR(hire_date, 'YYYY'), '1980', 1, NULL)) AS "1980",
       COUNT(DECODE(TO_CHAR(hire_date, 'YYYY'), '1981', 1, NULL)) AS "1981",
       COUNT(DECODE(TO_CHAR(hire_date, 'YYYY'), '1982', 1, NULL)) AS "1982"
FROM hr.employees;