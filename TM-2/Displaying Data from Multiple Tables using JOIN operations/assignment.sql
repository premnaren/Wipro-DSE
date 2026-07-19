-- MUST RUN THIS FIRST IN SQL DEVELOPER TO ACCESS THE PLUGGABLE DATABASE
ALTER SESSION SET CONTAINER = FREEPDB1;

-- Assignment 1: Write a query for the HR department to produce the addresses of all the departments. Show the EMPLOYEE_ID, LAST_NAME, SALARY, DEPARTMENT_NAME, and LOCATION_ID in the output. Use a NATURAL JOIN to produce the results.
SELECT employee_id, last_name, salary, department_name, location_id
FROM employees
NATURAL JOIN departments;

-- Assignment 2: The HR department needs a report of all employees. Write a query to display the JOB_ID, MANAGER_ID, SALARY, COMMISSION_PCT, and DEPARTMENT_NAME of employees whose JOB_ID matches the sales representative role (SA_REP).
SELECT e.job_id, e.manager_id, e.salary, e.commission_pct, d.department_name
FROM employees e
JOIN departments d ON (e.department_id = d.department_id)
WHERE e.job_id LIKE '%SA_REP%';

-- Assignment 3: The HR department needs a report of employees in city location 'Seattle'. Display the LAST_NAME, JOB_ID, DEPARTMENT_ID, and DEPARTMENT_NAME for all employees who work in Seattle.
SELECT e.last_name, e.job_id, e.department_id, d.department_name
FROM employees e
JOIN departments d ON (e.department_id = d.department_id)
JOIN locations l ON (d.location_id = l.location_id)
WHERE l.city = 'Seattle';

-- Assignment 4: Create a report to display employees' last name and employee number along with their manager's last name and manager number. Label the columns Employee, Emp#, Manager, and Mgr#, respectively.
SELECT e.last_name AS "Employee", e.employee_id AS "Emp#", m.last_name AS "Manager", m.employee_id AS "Mgr#"
FROM employees e
JOIN employees m ON (e.manager_id = m.employee_id);

-- Assignment 5: Modify the previous self-join query to display all employees including the top executive who has no corporate manager. Order the output results strictly by the employee number.
SELECT e.last_name AS "Employee", e.employee_id AS "Emp#", m.last_name AS "Manager", m.employee_id AS "Mgr#"
FROM employees e
LEFT OUTER JOIN employees m ON (e.manager_id = m.employee_id)
ORDER BY e.employee_id;

-- Assignment 6: The HR department needs a report on job titles and salary grades. Create a non-equijoin query that displays the name, job ID, department name, salary, and matching job title for all employees whose salary falls within the minimum and maximum ranges of a job role.
SELECT e.last_name, e.job_id, d.department_name, e.salary, j.job_title
FROM employees e
JOIN departments d ON (e.department_id = d.department_id)
JOIN jobs j ON (e.salary BETWEEN j.min_salary AND j.max_salary);

-- Assignment 7: Display the LAST_NAME and DEPARTMENT_NAME of all the employees. Also ensure you display those department names which do not currently have any active employees working inside them.
SELECT e.last_name, d.department_name
FROM employees e
RIGHT OUTER JOIN departments d ON (e.department_id = d.department_id);

-- Assignment 8: The HR department needs to find the names and hire dates for all employees who were hired chronologically before their direct managers, along with their managers' names and hire dates.
SELECT e.last_name AS "Emp Name", e.hire_date AS "Emp Hiredate", m.last_name AS "Mgr Name", m.hire_date AS "Mgr Hiredate"
FROM employees e
JOIN employees m ON (e.manager_id = m.employee_id)
WHERE e.hire_date < m.hire_date;

-- Assignment 9: Display the EMPLOYEE_ID, LAST_NAME, DEPARTMENT_NAME, and LOCATION_ID of those employees who are working as a clerk. Enforce the relational link using the USING clause.
SELECT employee_id, last_name, department_name, location_id
FROM employees
JOIN departments USING (department_id)
WHERE job_id LIKE '%CLERK%';

-- Assignment 10: Display the LAST_NAME, SALARY, MANAGER_ID, and DEPARTMENT_NAME of employees whose salary metric is more than 2000. Use an explicit ON clause for the relational predicate.
SELECT e.last_name, e.salary, e.manager_id, d.department_name
FROM employees e
JOIN departments d ON (e.department_id = d.department_id)
WHERE e.salary > 2000;

-- Assignment 11: Display the EMPLOYEE_ID, LAST_NAME, JOB_ID, DEPARTMENT_ID, DEPARTMENT_NAME, and CITY location of employees. Ensure all worker records are retained using a LEFT OUTER JOIN configuration.
SELECT e.employee_id, e.last_name, e.job_id, e.department_id, d.department_name, l.city
FROM employees e
LEFT OUTER JOIN departments d ON (e.department_id = d.department_id)
LEFT OUTER JOIN locations l ON (d.location_id = l.location_id);

-- Assignment 12: Display the LAST_NAME and DEPARTMENT_NAME of employees. Ensure all departments are retained, including vacant ones, using a RIGHT OUTER JOIN configuration.
SELECT e.last_name, d.department_name
FROM employees e
RIGHT OUTER JOIN departments d ON (e.department_id = d.department_id);

-- Assignment 13: Display the EMPLOYEE_ID, DEPARTMENT_NAME, and CITY location of employees. Include unmatched records from both sides of the relationship layout by executing a FULL OUTER JOIN.
SELECT e.employee_id, d.department_name, l.city
FROM employees e
FULL OUTER JOIN departments d ON (e.department_id = d.department_id)
FULL OUTER JOIN locations l ON (d.location_id = l.location_id);