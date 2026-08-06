# 📘 Oracle SQL Study Guide: SQL Mini Project

A comprehensive reference explaining every Oracle SQL concept used in the SQL Mini Project. This guide is intended as study material for lab examinations, viva questions, and future reference.

---

# Table of Contents

1. Introduction to Relational Databases
2. Database Schema Used
3. Data Definition Language (DDL)
4. Data Manipulation Language (DML)
5. SQL Constraints
6. Primary Key
7. Foreign Key
8. Composite Primary Key
9. Relationships Between Tables
10. Joins
11. Aggregate Functions
12. WHERE vs HAVING
13. String Functions (UPPER)
14. Views
15. Synonyms
16. Indexes
17. Referential Integrity
18. Transaction Control
19. Complete Workflow of the Mini Project
20. Key Takeaways

---

# Module 1: Introduction to Relational Databases

A **Relational Database Management System (RDBMS)** stores information in the form of tables. Every table consists of rows (records) and columns (attributes). Tables can be connected using relationships, allowing data to be stored efficiently without unnecessary duplication.

Oracle Database is one of the most widely used enterprise-grade RDBMS products. SQL (Structured Query Language) is the language used to communicate with Oracle databases.

Advantages of a relational database include:

- Eliminates duplicate data
- Maintains consistency
- Supports secure access
- Enforces relationships
- Provides powerful querying capabilities

---

# Module 2: Database Schema Used

The project contains four tables.

## LODGE_DETAILS

Stores lodge information.

| Column | Description |
|---|---|
| Lodge_Name | Unique name of lodge |
| Lodge_Manager | Manager of the lodge |
| Lodge_Address | Address |

---

## EMP_DETAILS

Stores employee information.

| Column | Description |
|---|---|
| Empno | Employee ID |
| First_Name | First name |
| Last_Name | Last name |
| Lodge_Name | Lodge where employee stays |

Each employee belongs to one lodge.

---

## SKILL_DETAILS

Stores available technologies.

| Column | Description |
|---|---|
| Skill | Skill name |
| Skill_Desc | Organization or description |

---

## EMP_SKILL

Stores employee skills.

| Column | Description |
|---|---|
| Empno | Employee ID |
| Skill | Skill |
| Grade | Skill proficiency |

One employee can have many skills and one skill can belong to many employees.

This creates a **Many-to-Many relationship**.

---

# Module 3: Data Definition Language (DDL)

DDL commands define or modify database structures.

## CREATE TABLE

Creates a new table.

Syntax

```sql
CREATE TABLE table_name(
 column datatype constraint
);
```

Example

```sql
CREATE TABLE EMP_Details(
 Empno INTEGER PRIMARY KEY,
 First_Name VARCHAR2(30)
);
```

---

## CREATE VIEW

A View is a virtual table created from another SQL query.

Views do not store data separately. Instead, Oracle executes the stored query whenever the view is accessed.

Advantages

- Simplifies complex joins
- Improves security
- Hides unnecessary columns
- Makes reporting easier

Example

```sql
CREATE VIEW EMP_VIEW AS
SELECT Empno, First_Name
FROM EMP_Details;
```

---

## CREATE SYNONYM

A synonym provides an alternate name for a database object.

Instead of typing

```sql
SELECT * FROM EMP_VIEW;
```

you can write

```sql
SELECT * FROM EMPV;
```

Example

```sql
CREATE SYNONYM EMPV
FOR EMP_VIEW;
```

---

## CREATE INDEX

Indexes improve searching performance.

Without an index, Oracle scans every row.

With an index, Oracle directly locates matching records.

Syntax

```sql
CREATE INDEX index_name
ON table_name(column_name);
```

Example

```sql
CREATE INDEX IDX_EMP_SKILL
ON EMP_SKILL(Skill);
```

Advantages

- Faster SELECT queries
- Better search performance
- Faster JOIN operations

Disadvantage

- Slightly slower INSERT, UPDATE and DELETE because the index must also be updated.

---

# Module 4: Data Manipulation Language (DML)

DML commands manipulate existing records.

## INSERT

Adds new rows.

```sql
INSERT INTO EMP_DETAILS
VALUES(101,'James','Jackson','Rajesh Lodge');
```

---

## UPDATE

Changes existing records.

```sql
UPDATE EMP_DETAILS
SET Lodge_Name='Gooday Lodge'
WHERE Empno=101;
```

Always use a WHERE clause unless every row should be updated.

---

## DELETE

Deletes records.

```sql
DELETE FROM EMP_DETAILS
WHERE Empno=103;
```

When parent-child relationships exist, child records must usually be deleted first.

---

# Module 5: SQL Constraints

Constraints enforce rules to maintain accurate and valid data.

| Constraint | Purpose |
|---|---|
| PRIMARY KEY | Unique identifier |
| FOREIGN KEY | Links two tables |
| NOT NULL | Prevents NULL values |
| UNIQUE | Prevents duplicates |
| CHECK | Restricts allowed values |

