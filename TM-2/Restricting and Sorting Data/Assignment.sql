-- MUST RUN THIS FIRST IN SQL DEVELOPER TO ACCESS THE PLUGGABLE DATABASE
ALTER SESSION SET CONTAINER = FREEPDB1;

-- Assignment 1: Display the Ename, Sal, Comm from Emp table who earn commission and sort the records in descending order of Salary and Comm. Use column's numeric position in the ORDER BY clause
SELECT last_name, salary, commission_pct 
FROM hr.employees 
WHERE commission_pct IS NOT NULL 
ORDER BY 2 DESC, 3 DESC;

-- Assignment 2: The HR department needs a query to display all unique job codes from the EMP table.
SELECT DISTINCT job_id 
FROM hr.employees;

-- Assignment 3: The HR department wants more descriptive column headings for its report on employees. Name the column headings Emp #, Employee, Job, and Hire Date, respectively by giving Column Alias.
SELECT employee_id AS "Emp #", last_name AS "Employee", job_id AS "Job", hire_date AS "Hire Date" 
FROM hr.employees;

-- Assignment 4: The HR department has requested a report of all employees and their job IDs. Display the last name concatenated with the job ID (separated by a comma and space) and name the column Employee and Title by giving Column Alias.
SELECT last_name || ', ' || job_id AS "Employee and Title" 
FROM hr.employees;

-- Assignment 5: To familiarize yourself with the data in the EMP table, create a query to display all the data from that table. Separate each column output by a comma. ENAME,JOB,HIREDATE,MGR.Name the column title THE_OUTPUT.
SELECT employee_id || ',' || job_id || ',' || hire_date || ',' || manager_id AS THE_OUTPUT 
FROM hr.employees;

-- Assignment 6: Create a report to display the ename, job , and Hiredate for the employees name is SCOTT or TURNER. Order the query in ascending order by hiredate.
SELECT first_name, job_id, hire_date 
FROM hr.employees 
WHERE last_name IN ('SCOTT', 'TURNER') 
ORDER BY hire_date ASC;

-- Assignment 7: Display the ename and department number of all employees in departments 20 or 30 in ascending alphabetical order by ename.
SELECT last_name, department_id 
FROM hr.employees 
WHERE department_id IN (20, 30) 
ORDER BY last_name ASC;

-- Assignment 8: Modify the previous query to display the last name and salary of employees who earn between 2000 and 3000 and are in department 20 or 30. Label the columns Employee and Monthly Salary, respectively giving Column Alias.
SELECT last_name AS "Employee", salary AS "Monthly Salary" 
FROM hr.employees 
WHERE salary BETWEEN 2000 AND 3000 
AND department_id IN (20, 30);

-- Assignment 9: The HR department needs a report that displays the last name and hire date for all employees who were hired in 1981
SELECT last_name, hire_date 
FROM hr.employees 
WHERE hire_date LIKE '%81' OR hire_date LIKE '%1981%';

-- Assignment 10: Display the Ename, Sal of employees who earn more than an amount the user specifies after a Prompt.(Example: Enter the salary amount: 15000)
SELECT last_name, salary 
FROM hr.employees 
WHERE salary > &user_sal_amount;

-- Assignment 11: Create a report to display the last name and job title of all employees who do not have a manager.
SELECT last_name, job_id 
FROM hr.employees 
WHERE manager_id IS NULL;

-- Assignment 12: Create a query that prompts the user for Manager ID and generate EMPNO,ENAME,SAL,DEPTNO. The user should have the ability to sort the records on a selected Column.(Example: Enter the column name to sort by: salary)
SELECT employee_id, last_name, salary, department_id 
FROM hr.employees 
WHERE manager_id = &prompt_mgr_id 
ORDER BY &prompt_sort_column;

-- Assignment 13: The HR department wants to run reports based on a manager. Create a query that prompts the user for a MGR and generates the empno, ename, salary, and department for that manager's employees. The HR department wants the ability to sort the report on a selected column. (Example: Enter the column name to sort by: salary)
SELECT employee_id, last_name, salary, department_id 
FROM hr.employees 
WHERE manager_id = &prompt_mgr 
ORDER BY &prompt_sort_col;

-- Assignment 14: Display all employee last names in which the third letter of the name is A 
SELECT last_name 
FROM hr.employees 
WHERE last_name LIKE '__A%';
-- No data is returned because there are no last names in the employees table where the third letter is A in the HR DB

-- Assignment 15: Display the last name of all employees who have both an A and an S in their ename
SELECT last_name 
FROM hr.employees 
WHERE last_name LIKE '%A%' 
AND last_name LIKE '%S%';
-- No data is returned because there are no last names in the employees table that contain both an A and an S in the HR DB

-- Assignment 16: Display the Ename, Job, Sal for all employees whose jobs are CLERK and whose salary is in 800 or 950 or 1300.
SELECT last_name, job_id, salary 
FROM hr.employees 
WHERE job_id LIKE '%CLERK%' 
AND salary IN (800, 950, 1300);
-- No data is returned because there are no employees in the employees table with the job CLERK and salary of 800, 950, or 1300 in the HR DB