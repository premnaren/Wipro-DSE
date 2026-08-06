# Subqueries Guide: TM-3 Module 1 (Advanced SQL)

A comprehensive reference guide on subquery patterns, types, and execution semantics in SQL (Oracle DB / Standard ANSI SQL).

---

## Overview of Subquery Architecture

A **subquery** (also known as a nested query or inner query) is an `SELECT` statement embedded inside another SQL statement (`SELECT`, `INSERT`, `UPDATE`, `DELETE`, or within another subquery). Subqueries evaluate first or iteratively depending on their structure and supply operational data to the outer main query.

---

## 1. Single-Row Subqueries

### Concept & Mechanics
A Single-Row Subquery returns **exactly one row and one column** (a single scalar value) to the outer query. If the inner query returns no rows, the subquery evaluates to `NULL`. If it returns more than one row, Oracle returns an error (`ORA-01427: single-row subquery returns more than one row`).

### Comparison Operators
Single-row subqueries require single-value comparison operators:
- `=` (Equal to)
- `>` (Greater than)
- `>=` (Greater than or equal to)
- `<` (Less than)
- `<=` (Less than or equal to)
- `<>` or `!=` (Not equal to)

### Core Code Example
```sql
-- Find employees who earn more than the overall average salary
SELECT empno, ename, sal
FROM emp
WHERE sal > (
    SELECT AVG(sal)
    FROM emp
);
```

---

## 2. Multi-Row Subqueries

### Concept & Mechanics
A Multi-Row Subquery returns **multiple rows** (a list or column vector) to the outer main query. Because the inner query produces a set of values rather than a scalar, single-value operators cannot be used.

### Multi-Row Operators
| Operator | Functionality / Meaning |
| :--- | :--- |
| `IN` | Equal to any value returned by the subquery list. |
| `NOT IN` | Not equal to any value in the list (*Warning: If subquery contains `NULL`, result is empty*). |
| `ALL` | Compares a value to **every** value in the list. E.g., `< ALL(...)` means less than the minimum. |
| `ANY` / `SOME` | Compares a value to **at least one** value in the list. E.g., `< ANY(...)` means less than the maximum. |

### Core Code Examples
```sql
-- Find employees who earn less than the least salary in Department 10
SELECT ename, sal, deptno
FROM emp
WHERE sal < ALL (
    SELECT sal
    FROM emp
    WHERE deptno = 10
);

-- Find employees working in departments containing employees with 'R' in their name
SELECT empno, ename, deptno
FROM emp
WHERE deptno IN (
    SELECT DISTINCT deptno
    FROM emp
    WHERE ename LIKE '%R%'
);
```

---

## 3. Correlated Subqueries

### Concept & Mechanics
Unlike independent subqueries (which execute once prior to outer query execution), a **Correlated Subquery** depends on values provided by the current row being processed by the outer query. 

* **Execution Flow:**
  1. Outer query fetches a candidate row.
  2. Outer column values are passed to the inner query.
  3. Inner query executes using those passed values.
  4. Outer query uses the result to evaluate the `WHERE` or `HAVING` predicate.
  5. Process repeats for every candidate row of the outer table.

### The `EXISTS` & `NOT EXISTS` Operators
`EXISTS` checks for the presence of rows returned by the correlated subquery. It stops evaluation as soon as a matching row is found (short-circuit evaluation), making it highly efficient.

### Core Code Examples
```sql
-- Find employees who earn less than the average salary of THEIR OWN department
SELECT e1.empno, e1.ename, e1.sal, e1.deptno
FROM emp e1
WHERE e1.sal < (
    SELECT AVG(e2.sal)
    FROM emp e2
    WHERE e2.deptno = e1.deptno
);

-- Display employees who are Managers (using EXISTS)
SELECT e.ename, e.job
FROM emp e
WHERE EXISTS (
    SELECT 1
    FROM emp m
    WHERE m.mgr = e.empno
);
```

---

## 4. Scalar Subqueries

### Concept & Mechanics
A **Scalar Subquery** is a subquery that selects only one column and returns a single value. It can be placed almost anywhere an expression is valid in SQL, including:
- `SELECT` projection lists
- `ORDER BY` expressions
- `CASE` statements

### Core Code Examples
```sql
-- Display department location and average salary for each department
SELECT d.loc,
       (SELECT AVG(e.sal)
        FROM emp e
        WHERE e.deptno = d.deptno) AS avg_salary
FROM dept d;

-- Conditional sorting: Sort only employees working in DALLAS
SELECT e.*
FROM emp e
ORDER BY CASE 
    WHEN e.deptno = (SELECT deptno FROM dept WHERE loc = 'DALLAS') THEN e.ename 
    ELSE NULL 
END ASC;
```

---

## 5. Inline Views (Derived Tables)

### Concept & Mechanics
An **Inline View** is a subquery located inside the `FROM` clause. It acts as a temporary, dynamically generated virtual table that exists only for the duration of the query execution.

### Core Uses
1. Pre-aggregating data before joining to other tables.
2. Performing complex row ranking and filtering (e.g., top-N queries using `ROWNUM` or `ROW_NUMBER()`).

### Core Code Example
```sql
-- Display employees earning less than their department average along with department average
SELECT e.ename, e.sal, e.deptno, d_avg.avg_sal
FROM emp e
JOIN (
    SELECT deptno, AVG(sal) AS avg_sal
    FROM emp
    GROUP BY deptno
) d_avg ON e.deptno = d_avg.deptno
WHERE e.sal < d_avg.avg_sal;
```

---

## 6. Common Table Expressions (WITH Clause)

### Concept & Mechanics
The `WITH` clause (also called Subquery Refactoring or CTE) allows you to define one or more named temporary result sets at the top of a query. These named queries can then be referenced multiple times within the primary query block.

### Advantages
- **Readability & Modularity:** Deconstructs complex queries into clean, logical blocks.
- **Optimization:** Oracle can materialize CTE result sets into temporary tables if referenced multiple times, improving execution performance.

### Core Code Example
```sql
-- Find locations of departments whose total salary sum is less than overall employee average salary
WITH dept_total AS (
    SELECT deptno, SUM(sal) AS total_sal
    FROM emp
    GROUP BY deptno
),
overall_avg AS (
    SELECT AVG(sal) AS avg_sal
    FROM emp
)
SELECT d.loc
FROM dept d
JOIN dept_total dt ON d.deptno = dt.deptno
CROSS JOIN overall_avg oa
WHERE dt.total_sal < oa.avg_sal;
```

---

## Subquery Decision Matrix

| Subquery Type | Target Location | Typical Return Value | Best Used For |
| :--- | :--- | :--- | :--- |
| **Single-Row** | `WHERE` / `HAVING` | 1 row, 1 column | Comparing against global aggregates (`MAX`, `AVG`). |
| **Multi-Row** | `WHERE` / `HAVING` | N rows, 1 column | Set membership checks (`IN`, `ALL`, `ANY`). |
| **Correlated** | `WHERE` / `HAVING` | Context-dependent | Row-by-row comparative analysis across categories. |
| **Scalar** | `SELECT` / `ORDER BY` | 1 row, 1 column | Adding computed metrics per row without altering grain. |
| **Inline View** | `FROM` | N rows, N columns | Joining pre-aggregated tables, pagination, top-N logic. |
| **WITH Clause** | Top of statement | Named dataset | Multi-step reporting, modular subquery reuse. |
