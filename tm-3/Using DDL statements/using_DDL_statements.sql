-- ============================================================================
-- SQL Assignment Solutions
-- TM-3 Module 2: Using DDL Statements to Create and Manage Tables
-- ============================================================================

-- ----------------------------------------------------------------------------
-- Task 1: Create table dept1
-- Columns: DEPTNO INTEGER PK, DNAME VARCHAR2(30) NOT NULL, LOC VARCHAR2(30) NOT NULL
-- ----------------------------------------------------------------------------
CREATE TABLE dept1 (
    deptno INTEGER CONSTRAINT pk_dept1 PRIMARY KEY,
    dname VARCHAR2(30) NOT NULL,
    loc VARCHAR2(30) NOT NULL
);

-- ----------------------------------------------------------------------------
-- Task 2: Create table emp1
-- Columns: EMPNO INTEGER PK, ENAME VARCHAR2(28) NOT NULL, SAL NUMBER(10,2) CHECK(sal>5000),
--          MGR NUMBER FK(EMPNO), DEPTNO INTEGER FK(DEPTNO)
-- ----------------------------------------------------------------------------
CREATE TABLE emp1 (
    empno INTEGER CONSTRAINT pk_emp1 PRIMARY KEY,
    ename VARCHAR2(28) NOT NULL,
    sal NUMBER(10,2) CONSTRAINT chk_emp1_sal CHECK (sal > 5000),
    mgr NUMBER CONSTRAINT fk_emp1_mgr REFERENCES emp1(empno),
    deptno INTEGER CONSTRAINT fk_emp1_dept1 REFERENCES dept1(deptno)
);

-- ----------------------------------------------------------------------------
-- Task 3: Create tables Dept11, Emp11 from Dept1, Emp1
-- ----------------------------------------------------------------------------
CREATE TABLE dept11 AS 
SELECT * FROM dept1;

CREATE TABLE emp11 AS 
SELECT * FROM emp1;

-- ----------------------------------------------------------------------------
-- Task 4: Add a new column Address-Varchar2(30) in the Emp1 table
-- ----------------------------------------------------------------------------
ALTER TABLE emp1 
ADD (address VARCHAR2(30));

-- ----------------------------------------------------------------------------
-- Task 5: Rename SAL column in Emp1 table to SALARY
-- ----------------------------------------------------------------------------
ALTER TABLE emp1 
RENAME COLUMN sal TO salary;

-- ----------------------------------------------------------------------------
-- Task 6: Rename the FK constraint names and verify the names for the EMP1
-- ----------------------------------------------------------------------------
ALTER TABLE emp1 
RENAME CONSTRAINT fk_emp1_mgr TO fk_emp1_mgr_new;

ALTER TABLE emp1 
RENAME CONSTRAINT fk_emp1_dept1 TO fk_emp1_dept1_new;

SELECT constraint_name, constraint_type 
FROM user_constraints 
WHERE table_name = 'EMP1';

-- ----------------------------------------------------------------------------
-- Task 7: Modify ENAME Column by increasing the length of the column to 40
-- ----------------------------------------------------------------------------
ALTER TABLE emp1 
MODIFY (ename VARCHAR2(40));

-- ----------------------------------------------------------------------------
-- Task 8: Drop the NOT NULL constraint for ENAME
-- ----------------------------------------------------------------------------
ALTER TABLE emp1 
MODIFY (ename NULL);

-- ----------------------------------------------------------------------------
-- Task 9: Create comment on Dept1 table as 'Depts of WIPRO'
-- ----------------------------------------------------------------------------
COMMENT ON TABLE dept1 IS 'Depts of WIPRO';

-- ----------------------------------------------------------------------------
-- Task 10: Create comment on Deptno of Dept1 as 'Deptno of WIPRO'
-- ----------------------------------------------------------------------------
COMMENT ON COLUMN dept1.deptno IS 'Deptno of WIPRO';

-- ----------------------------------------------------------------------------
-- Task 11: Create a comment on Emp1 table as 'Employees of WIPRO'
-- ----------------------------------------------------------------------------
COMMENT ON TABLE emp1 IS 'Employees of WIPRO';

-- ----------------------------------------------------------------------------
-- Task 12: Create a comment on Empno of Emp1 table as 'Empno of WIPRO'
-- ----------------------------------------------------------------------------
COMMENT ON COLUMN emp1.empno IS 'Empno of WIPRO';

-- ----------------------------------------------------------------------------
-- Task 13: Remove all the comments on the tables and columns
-- ----------------------------------------------------------------------------
COMMENT ON TABLE dept1 IS '';
COMMENT ON COLUMN dept1.deptno IS '';
COMMENT ON TABLE emp1 IS '';
COMMENT ON COLUMN emp1.empno IS '';

-- ----------------------------------------------------------------------------
-- Task 14: Set salary, ename columns of Emp1 table as unused
-- ----------------------------------------------------------------------------
ALTER TABLE emp1 
SET UNUSED (salary, ename);

-- ----------------------------------------------------------------------------
-- Task 15: Drop the unused columns
-- ----------------------------------------------------------------------------
ALTER TABLE emp1 
DROP UNUSED COLUMNS;

-- ----------------------------------------------------------------------------
-- Task 16: Drop Emp1, Dept1 Tables
-- ----------------------------------------------------------------------------
DROP TABLE emp1 CASCADE CONSTRAINTS;
DROP TABLE dept1 CASCADE CONSTRAINTS;

-- ----------------------------------------------------------------------------
-- Task 17: Create Table Emp1 from EMP table by copying data also. Check your data.
-- ----------------------------------------------------------------------------
CREATE TABLE emp1 AS 
SELECT * FROM emp;

SELECT * FROM emp1;

-- ----------------------------------------------------------------------------
-- Task 18: Rename Emp1 to EMP_Test
-- ----------------------------------------------------------------------------
RENAME emp1 TO emp_test;

-- ----------------------------------------------------------------------------
-- Task 19: Truncate Emp_Test table and confirm your delete
-- ----------------------------------------------------------------------------
TRUNCATE TABLE emp_test;

SELECT * FROM emp_test;

-- ----------------------------------------------------------------------------
-- Task 20: Create Emp2 from Emp by only copying Empno, Ename, sal columns by copying Data
-- ----------------------------------------------------------------------------
CREATE TABLE emp2 AS 
SELECT empno, ename, sal 
FROM emp;

-- ----------------------------------------------------------------------------
-- Task 21: Drop Emp2 Table
-- ----------------------------------------------------------------------------
DROP TABLE emp2;

-- ----------------------------------------------------------------------------
-- Task 22: Create Emp2 table again from EMP table without copying data
-- ----------------------------------------------------------------------------
CREATE TABLE emp2 AS 
SELECT * FROM emp 
WHERE 1 = 2;

-- ----------------------------------------------------------------------------
-- Task 23: Drop Emp2 table
-- ----------------------------------------------------------------------------
DROP TABLE emp2;

-- ----------------------------------------------------------------------------
-- Task 24: Flashback the first Emp2 table that contained data and check your table
-- ----------------------------------------------------------------------------
FLASHBACK TABLE emp2 TO BEFORE DROP;

SELECT * FROM emp2;

-- ----------------------------------------------------------------------------
-- Task 25: Flashback the recently dropped table by renaming to EMP2_1
-- ----------------------------------------------------------------------------
FLASHBACK TABLE emp2 TO BEFORE DROP RENAME TO emp2_1;

-- ----------------------------------------------------------------------------
-- Task 26: Check your tables
-- ----------------------------------------------------------------------------
SELECT table_name 
FROM user_tables;
