-- MUST RUN THIS FIRST IN SQL DEVELOPER TO ACCESS THE PLUGGABLE DATABASE
ALTER SESSION SET CONTAINER = FREEPDB1;

-- Assignment 1: Write a query to display the current date. Label the column Date.
SELECT SYSDATE AS "Date" 
FROM dual;

-- Assignment 2: The HR department needs a report to display the employee number, last name, salary, and salary increased by 15.5% (expressed as a whole number) for each employee. Label the column New Salary.
SELECT employee_id, last_name, salary, ROUND(salary * 1.155) AS "New Salary" FROM hr.employees;

-- Assignment 3: Modify the previous query to add a column alias that subtracts the old salary from the new salary. Label the column Increase
SELECT employee_id, last_name, salary, ROUND(salary * 1.155) AS "New Salary", ROUND(salary * 1.155) - salary AS "Increase" 
FROM hr.employees;

-- Assignment 4: Write a query that displays the ename (with the first letter uppercase and all other letters lowercase) and the length of the ename for all employees whose name starts with the letters J, A, or M. Give each column an appropriate label. Sort the results by the employees' enames.
SELECT INITCAP(last_name) AS "Name", LENGTH(last_name) AS "Length" 
FROM hr.employees 
WHERE last_name LIKE 'J%' OR last_name LIKE 'A%' OR last_name LIKE 'M%' 
ORDER BY last_name ASC;

-- Assignment 5: Rewrite the query so that the user is prompted to enter a letter that starts the last name. For example, if the user enters H when prompted for a letter, then the output should show all employees whose last name starts with the letter H.
SELECT INITCAP(last_name) AS "Name", LENGTH(last_name) AS "Length" 
FROM hr.employees 
WHERE last_name LIKE '&start_letter%' 
ORDER BY last_name ASC;

-- Assignment 6: The HR department wants to find the length of employment for each employee. For each employee, display the ename and calculate the number of months between today and the date on which the employee was hired. Label the column MONTHS_WORKED. Order your results by the number of months employed. Round the number of months up to the closest whole number.
SELECT last_name, CEIL(MONTHS_BETWEEN(SYSDATE, hire_date)) AS MONTHS_WORKED 
FROM hr.employees 
ORDER BY MONTHS_WORKED ASC;

-- Assignment 7: Create a report that produces the following for each employee: <ename> earns <salary> monthly but wants <3 times salary>. Label the column Dream Salaries.
SELECT last_name || ' earns ' || TO_CHAR(salary, '$99,999.00') || ' monthly but wants ' || TO_CHAR(salary * 3, '$99,999.00') AS "Dream Salaries" 
FROM hr.employees;

-- Assignment 8: Create a query to display the last name and salary for all employees. Format the salary to be 15 characters long, left-padded with the $ symbol. Label the column SALARY.
SELECT last_name, LPAD(TO_CHAR(salary), 15, '$') AS SALARY 
FROM hr.employees;

-- Assignment 9: Display each employee's last name, hire date, and salary review date, which is the first Monday after six months of service. Label the column REVIEW. Format the dates to appear in the format similar to "Monday, the Thirty-First of July, 2000."
SELECT last_name, hire_date, TO_CHAR(NEXT_DAY(ADD_MONTHS(hire_date, 6), 'MONDAY'), 'Dlsp, ""the"" Ddspth ""of"" Month, YYYY') AS REVIEW 
FROM hr.employees;

-- Assignment 10: Display the last name, hire date, and day of the week on which the employee started. Label the column DAY. Order the results by the day of the week, starting with Monday.
SELECT last_name, hire_date, TO_CHAR(hire_date, 'DAY') AS DAY 
FROM hr.employees 
ORDER BY TO_CHAR(hire_date - 1, 'D') ASC;

-- Assignment 11: Create a query that displays the employees' last names and commission amounts. If an employee does not earn commission, show "No Commission." Label the column COMM.
SELECT last_name, NVL(TO_CHAR(commission_pct, '0.00'), 'No Commission') AS COMM 
FROM hr.employees;

-- Assignment 12: Create a query that displays the first eight characters of the employees' last names and indicates the amounts of their salaries with asterisks. Each asterisk signifies a thousand dollars. Sort the data in descending order of salary. Label the column EMPLOYEES_AND_THEIR_SALARIES.
SELECT RPAD(SUBSTR(last_name, 1, 8), 8, ' ') || ' ' || RPAD(' ', TRUNC(salary / 1000) + 1, '*') AS EMPLOYEES_AND_THEIR_SALARIES 
FROM hr.employees 
ORDER BY salary DESC;

-- Assignment 13: Using the DECODE function, write a query that displays the grade of all employees based on the value of the column JOB_ID, using the following data: PRESIDENT-A,MANAGER-B,SALESMAN-C,CLERK-D
SELECT last_name, job_id, DECODE(SUBSTR(job_id, 4), 'PRES', 'A', 'MGR', 'B', 'REP', 'C', 'CLERK', 'D', 'X') AS GRADE 
FROM hr.employees;

-- Assignment 14: Rewrite the statement in the preceding exercise using the CASE syntax
SELECT last_name, job_id, 
  CASE 
    WHEN job_id LIKE '%PRES%' THEN 'A'
    WHEN job_id LIKE '%MGR%' THEN 'B'
    WHEN job_id LIKE '%REP%' THEN 'C'
    WHEN job_id LIKE '%CLERK%' THEN 'D'
    ELSE 'X'
  END AS GRADE
FROM hr.employees;