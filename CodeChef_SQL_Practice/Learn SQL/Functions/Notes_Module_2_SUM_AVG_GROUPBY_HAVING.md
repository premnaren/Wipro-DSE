# 📒 Module 4 Notes -- SUM, AVG, GROUP BY & HAVING

## Topics Covered

-   SUM()
-   AVG()
-   GROUP BY
-   HAVING
-   ORDER BY with GROUP BY
-   Aggregate filtering

------------------------------------------------------------------------

# SUM()

Returns the total of a numeric column.

``` sql
SELECT SUM(Payout)
FROM employee;
```

------------------------------------------------------------------------

# AVG()

Returns the arithmetic mean.

``` sql
SELECT AVG(Payout)
FROM employee;
```

------------------------------------------------------------------------

# GROUP BY

Groups rows having the same value before applying aggregate functions.

``` sql
SELECT Department,
       AVG(Payout)
FROM employee
GROUP BY Department;
```

Common aggregates: - COUNT() - SUM() - AVG() - MAX() - MIN()

------------------------------------------------------------------------

# HAVING

Filters **groups**, unlike `WHERE`, which filters individual rows.

``` sql
SELECT Department,
       AVG(Payout)
FROM employee
GROUP BY Department
HAVING COUNT(*) > 3;
```

------------------------------------------------------------------------

# WHERE vs HAVING

  -----------------------------------------------------------------------
  WHERE                             HAVING
  --------------------------------- -------------------------------------
  Filters rows                      Filters groups

  Before grouping                   After grouping

  Cannot use aggregate functions    Designed for aggregate conditions
  directly                          
  -----------------------------------------------------------------------

------------------------------------------------------------------------

# ORDER BY with GROUP BY

``` sql
SELECT Department,
       AVG(Payout)
FROM employee
GROUP BY Department
ORDER BY Department;
```

------------------------------------------------------------------------

# SQL Keywords Learned

-   SUM()
-   AVG()
-   GROUP BY
-   HAVING
-   ORDER BY

------------------------------------------------------------------------

# Best Practices

-   Use `WHERE` to filter rows before grouping.
-   Use `HAVING` to filter grouped results.
-   Always alias aggregate columns.
-   Group every non-aggregated selected column.

------------------------------------------------------------------------

# Cheat Sheet

``` sql
SELECT SUM(column) FROM table;

SELECT AVG(column) FROM table;

SELECT Department, AVG(column)
FROM table
GROUP BY Department;

SELECT Department, AVG(column)
FROM table
GROUP BY Department
HAVING COUNT(*) > 3;

SELECT Department, AVG(column)
FROM table
GROUP BY Department
ORDER BY Department;
```
