# 📘 Oracle SQL Study Guide: Data Customization & Aggregation
 
A structured reference covering single-row functions, multi-row aggregation, conditional pivoting, and set operators — with syntax, descriptions, and runnable examples for each.
 
---
 
## Table of Contents
 
1. [Module 1: Single-Row Scalar Functions](#module-1-single-row-scalar-functions)
2. [Module 2: Multi-Row Group Aggregation Functions](#module-2-multi-row-group-aggregation-functions)
3. [Module 3: Advanced Matrix Pivoting & Conditional Logic](#module-3-advanced-matrix-pivoting--conditional-logic)
4. [Module 4: Relational Set Operators](#module-4-relational-set-operators)
---
 
## Module 1: Single-Row Scalar Functions
 
Single-row functions operate on individual table records, executing a localized transform sequence to yield exactly **one output value per row**.
 
### 1.1 Character Transformations
 
Used to manipulate string case, measure character structures, slice text tokens, or enforce padding masks.
 
| Function | Syntax | Description |
|---|---|---|
| `UPPER(str)` / `LOWER(str)` / `INITCAP(str)` | `FUNCTION_NAME(string_expression)` | Adjusts case to all caps, all lowercase, or Title Case. |
| `LENGTH(str)` | `LENGTH(string_expression)` | Computes total character count, including empty padding spaces. |
| `SUBSTR(str, position, [length])` | `SUBSTR(string, start_index [, character_run_count])` | Slices out a localized token window from a parent string. |
| `LPAD(str, len, pad)` / `RPAD(str, len, pad)` | `LPAD(expression, target_width, 'pad_character')` | Pads the left or right side until a target width is met. Truncates input if it exceeds the target width. |
| `CONCAT(str1, str2)` | `CONCAT(string1, string2)` | Merges two text values (functionally identical to `\|\|`). |
 
```sql
-- Character Function Examples
SELECT INITCAP(last_name) AS "Name", LENGTH(last_name) AS "Len" FROM hr.employees;
SELECT LPAD(TO_CHAR(salary), 15, '$') AS "SALARY" FROM hr.employees;
SELECT RPAD(SUBSTR(last_name, 1, 8), 8, ' ') || ' ' || '*' AS "Masked_Name" FROM hr.employees;
```
 
### 1.2 Numeric Calculations
 
Mathematical single-row functions operating on integer or float inputs.
 
| Function | Syntax | Description |
|---|---|---|
| `ROUND(num, [places])` | `ROUND(numeric_value, precision_threshold)` | Rounds a value to the nearest specified precision. |
| `MOD(dividend, divisor)` | `MOD(value, divisor)` | Performs division and returns the remainder. |
| `CEIL(num)` / `FLOOR(num)` | `CEIL(value)` / `FLOOR(value)` | Rounds up to the next highest integer, or down to the next lowest integer. |
 
```sql
-- Numeric Function Examples
SELECT ROUND(salary * 1.155) AS "New Salary" FROM hr.employees;
SELECT CEIL(MONTHS_BETWEEN(SYSDATE, hire_date)) AS MONTHS_WORKED FROM hr.employees;
```
 
### 1.3 Chronological Date Functions
 
Used to process date-time values. Oracle tracks dates down to the second internally.
 
| Function | Syntax | Description |
|---|---|---|
| `SYSDATE` / `CURRENT_DATE` | `SYSDATE` (no parentheses — it's a context variable) | Returns the current system date/time of the database host. |
| `MONTHS_BETWEEN(date1, date2)` | `MONTHS_BETWEEN(later_date, earlier_date)` | Returns the fractional number of months between two dates. |
| `NEXT_DAY(date, 'DAY')` | `NEXT_DAY(target_date, 'DAY_NAME')` | Returns the next calendar date matching the named weekday. |
 
```sql
-- Date Function Examples
SELECT SYSDATE FROM dual;
SELECT TO_CHAR(NEXT_DAY(ADD_MONTHS(hire_date, 6), 'MONDAY'), 'Dlsp') AS "REVIEW" FROM hr.employees;
```
 
### 1.4 Explicit Datatype Conversions
 
Prevents parsing exceptions by explicitly recasting values across datatype boundaries.
 
| Function | Syntax | Description |
|---|---|---|
| `TO_CHAR(val, [mask])` | `TO_CHAR(date_or_number, 'format_mask_pattern')` | Converts dates or numbers into formatted strings (e.g. `'YYYY'`, `'Month'`, `'$99,999.00'`). |
| `TO_DATE(str, mask)` | `TO_DATE(string_literal, 'format_mask_pattern')` | Parses a string into an internal Oracle date object. |
 
```sql
-- Conversion Function Examples
SELECT TO_CHAR(salary, '$99,999.00') AS "Formatted_Sal" FROM hr.employees;
SELECT TO_CHAR(hire_date, 'DAY') AS "Start_Day" FROM hr.employees;
```
 
---
 
## Module 2: Multi-Row Group Aggregation Functions
 
Group functions compile collections of records down into a single summary output.
 
### 2.1 Core Group Aggregates
 
| Function | Description |
|---|---|
| `MAX(col)` / `MIN(col)` | Returns the highest or lowest value in a dataset. Works on numbers, strings, and dates. |
| `SUM(col)` / `AVG(col)` | Returns the total sum or average of numeric values. |
| `COUNT(col \| *)` | `COUNT(*)` counts every row including nulls; `COUNT(column)` only counts non-null entries. |
 
### 2.2 Data Segmentation: `GROUP BY` and `HAVING`
 
- **`GROUP BY`** — Splits records into sub-groups based on shared column values. Every non-aggregated column in the `SELECT` list **must** appear in the `GROUP BY` clause.
- **`HAVING`** — Filters *after* groups are built. Group functions (`MIN`, `MAX`, etc.) cannot be used in a `WHERE` clause — they must go in `HAVING`.
```sql
-- Group Aggregation and Filtering Examples
SELECT job_id, MAX(salary) AS "Max", MIN(salary) AS "Min"
FROM hr.employees
GROUP BY job_id;
 
SELECT manager_id, MIN(salary)
FROM hr.employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id
HAVING MIN(salary) > 2000
ORDER BY MIN(salary) DESC;
```
 
---
 
## Module 3: Advanced Matrix Pivoting & Conditional Logic
 
### 3.1 Matrix Cross-Tabulation (Pivoting)
 
To turn row-based data into a columnar matrix, combine an aggregate function (`SUM`, `MAX`) with a conditional switch (`DECODE` or `CASE`). This selectively captures values matching specific criteria while treating everything else as `NULL`.
 
```sql
-- Matrix / Cross-Tabulation Pivot Example
SELECT job_id AS "Job",
       SUM(DECODE(department_id, 10, salary, NULL)) AS "Dept 10 Sal",
       SUM(DECODE(department_id, 20, salary, NULL)) AS "Dept 20 Sal",
       SUM(salary) AS "Total Salary"
FROM hr.employees
GROUP BY job_id;
```
 
### 3.2 Conditional Value Mapping: `DECODE` vs `CASE`
 
| Construct | Description |
|---|---|
| `DECODE` | Oracle-native, position-based value mapper. |
| `CASE` | ANSI SQL-compliant conditional block; supports range comparisons via `WHEN` / `THEN`. |
 
```sql
-- DECODE approach
SELECT last_name, DECODE(SUBSTR(job_id, 4), 'PRES', 'A', 'MGR', 'B', 'X') AS "Grade" FROM hr.employees;
 
-- CASE approach
SELECT last_name,
       CASE
         WHEN job_id LIKE '%PRES%' THEN 'A'
         WHEN job_id LIKE '%MGR%' THEN 'B'
         ELSE 'X'
       END AS "Grade"
FROM hr.employees;
```
 
---
 
## Module 4: Relational Set Operators
 
Set operators combine the results of two or more independent `SELECT` statements into a single output.
 
> ⚠️ **Structural Rules**
> - Every query in the chain must select the **same number of columns**.
> - Corresponding positional columns must have **compatible datatypes**.
> - Final column headings are taken from the **first** `SELECT` statement in the chain.
 
| Operator | Behavior |
|---|---|
| `UNION` | Combines rows from both queries, removes duplicates, and sorts the output. |
| `UNION ALL` | Combines rows from both queries, keeping duplicates. Faster — skips sort/dedup. |
| `INTERSECT` | Returns only rows common to both queries. |
| `MINUS` | Returns rows from the first query that do **not** appear in the second. |
 
```sql
-- Set Operator Integration Example
SELECT TO_CHAR(department_id) AS "Grouping_Criteria", SUM(salary) AS "SUM_SAL"
FROM hr.employees
GROUP BY department_id
UNION ALL
SELECT job_id, SUM(salary)
FROM hr.employees
GROUP BY job_id;
```
 