-- ============================================================================
-- SQL Assignment Solutions
-- TM-3 Module 3: Manipulating Data (DML, Transactions, and Locking)
-- ============================================================================

-- ----------------------------------------------------------------------------
-- Task 1: Create EmpTest from Emp table by copying structure and data.
-- ----------------------------------------------------------------------------
CREATE TABLE emptest AS 
SELECT * FROM emp;

-- ----------------------------------------------------------------------------
-- Task 2: Add a new row into the EmpTest table for Empno, Ename, Sal columns.
-- In Ename should have the current user.
-- ----------------------------------------------------------------------------
INSERT INTO emptest (empno, ename, sal)
VALUES (9001, USER, 6000);

-- ----------------------------------------------------------------------------
-- Task 3: Update EmpTest by increasing the salary of TURNER by 15%. Confirm your changes.
-- ----------------------------------------------------------------------------
UPDATE emptest
SET sal = sal * 1.15
WHERE ename = 'TURNER';

SELECT * FROM emptest WHERE ename = 'TURNER';

-- ----------------------------------------------------------------------------
-- Task 4: Update the salary of Smith with salary of Scott using EmpTest table.
-- ----------------------------------------------------------------------------
UPDATE emptest
SET sal = (
    SELECT sal 
    FROM emptest 
    WHERE ename = 'SCOTT'
)
WHERE ename = 'SMITH';

-- ----------------------------------------------------------------------------
-- Task 5: Increase all the employees salary by 10% in EmpTest table who are working in NEW YORK.
-- ----------------------------------------------------------------------------
UPDATE emptest
SET sal = sal * 1.10
WHERE deptno = (
    SELECT deptno 
    FROM dept 
    WHERE loc = 'NEW YORK'
);

-- ----------------------------------------------------------------------------
-- Task 6: Delete all the Comm data from EmpTest Table.
-- ----------------------------------------------------------------------------
UPDATE emptest
SET comm = NULL;

-- ----------------------------------------------------------------------------
-- Task 7: Delete all the employees from EmpTest table who are working in SALES dept.
-- ----------------------------------------------------------------------------
DELETE FROM emptest
WHERE deptno = (
    SELECT deptno 
    FROM dept 
    WHERE dname = 'SALES'
);

-- ----------------------------------------------------------------------------
-- Task 8: Delete all who are working with that employee, except that Employee. (Prompt for the ENAME).
-- ----------------------------------------------------------------------------
DELETE FROM emptest
WHERE deptno = (
    SELECT deptno 
    FROM emptest 
    WHERE ename = UPPER('&p_ename')
)
AND ename != UPPER('&p_ename');

-- ----------------------------------------------------------------------------
-- Task 9: Create Emp2 from Emp by only copying Empno, Ename, sal without copying data.
-- ----------------------------------------------------------------------------
CREATE TABLE emp2 AS 
SELECT empno, ename, sal 
FROM emp 
WHERE 1 = 2;

-- ----------------------------------------------------------------------------
-- Task 10: Create Emp3 from Emp by only copying Empno, Job without copying data.
-- ----------------------------------------------------------------------------
CREATE TABLE emp3 AS 
SELECT empno, job 
FROM emp 
WHERE 1 = 2;

-- ----------------------------------------------------------------------------
-- Task 11: Using multitable insert Emp data into Emp2 and Emp3 Tables.
-- ----------------------------------------------------------------------------
INSERT ALL
    INTO emp2 (empno, ename, sal) VALUES (empno, ename, sal)
    INTO emp3 (empno, job) VALUES (empno, job)
SELECT empno, ename, sal, job 
FROM emp;

-- ----------------------------------------------------------------------------
-- Task 12: Truncate Emp2 Table and insert following two rows as follows: 
--          7788, SMITH, 4500 / 7654, JACK, 3500
-- ----------------------------------------------------------------------------
TRUNCATE TABLE emp2;

INSERT INTO emp2 (empno, ename, sal) VALUES (7788, 'SMITH', 4500);
INSERT INTO emp2 (empno, ename, sal) VALUES (7654, 'JACK', 3500);

-- ----------------------------------------------------------------------------
-- Task 13: Commit the Data.
-- ----------------------------------------------------------------------------
COMMIT;

-- ----------------------------------------------------------------------------
-- Task 14: Using Merge statement insert and update Emp2 using Emp.
-- ----------------------------------------------------------------------------
MERGE INTO emp2 target
USING emp source
ON (target.empno = source.empno)
WHEN MATCHED THEN
    UPDATE SET target.sal = source.sal, target.ename = source.ename
WHEN NOT MATCHED THEN
    INSERT (empno, ename, sal)
    VALUES (source.empno, source.ename, source.sal);

