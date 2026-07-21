# 📘 Module 4: SUM, AVG, GROUP BY & HAVING

This document contains the complete solutions for **Module 4 --
Aggregate Functions (Advanced)**.

------------------------------------------------------------------------

# 1. SUM()

## ❓ Question

Find the sum of the `Payout` column from the `EMPLOYEE` table and rename
the result as **total_payout**.

``` sql
SELECT SUM(Payout) AS total_payout
FROM EMPLOYEE;
```

### 📤 Output

    total_payout
  --------------
         155.339

------------------------------------------------------------------------

# 2. AVG()

## ❓ Question

Find the average value of the `Payout` column and rename it as
**avg_payout**.

``` sql
SELECT AVG(Payout) AS avg_payout
FROM employee;
```

### 📤 Output

    avg_payout
  ------------
       15.5339

------------------------------------------------------------------------

# 3. Practice -- SUM() and AVG()

Calculate: - Total payout for the **Product** department. - Average
payout for the **Operations** department.

``` sql
SELECT SUM(Payout) AS product_total_pay
FROM Employee
WHERE Department='Product';

SELECT AVG(Payout) AS ops_avg_pay
FROM Employee
WHERE Department='Operations';
```

### 📤 Output

    product_total_pay
  -------------------
               20.528

    ops_avg_pay
  -------------
       12.41975

------------------------------------------------------------------------

# 4. GROUP BY

Calculate the average payout for each department.

``` sql
SELECT Department,
       AVG(Payout) AS avg_payout
FROM employee
GROUP BY Department;
```

### 📤 Output

  Department     avg_payout
  ------------ ------------
  HR                 21.957
  Operations       12.41975
  Product            10.264
  Sales              20.609

------------------------------------------------------------------------

# 5. HAVING

Display departments having **more than 3 employees** and show their
average payout.

``` sql
SELECT Department,
       AVG(Payout) AS avg_payout
FROM employee
GROUP BY Department
HAVING COUNT(*) > 3;
```

### 📤 Output

  Department     avg_payout
  ------------ ------------
  Operations         11.227
  Sales            20.34625

------------------------------------------------------------------------

# 6. Practice -- GROUP BY & HAVING

Display: - Department - Average payout Only for departments where the
total payout is greater than **40**. Sort the output by department.

``` sql
SELECT Department,
       AVG(Payout) AS avg_payout
FROM employee
GROUP BY Department
HAVING SUM(Payout) > 40
ORDER BY Department;
```

### 📤 Output

  Department           avg_payout
  ------------ ------------------
  HR             23.9886666666667
  Operations               11.227
  Sales                  20.34625

------------------------------------------------------------------------

# 7. Debug this Query

Find the average age of employees department-wise, only for departments
having more than three employees.

``` sql
SELECT Department,
       AVG(Age) AS avg_age
FROM employee
GROUP BY Department
HAVING COUNT(Department) > 3;
```

### 📤 Output

  Department     avg_age
  ------------ ---------
  Operations        23.0
  Sales             20.5
