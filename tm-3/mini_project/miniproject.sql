-- ============================================================
-- SQL MINI PROJECT SOLUTION
-- ============================================================

-- Q1. Create the required tables

CREATE TABLE LODGE_Details (
    Lodge_Name VARCHAR2(30) PRIMARY KEY,
    Lodge_Manager VARCHAR2(30) NOT NULL,
    Lodge_Address VARCHAR2(30)
);

CREATE TABLE EMP_Details (
    Empno INTEGER PRIMARY KEY,
    First_Name VARCHAR2(30) NOT NULL,
    Last_Name VARCHAR2(30) NOT NULL,
    Lodge_Name VARCHAR2(30),
    CONSTRAINT fk_emp_lodge
        FOREIGN KEY (Lodge_Name)
        REFERENCES LODGE_Details(Lodge_Name)
);

CREATE TABLE SKILL_Details (
    Skill VARCHAR2(30) PRIMARY KEY,
    Skill_Desc VARCHAR2(30)
);

CREATE TABLE EMP_Skill (
    Empno INTEGER,
    Skill VARCHAR2(30),
    Grade NUMBER(10),
    CONSTRAINT pk_emp_skill PRIMARY KEY (Empno, Skill),
    CONSTRAINT fk_emp_skill_emp
        FOREIGN KEY (Empno)
        REFERENCES EMP_Details(Empno),
    CONSTRAINT fk_emp_skill_skill
        FOREIGN KEY (Skill)
        REFERENCES SKILL_Details(Skill)
);

-- ============================================================
-- Q2. Insert the given records
-- ============================================================

INSERT INTO LODGE_Details VALUES ('Jessy Lodge','Rajan','Rakesh Nagar');
INSERT INTO LODGE_Details VALUES ('Rajesh Lodge','Rajani','Anna Nagar');
INSERT INTO LODGE_Details VALUES ('Gooday Lodge','John','Sea Road');

INSERT INTO EMP_Details VALUES (101,'James','Jackson','Rajesh Lodge');
INSERT INTO EMP_Details VALUES (102,'Kalpash','Raj','Gooday Lodge');
INSERT INTO EMP_Details VALUES (103,'Jasmine','Joy','Jessy Lodge');

INSERT INTO SKILL_Details VALUES ('Oracle SQL','Oracle Corporation');
INSERT INTO SKILL_Details VALUES ('Dot Net','Microsoft');
INSERT INTO SKILL_Details VALUES ('Sybase','SAP Corporation');

INSERT INTO EMP_Skill VALUES (101,'Oracle SQL',9);
INSERT INTO EMP_Skill VALUES (101,'Sybase',8);
INSERT INTO EMP_Skill VALUES (102,'Dot Net',9);
INSERT INTO EMP_Skill VALUES (103,'Oracle SQL',8);

COMMIT;

-- ============================================================
-- Q3. Employee 101 changed lodge to Gooday Lodge
-- ============================================================

UPDATE EMP_Details
SET Lodge_Name='Gooday Lodge'
WHERE Empno=101;

-- ============================================================
-- Q4. Employee 103 resigned. Delete employee details.
-- ============================================================

DELETE FROM EMP_Skill
WHERE Empno=103;

DELETE FROM EMP_Details
WHERE Empno=103;

COMMIT;

-- ============================================================
-- Q5(a). Employees having skill Sybase (case-insensitive)
-- ============================================================

SELECT e.Empno,
       e.First_Name,
       e.Last_Name,
       s.Skill,
       s.Grade
FROM EMP_Details e
JOIN EMP_Skill s
ON e.Empno=s.Empno
WHERE UPPER(s.Skill)=UPPER('Sybase');

-- ============================================================
-- Q5(b). Employee First Name and Lodge Manager
-- ============================================================

SELECT e.First_Name,
       l.Lodge_Manager
FROM EMP_Details e
JOIN LODGE_Details l
ON e.Lodge_Name=l.Lodge_Name;

-- ============================================================
-- Q5(c). Number of skills employee 101 has
-- ============================================================

SELECT Empno,
       COUNT(*) AS Number_Of_Skills
FROM EMP_Skill
WHERE Empno=101
GROUP BY Empno;

-- ============================================================
-- Q5(d). Employee First Name having Oracle SQL skill
-- ============================================================

SELECT e.First_Name
FROM EMP_Details e
JOIN EMP_Skill s
ON e.Empno=s.Empno
WHERE s.Skill='Oracle SQL';

-- ============================================================
-- Q6. Create a View
-- ============================================================

CREATE OR REPLACE VIEW EMP_VIEW AS
SELECT e.Empno,
       e.First_Name,
       s.Skill,
       l.Lodge_Manager
FROM EMP_Details e
JOIN EMP_Skill s
ON e.Empno=s.Empno
JOIN LODGE_Details l
ON e.Lodge_Name=l.Lodge_Name;

-- ============================================================
-- Q7. Create a Synonym
-- ============================================================

CREATE SYNONYM EMPV FOR EMP_VIEW;

-- ============================================================
-- Q8. Create an Index on Skill column
-- ============================================================

CREATE INDEX IDX_EMP_SKILL
ON EMP_Skill(Skill);