-- ----------------------------------------------------------------------------
-- Task 15: Verify your changes.
-- ----------------------------------------------------------------------------
SELECT * FROM emp2;

-- ----------------------------------------------------------------------------
-- Task 16: Rollback the Data.
-- ----------------------------------------------------------------------------
ROLLBACK;

-- ----------------------------------------------------------------------------
-- Task 17: Using Merge statements update Emp2 table for only Empno=7788 and 
--          Insert only those employees whose salary is more than 3000.
-- ----------------------------------------------------------------------------
MERGE INTO emp2 target
USING emp source
ON (target.empno = source.empno)
WHEN MATCHED THEN
    UPDATE SET target.sal = source.sal, target.ename = source.ename
    WHERE target.empno = 7788
WHEN NOT MATCHED THEN
    INSERT (empno, ename, sal)
    VALUES (source.empno, source.ename, source.sal)
    WHERE source.sal > 3000;

-- ----------------------------------------------------------------------------
-- Task 18: Verify your changes.
-- ----------------------------------------------------------------------------
SELECT * FROM emp2;


-- ============================================================================
-- MULTI-USER TRANSACTION & LOCKING SCENARIOS (Tasks 19 - 26)
-- ============================================================================

-- ----------------------------------------------------------------------------
-- Task 19: Create a User WIPRO. (Run as DBA / SYSTEM)
-- ----------------------------------------------------------------------------
CREATE USER wipro IDENTIFIED BY wipro123;
GRANT CREATE SESSION TO wipro;

-- ----------------------------------------------------------------------------
-- Task 20: Grant ALL permission on EMP table from SCOTT to WIPRO user. (Run in SCOTT)
-- ----------------------------------------------------------------------------
GRANT ALL ON emp TO wipro;

-- ----------------------------------------------------------------------------
-- Task 21: Delete all the employees in deptno 10 and do not issue a Commit. (Run in SCOTT)
-- ----------------------------------------------------------------------------
DELETE FROM emp WHERE deptno = 10;
-- (Note: DO NOT COMMIT HERE)

-- ----------------------------------------------------------------------------
-- Task 22: From WIPRO user delete all the employees from SCOTT.EMP table in DEPTNO=10.
--          What happens and Why? (Run in WIPRO)
-- ----------------------------------------------------------------------------
DELETE FROM scott.emp WHERE deptno = 10;

/* 
   EXPLANATION / WHAT HAPPENS:
   The session HANGS / BLOCKS indefinitely.
   
   WHY:
   In Task 21, SCOTT deleted rows in DEPTNO=10 without committing. This places an 
   Exclusive Row-Level Lock (X Lock) on those uncommitted rows. When WIPRO tries to 
   delete the same rows, Oracle forces WIPRO to wait for SCOTT's transaction to finish.
*/

-- ----------------------------------------------------------------------------
-- Task 23: Issue a Rollback in SCOTT user and Check the WIPRO user. (Run in SCOTT)
-- ----------------------------------------------------------------------------
-- Run in SCOTT:
ROLLBACK;

/* 
   WHAT HAPPENS IN WIPRO SESSION:
   As soon as SCOTT issues ROLLBACK, SCOTT's exclusive row locks are released.
   WIPRO's blocked query unblocks instantly and executes the delete operation.
*/

-- ----------------------------------------------------------------------------
-- Task 24: In SCOTT user give a query on EMP using FOR UPDATE clause with WAIT 20 seconds? 
--          What happens? (Run in SCOTT)
-- ----------------------------------------------------------------------------
SELECT * FROM emp 
WHERE deptno = 10 
FOR UPDATE WAIT 20;

/* 
   WHAT HAPPENS:
   SCOTT attempts to lock rows in DEPTNO=10. 
   - If WIPRO currently holds uncommitted locks on those rows, SCOTT will wait up to 
     20 seconds. If WIPRO doesn't commit/rollback within 20s, Oracle raises an error:
     "ORA-30006: resource busy and acquire with WAIT specified".
   - If no other session holds locks, SCOTT locks the rows immediately.
*/

-- ----------------------------------------------------------------------------
-- Task 25: In WIPRO User issue a ROLLBACK and now check in SCOTT user. (Run in WIPRO)
-- ----------------------------------------------------------------------------
-- Run in WIPRO:
ROLLBACK;

/* 
   WHAT HAPPENS IN SCOTT SESSION:
   WIPRO releases all its held locks. SCOTT can now successfully execute FOR UPDATE 
   statements without timing out.
*/

-- ----------------------------------------------------------------------------
-- Task 26: ROLLBACK all the transactions in SCOTT and WIPRO users.
-- ----------------------------------------------------------------------------
-- Run in SCOTT:
ROLLBACK;

-- Run in WIPRO:
ROLLBACK;
