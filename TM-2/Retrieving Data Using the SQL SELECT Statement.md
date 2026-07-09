# 📖 Module Guide: Retrieving Data Using the SQL SELECT Statement

This study journal contains clear core concepts, practical syntax explanations, example queries targeting your active `HR` database tables, and exact expected terminal outputs for this module.

---

## 📋 1. View Data Using SELECT

### Core Concepts
The `SELECT` statement is the foundation of data retrieval in SQL. It tells the database engine exactly which attributes (columns) you want to extract and from which table source.
* **Projection:** Selecting specific columns instead of pulling the entire table structure.
* **Selection:** Filtering data rows vertically (typically using a `WHERE` clause).
* **Asterisk (*):** A wildcard character used to display all columns defined in a table.

### Example Queries & Outputs

#### Query A: Projecting Specific Columns
```sql
SELECT employee_id, first_name, last_name, salary 
FROM employees;
```

#### Output A:
```text
EMPLOYEE_ID FIRST_NAME      LAST_NAME           SALARY
----------- --------------- --------------- ----------
        100 Steven          King                 24000
        101 Neena           Yang                 17000
        102 Lex             Garcia               17000
```

---

## 🔢 2. Arithmetic Operators

### Core Concepts
SQL allows you to execute basic mathematical operations on numeric data right inside your projection clause. 
* **Supported Operators:** Addition (`+`), Subtraction (`-`), Multiplication (`*`), and Division (`/`).
* **Operator Precedence:** Follows default mathematical rules. Multiplication and division are prioritized over addition and subtraction. Use parentheses `()` to enforce custom calculation order.

### Example Queries & Outputs

#### Query A: Computing an Annual Salary Field
```sql
SELECT last_name, salary, salary * 12 
FROM employees;
```

#### Output A:
```text
LAST_NAME           SALARY  SALARY*12
--------------- ---------- ----------
King                 24000     288000
Yang                 17000     204000
Garcia               17000     204000
```

#### Query B: Understanding Precedence Differences
```sql
SELECT last_name, salary + 100 * 12, (salary + 100) * 12 
FROM employees;
```

#### Output B:
```text
LAST_NAME       SALARY+100*12 (SALARY+100)*12
--------------- ------------- ---------------
King                    25200          289200
Yang                    18200          205200
```

---

## 🏷️ 3. Column Aliases

### Core Concepts
A column alias renames a query heading temporarily within your active output buffer, ensuring mathematical calculations or combined expressions show up with descriptive labels.
* **Default Behavior:** If typed without quotes (using an optional `AS` keyword), Oracle capitalizes the label entirely.
* **Double-Quoted Aliases (`""`):** Required if your header contains specific spacing, special characters, or requires exact case sensitivity preserved.

### Example Queries & Outputs

#### Query A: Standard Upper-case Alias
```sql
SELECT last_name, salary * 12 AS annual_salary 
FROM employees;
```

#### Output A:
```text
LAST_NAME       ANNUAL_SALARY
--------------- -------------
King                   288000
Yang                   204000
```

#### Query B: Quoted Spaced Alias
```sql
SELECT last_name, salary * 12 AS "Annual Take-home Pay" 
FROM employees;
```

#### Output B:
```text
LAST_NAME       Annual Take-home Pay
--------------- --------------------
King                          288000
Yang                          204000
```

---

## 🚫 4. Null Values

### Core Concepts
A `NULL` value indicates that data is absent, unassigned, missing, or unknown. 
* **Important:** `NULL` is completely different from a mathematical zero (`0`) or an empty blank space string text character.
* **The Null Math Trap:** Any math operation combined with a `NULL` component automatically returns a blank `NULL` value. For instance, running additions with an unpopulated `commission_pct` field wipes out the entire math product string unless processed with handling tools.

### Example Queries & Outputs

#### Query A: Observing Raw Null Values
```sql
SELECT employee_id, last_name, commission_pct 
FROM employees;
```

#### Output A:
```text
EMPLOYEE_ID LAST_NAME       COMMISSION_PCT
----------- --------------- --------------
        100 King                          
        101 Yang                          
        145 Singh                     0.4
```

#### Query B: Observing the Null Calculation Effect
```sql
SELECT last_name, salary * commission_pct 
FROM employees;
```

#### Output B:
```text
LAST_NAME       SALARY*COMMISSION_PCT
--------------- ---------------------
King                                 
Yang                                 
Singh                            5600
```

---

## 🛠️ Assignment Queries Checklist

Run these commands in your active prompt session to complete the assignments from your coursework using your data variables without edits:

### Assignment 1: Determine the Structure of DEPT Table and its Contents
```sql
DESC departments;
SELECT * FROM departments;
```

### Assignment 2: Determine the Structure of EMP Table and its Contents
```sql
DESC employees;
SELECT * FROM employees;
```

### Assignment 3: Display the Ename and Deptno from Emp table whose Empno is 100
```sql
SELECT first_name, last_name, department_id 
FROM employees 
WHERE employee_id = 100;
```