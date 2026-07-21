# SQL Fundamentals — Module 2: SUM, AVG, GROUP BY & HAVING

Aggregate functions across groups — `SUM()`, `AVG()`, `GROUP BY`, and `HAVING` — worked against an `employee` table.

---

## Query 01 — `SUM()`

**Question:** Find the sum of the `Payout` column from the `EMPLOYEE` table and rename the result as **total_payout**.

```sql
SELECT SUM(Payout) AS total_payout
FROM EMPLOYEE;
```

**Output:**

| total_payout |
|:------------:|
| 155.339 |

> **1 row returned**

---

## Query 02 — `AVG()`

**Question:** Find the average value of the `Payout` column and rename it as **avg_payout**.

```sql
SELECT AVG(Payout) AS avg_payout
FROM employee;
```

**Output:**

| avg_payout |
|:----------:|
| 15.5339 |

> **1 row returned**

---

## Query 03 — Practice: `SUM()` and `AVG()`

**Question:** Calculate the total payout for the **Product** department, and the average payout for the **Operations** department.

```sql
SELECT SUM(Payout) AS product_total_pay
FROM Employee
WHERE Department='Product';

SELECT AVG(Payout) AS ops_avg_pay
FROM Employee
WHERE Department='Operations';
```

**Output:**

| product_total_pay |
|:------------------:|
| 20.528 |

| ops_avg_pay |
|:-----------:|
| 12.41975 |

---

## Query 04 — `GROUP BY`

**Question:** Calculate the average payout for each department.

```sql
SELECT Department,
       AVG(Payout) AS avg_payout
FROM employee
GROUP BY Department;
```

**Output:**

| Department | avg_payout |
|:-----------|:----------:|
| HR | 21.957 |
| Operations | 12.41975 |
| Product | 10.264 |
| Sales | 20.609 |

> **4 rows returned**

---

## Query 05 — `HAVING`

**Question:** Display departments having **more than 3 employees** and show their average payout.

```sql
SELECT Department,
       AVG(Payout) AS avg_payout
FROM employee
GROUP BY Department
HAVING COUNT(*) > 3;
```

**Output:**

| Department | avg_payout |
|:-----------|:----------:|
| Operations | 11.227 |
| Sales | 20.34625 |

> **2 rows returned**

---

## Query 06 — Practice: `GROUP BY` & `HAVING`

**Question:** Display department and average payout, only for departments where the total payout is greater than **40**. Sort the output by department.

```sql
SELECT Department,
       AVG(Payout) AS avg_payout
FROM employee
GROUP BY Department
HAVING SUM(Payout) > 40
ORDER BY Department;
```

**Output:**

| Department | avg_payout |
|:-----------|:-----------------:|
| HR | 23.9886666666667 |
| Operations | 11.227 |
| Sales | 20.34625 |

> **3 rows returned**

---

## Query 07 — Debug This Query

**Question:** Find the average age of employees department-wise, only for departments having more than three employees.

```sql
SELECT Department,
       AVG(Age) AS avg_age
FROM employee
GROUP BY Department
HAVING COUNT(Department) > 3;
```

**Output:**

| Department | avg_age |
|:-----------|:-------:|
| Operations | 23.0 |
| Sales | 20.5 |

> **2 rows returned**

---

*SQL Fundamentals · Module 4 · 7 queries*