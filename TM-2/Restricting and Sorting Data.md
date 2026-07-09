# 📖 Module 3: Restricting and Sorting Data

This study guide outlines the principles of row filtering (`WHERE`), result sorting (`ORDER BY`), evaluation operators, and runtime runtime variables (`&`). It contains matching query syntax variations structured specifically for your active schema configuration.

---

## 📝 Core Concepts Cheat-Sheet

### 1. Row Selection (`WHERE` Clause)
The `WHERE` clause restricts returned rows based on logical conditions. It must immediately follow the `FROM` clause.
* **String Values:** Character text literals are strictly case-sensitive and must be enclosed within single quotes (e.g., `'CLERK'`, `'SCOTT'`).
* **Comparison Operators:** Supports standard evaluations: `=`, `>`, `<`, `>=`, `<=`, and `<>` (Not Equal).

### 2. Specialized SQL Operators
* **`BETWEEN ... AND ...`:** Filters values within an inclusive lower and upper boundary.
* **`IN (v1, v2, ...)`:** Matches a column value against a discrete list of explicit criteria.
* **`LIKE`:** Performs wildcard pattern matching searches:
  * `%` matches zero or more characters.
  * `_` matches exactly one character position.
* **`IS NULL` / `IS NOT NULL`:** The only valid semantic option used to check for the presence or absence of unassigned `NULL` database variables.

### 3. Result Set Ordering (`ORDER BY`)
The `ORDER BY` clause sorts your query output in either Ascending (`ASC`, default) or Descending (`DESC`) order.
* **Position Sorters:** Instead of naming explicit column headers, you can provide the numeric column sequence index position as it appears within your projection array (e.g., `ORDER BY 2 DESC`).

### 4. Runtime Substitution Prompts (`&`)
Prefixing a word with an ampersand (`&`) instructs Oracle SQL*Plus to temporarily halt execution and prompt the user to input a dynamic value at runtime.
* **Text/Date Prompting:** If the user input is intended for character string fields or dates, wrap the substitution parameter inside single quotes: `'&user_input'`.

---

## 🛠️ Hands-on Assignment Solutions

These queries are optimized directly for the columns present within your data environment:

### Assignment 1: Sort by Commission and Salary using Position Indexes
```sql
SELECT last_name, salary, commission_pct 
FROM employees 
WHERE commission_pct IS NOT NULL 
ORDER BY 2 DESC, 3 DESC;
```

### Assignment 2: Display All Unique Job Codes
```sql
SELECT DISTINCT job_id 
FROM employees;
```

### Assignment 3: Descriptive Column Headings via Quoted Aliases
```sql
SELECT employee_id AS "Emp #", last_name AS "Employee", job_id AS "Job", hire_date AS "Hire Date" 
FROM employees;
```

### Assignment 4: Concatenation Operator (`||`) Header Customization
```sql
SELECT last_name || ', ' || job_id AS "Employee and Title" 
FROM employees;
```

### Assignment 5: Comma-Separated Output Aggregation
```sql
SELECT employee_id || ',' || job_id || ',' || hire_date || ',' || manager_id AS THE_OUTPUT 
FROM employees;
```

### Assignment 6: Multi-Value String Match Sorted by Date
```sql
SELECT first_name, job_id, hire_date 
FROM employees 
WHERE last_name IN ('SCOTT', 'TURNER') 
ORDER BY hire_date ASC;
```

### Assignment 7: Department ID Multi-Check Sorted Alphabetically
```sql
SELECT last_name, department_id 
FROM employees 
WHERE department_id IN (20, 30) 
ORDER BY last_name ASC;
```

### Assignment 8: Range and Department Filtering with Custom Aliases
```sql
SELECT last_name AS "Employee", salary AS "Monthly Salary" 
FROM employees 
WHERE salary BETWEEN 2000 AND 3000 
AND department_id IN (20, 30);
```

### Assignment 9: Date Pattern Match for Specific Year Block
```sql
SELECT last_name, hire_date 
FROM employees 
WHERE hire_date LIKE '%81' OR hire_date LIKE '%1981%';
```

### Assignment 10: Dynamic Prompt for Custom Salary Boundary
```sql
SELECT last_name, salary 
FROM employees 
WHERE salary > &user_sal_amount;
```

### Assignment 11: Report of All Employees Lacking a Manager
```sql
SELECT last_name, job_id 
FROM employees 
WHERE manager_id IS NULL;
```

### Assignment 12: Dynamic Prompt for Manager Filtering with Column Sort Feature
```sql
SELECT employee_id, last_name, salary, department_id 
FROM employees 
WHERE manager_id = &prompt_mgr_id 
ORDER BY &prompt_sort_column;
```

### Assignment 13: Report Filtered by Manager Prompt with Dynamic Sort Feature
```sql
SELECT employee_id, last_name, salary, department_id 
FROM employees 
WHERE manager_id = &prompt_mgr 
ORDER BY &prompt_sort_col;
```

### Assignment 14: Pattern Match Searching for Third Letter 'A'
```sql
SELECT last_name 
FROM employees 
WHERE last_name LIKE '__A%';
```

### Assignment 15: Compound Wildcard Search Containing Both 'A' and 'S'
```sql
SELECT last_name 
FROM employees 
WHERE last_name LIKE '%A%' 
AND last_name LIKE '%S%';
```

### Assignment 16: Compound Condition Checking for Role and Specific Salary Array
```sql
SELECT last_name, job_id, salary 
FROM employees 
WHERE job_id LIKE '%CLERK%' 
AND salary IN (800, 950, 1300);