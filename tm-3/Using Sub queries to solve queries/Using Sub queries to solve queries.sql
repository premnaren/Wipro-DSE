-- ============================================================
-- TM-3 (Advanced SQL) - Module 1
-- Using Sub Queries to Solve Queries
-- Solutions (Oracle SQL using SCOTT.EMP and DEPT tables)
-- ============================================================

-- Q1. EMPNO, ENAME, DEPTNO of employees who work with employee 7788
SELECT EMPNO, ENAME, DEPTNO
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE EMPNO = 7788);

-- Q2. Employees earning more than average salary
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > (SELECT AVG(SAL) FROM EMP);

-- Q3. Managers using EXISTS
SELECT ENAME, JOB
FROM EMP E
WHERE EXISTS (
    SELECT 1
    FROM EMP M
    WHERE M.MGR = E.EMPNO
);

-- Q4. Employees earning less than least salary in Dept 10
SELECT ENAME, SAL
FROM EMP
WHERE SAL < ALL
(
    SELECT SAL
    FROM EMP
    WHERE DEPTNO=10
);

-- Q5. Same department and manager as employee 7788 excluding that employee
SELECT *
FROM EMP
WHERE DEPTNO=(SELECT DEPTNO FROM EMP WHERE EMPNO=7788)
AND MGR=(SELECT MGR FROM EMP WHERE EMPNO=7788)
AND EMPNO<>7788;

-- Q6. Employees working in department having employee whose name contains R
SELECT EMPNO, ENAME
FROM EMP
WHERE DEPTNO IN
(
SELECT DISTINCT DEPTNO
FROM EMP
WHERE ENAME LIKE '%R%'
);

-- Q7. ENAME, DEPTNO, JOB of employees working in NEW YORK
SELECT ENAME, DEPTNO, JOB
FROM EMP
WHERE DEPTNO =
(
SELECT DEPTNO
FROM DEPT
WHERE LOC='NEW YORK'
);

-- Q8. Prompt user for location
ACCEPT P_LOC CHAR PROMPT 'Enter Location : '

SELECT ENAME, DEPTNO, JOB
FROM EMP
WHERE DEPTNO=
(
SELECT DEPTNO
FROM DEPT
WHERE UPPER(LOC)=UPPER('&P_LOC')
);

-- Q9. Employees reporting to KING
SELECT ENAME, SAL
FROM EMP
WHERE MGR=
(
SELECT EMPNO
FROM EMP
WHERE ENAME='KING'
);

-- Q10. Employees working with JAMES
SELECT *
FROM EMP
WHERE DEPTNO=
(
SELECT DEPTNO
FROM EMP
WHERE ENAME='JAMES'
);

-- Q11. Employees earning less than department average
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP E
WHERE SAL <
(
SELECT AVG(SAL)
FROM EMP
WHERE DEPTNO=E.DEPTNO
);

-- Q12. Display location and average salary
SELECT D.LOC,
(
SELECT AVG(SAL)
FROM EMP E
WHERE E.DEPTNO=D.DEPTNO
) AVG_SAL
FROM DEPT D;

-- Q13. Least N salaries (replace &N)
SELECT *
FROM
(
SELECT *
FROM EMP
ORDER BY SAL
)
WHERE ROWNUM<=&N;

-- Q14. Last N rows from EMP
SELECT *
FROM
(
SELECT *
FROM EMP
ORDER BY EMPNO DESC
)
WHERE ROWNUM<=&N;

-- Q15. Employees working in DALLAS
SELECT *
FROM EMP
WHERE DEPTNO=
(
SELECT DEPTNO
FROM DEPT
WHERE LOC='DALLAS'
);

-- Q16. Employees earning below department average with average displayed
SELECT E.EMPNO,
       E.ENAME,
       E.SAL,
       X.AVGSAL
FROM EMP E
JOIN
(
SELECT DEPTNO,
AVG(SAL) AVGSAL
FROM EMP
GROUP BY DEPTNO
) X
ON E.DEPTNO=X.DEPTNO
WHERE E.SAL<X.AVGSAL;

-- Q17. Locations of departments having salary sum less than overall average salary
WITH DEPT_SUM AS
(
SELECT D.LOC,
SUM(E.SAL) TOTALSAL
FROM EMP E
JOIN DEPT D
ON E.DEPTNO=D.DEPTNO
GROUP BY D.LOC
)
SELECT LOC
FROM DEPT_SUM
WHERE TOTALSAL <
(
SELECT AVG(SAL)
FROM EMP
);
