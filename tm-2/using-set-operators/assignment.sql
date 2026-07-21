-- MUST RUN THIS FIRST IN SQL DEVELOPER TO ACCESS THE PLUGGABLE DATABASE
ALTER SESSION SET CONTAINER = FREEPDB1;

-- Assignment 1: Create a matrix query to display the job, the salary for that job based on department number, and the total salary for that job, for departments 10, 20, and 30, giving each column an appropriate heading.
SELECT job_id AS "Job",
       SUM(DECODE(department_id, 10, salary, NULL)) AS "Dept 10 Sal",
       SUM(DECODE(department_id, 20, salary, NULL)) AS "Dept 20 Sal",
       SUM(DECODE(department_id, 30, salary, NULL)) AS "Dept 30 Sal",
       SUM(salary) AS "Total Salary"
FROM hr.employees
GROUP BY job_id;

-- Assignment 2: Using set operator display the DEPTNO, SUM(SAL) for each dept, JOB, SUM(SAL) for each Job and Total Salary.
SELECT TO_CHAR(department_id) AS "Grouping_Criteria", SUM(salary) AS "SUM_SAL"
FROM hr.employees
GROUP BY department_id
UNION ALL
SELECT job_id, SUM(salary)
FROM hr.employees
GROUP BY job_id
UNION ALL
SELECT 'Grand Total', SUM(salary)
FROM hr.employees;

-- Assignment 3: Using Set Operator display the JOB and Deptno in employees working in deptno 20,10,30 in that order.
SELECT job_id, department_id, 1 AS sort_order
FROM hr.employees
WHERE department_id = 20
UNION ALL
SELECT job_id, department_id, 2
FROM hr.employees
WHERE department_id = 10
UNION ALL
SELECT job_id, department_id, 3
FROM hr.employees
WHERE department_id = 30
ORDER BY sort_order;