---

# Module 6: Primary Key

A Primary Key uniquely identifies every record.

Properties

- Cannot contain NULL
- Cannot contain duplicates
- One primary key per table

Example

```sql
Empno INTEGER PRIMARY KEY
```

---

# Module 7: Foreign Key

A Foreign Key establishes a relationship between two tables.

Example

```sql
FOREIGN KEY(Lodge_Name)
REFERENCES Lodge_Details(Lodge_Name)
```

Benefits

- Prevents invalid references
- Maintains consistency
- Enforces referential integrity

---

# Module 8: Composite Primary Key

A composite primary key consists of more than one column.

In EMP_SKILL

```sql
PRIMARY KEY(Empno, Skill)
```

This means

- Employee 101 can have Oracle SQL
- Employee 101 can have Sybase
- Employee 101 cannot have Oracle SQL twice

---

# Module 9: Relationships Between Tables

The project demonstrates two relationship types.

### One-to-Many

Lodge → Employees

One lodge contains many employees.

### Many-to-Many

Employees ↔ Skills

Implemented using the EMP_SKILL bridge table.

---

# Module 10: SQL Joins

Joins combine data from multiple tables.

The project uses INNER JOIN.

Example

```sql
SELECT e.First_Name,
       l.Lodge_Manager
FROM EMP_Details e
JOIN Lodge_Details l
ON e.Lodge_Name=l.Lodge_Name;
```

Execution

1. Oracle compares Lodge_Name.
2. Matching rows are combined.
3. Result is displayed.

---

# Module 11: Aggregate Functions

Aggregate functions summarize multiple rows.

| Function | Purpose |
|---|---|
| COUNT() | Counts rows |
| SUM() | Total |
| AVG() | Average |
| MAX() | Highest value |
| MIN() | Lowest value |

Example

```sql
SELECT COUNT(*)
FROM EMP_SKILL
WHERE Empno=101;
```

Result

Employee 101 possesses two skills.

---

# Module 12: WHERE vs HAVING

## WHERE

Filters rows before grouping.

```sql
SELECT *
FROM EMP_DETAILS
WHERE Empno=101;
```

## HAVING

Filters grouped results.

```sql
SELECT Empno,
COUNT(*)
FROM EMP_SKILL
GROUP BY Empno
HAVING COUNT(*)>1;
```

Difference

| WHERE | HAVING |
|---|---|
| Filters rows | Filters groups |
| Used before GROUP BY | Used after GROUP BY |

---

# Module 13: String Functions (UPPER)

The project searches for Sybase irrespective of uppercase/lowercase.

```sql
WHERE UPPER(Skill)=UPPER('Sybase')
```

Examples matched

- Sybase
- SYBASE
- sybase
- SyBaSe

This is called a **case-insensitive search**.

---

# Module 14: Views

Views store SQL logic instead of duplicate data.

Benefits

- Simplifies reports
- Reuses queries
- Improves security
- Easier maintenance

---

# Module 15: Synonyms

Synonyms provide alternate object names.

Benefits

- Shorter names
- Easier SQL writing
- Easier object migration

---

# Module 16: Indexes

Indexes work similarly to a book's index.

Without an index

Oracle reads every row.

With an index

Oracle directly locates matching rows.

Indexes greatly improve performance on frequently searched columns.

---

# Module 17: Referential Integrity

Referential Integrity ensures every foreign key references a valid parent row.

Example

Employee cannot reference a lodge that does not exist.

Similarly,

EMP_SKILL cannot reference an employee that has been deleted.

This is why the project deletes the EMP_SKILL record before deleting EMP_DETAILS.

---

# Module 18: Transaction Control

Oracle groups DML statements into transactions.

## COMMIT

Permanently saves changes.

```sql
COMMIT;
```

## ROLLBACK

Undoes changes made since the last commit.

```sql
ROLLBACK;
```

---

# Module 19: Complete Workflow of the Mini Project

1. Create database tables.
2. Define constraints.
3. Insert master records.
4. Insert employee records.
5. Insert skill records.
6. Update employee lodge.
7. Delete resigned employee.
8. Generate reports using joins.
9. Create a reusable view.
10. Create a synonym.
11. Improve performance with an index.

---

# Module 20: Key Takeaways

After completing this project, you should understand:

- Relational database concepts
- Database normalization
- Parent-child relationships
- One-to-Many relationships
- Many-to-Many relationships
- Primary keys
- Foreign keys
- Composite keys
- Constraints
- DDL commands
- DML commands
- Transactions
- Joins
- Aggregate functions
- Case-insensitive searching
- Views
- Synonyms
- Indexes
- Referential integrity
- SQL report generation

This mini project demonstrates a complete end-to-end Oracle SQL workflow, from database creation to reporting and performance optimization.
