# 📒 Module 3 Notes -- Aggregate Functions

## Aggregate Functions

Aggregate functions perform calculations on multiple rows and return a
**single result**.

Common aggregate functions: - COUNT() - MAX() - MIN() - SUM() - AVG() -
ROUND()

------------------------------------------------------------------------

# AS (Alias)

Rename a column in the output.

``` sql
SELECT employee_name AS Name
FROM employee;
```

Aliases only affect the displayed result.

------------------------------------------------------------------------

# COUNT()

Counts rows.

``` sql
SELECT COUNT(*) FROM employee;
```

Count non-null values in a column:

``` sql
SELECT COUNT(email)
FROM employee;
```

-   `COUNT(*)` counts every row.
-   `COUNT(column)` ignores NULL values.

------------------------------------------------------------------------

# MAX()

Returns the largest value.

``` sql
SELECT MAX(Hourly_pay)
FROM employee;
```

------------------------------------------------------------------------

# MIN()

Returns the smallest value.

``` sql
SELECT MIN(Hourly_pay)
FROM employee;
```

------------------------------------------------------------------------

# ROUND()

Rounds numeric values.

``` sql
SELECT ROUND(Payout,2)
FROM employee;
```

Examples: - `ROUND(12.3456,2)` → **12.35** - `ROUND(18.999,1)` →
**19.0**

------------------------------------------------------------------------

# Combining Aggregate Functions with WHERE

``` sql
SELECT MAX(Hourly_pay)
FROM employee
WHERE Department='Operations';
```

------------------------------------------------------------------------

# SQL Keywords Learned

-   AS
-   COUNT()
-   MAX()
-   MIN()
-   ROUND()
-   WHERE

------------------------------------------------------------------------

# Best Practices

-   Always use aliases for aggregate results.
-   Filter with `WHERE` before applying aggregate functions.
-   Use `COUNT(*)` when you need the total row count.
-   Use `ROUND()` for financial values.

------------------------------------------------------------------------

# Quick Cheat Sheet

``` sql
SELECT COUNT(*) FROM table;

SELECT MAX(column) FROM table;

SELECT MIN(column) FROM table;

SELECT ROUND(column,2) FROM table;

SELECT column AS alias FROM table;
```
