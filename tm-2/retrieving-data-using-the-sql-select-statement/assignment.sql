ALTER SESSION SET CONTAINER = FREEPDB1;
DESC hr.departments;
SELECT * FROM hr.departments;

DESC hr.employees;
SELECT * FROM hr.employees;

SELECT first_name, last_name, department_id 
FROM hr.employees 
WHERE employee_id = 100;