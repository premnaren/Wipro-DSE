# SQL Fundamentals — Module 1: Aggregate Functions

Column aliasing with `AS`, and the core aggregate functions `COUNT()`, `MAX()`, `MIN()`, and `ROUND()` — worked against an `employee` table.

---

## Query 01 — Column Alias Using `AS`

**Question:** Display the following columns from the `employee` table with new names: `employee_id` → **Serial**, `employee_name` → **Name**, `department` → **Dept**.

```sql
SELECT employee_id AS 'Serial',
       employee_name AS 'Name',
       department AS 'Dept'
FROM employee;
```

**Output:**

| Serial | Name | Dept |
|:------:|:-----|:-----|
| 1 | Kayla Thompson | Sales |
| 2 | Ethan Chen | Operations |
| 3 | Julia Lee | HR |
| 4 | Marcus Garcia | Product |
| 5 | Samantha Park | Operations |

> **5 rows returned**

---

## Query 02 — `COUNT()`

**Question:** Count the number of rows in the `EMPLOYEE` table and rename the column as **Count**.

```sql
SELECT COUNT(*) AS Count
FROM EMPLOYEE;
```

**Output:**

| Count |
|:-----:|
| 5 |

> **1 row returned**

---

## Query 03 — `MAX()` and `MIN()`

**Question:** Find the highest and lowest `Hourly_pay`.

```sql
SELECT MAX(Hourly_pay) AS max_pay FROM employee;

SELECT MIN(Hourly_pay) AS min_pay FROM employee;
```

**Output:**

| max_pay |
|:-------:|
| 55 |

| min_pay |
|:-------:|
| 28 |

---

## Query 04 — `ROUND()`

**Question:** Round the `Taxable_Pay` column to **2 decimal places**.

```sql
SELECT ROUND(Taxable_Pay,2) AS taxable_pay
FROM employee;
```

**Output:**

| taxable_pay |
|:-----------:|
| 21.34 |
| 19.45 |
| 40.82 |
| 33.29 |
| 19.00 |

> **5 rows returned**

---

## Query 05 — Practice: `COUNT()`, `MAX()` and `MIN()`

**Question:** Given the employee table, write three queries — count employees in **Sales**, maximum hourly pay in **Operations**, minimum hourly pay in **Operations**.

```sql
SELECT COUNT(*) AS count_sales
FROM employee
WHERE Department='Sales';

SELECT MAX(Hourly_Pay) AS ops_max_pay
FROM employee
WHERE Department='Operations';

SELECT MIN(Hourly_Pay) AS ops_min_pay
FROM employee
WHERE Department='Operations';
```

**Output:**

| count_sales |
|:------------:|
| 2 |

| ops_max_pay |
|:-----------:|
| 43 |

| ops_min_pay |
|:-----------:|
| 26 |

---

## Query 06 — Practice: `ROUND()`

**Question:** Round the `Payout` column to two decimal places.

```sql
SELECT ROUND(Payout,2) AS payout
FROM employee;
```

**Output:**

| payout |
|:------:|
| 22.66 |
| 6.55 |
| 25.18 |
| 0.71 |
| 24.00 |
| 5.48 |
| 18.56 |
| 13.65 |
| 18.73 |
| 19.82 |

> **10 rows returned**

---

## Query 07 — Debug This Query

**Question:** Find the minimum and maximum payout rounded to two decimal places.

```sql
SELECT ROUND(MIN(Payout),2) AS min_pay,
       ROUND(MAX(Payout),2) AS max_pay
FROM employee;
```

**Output:**

| min_pay | max_pay |
|:-------:|:-------:|
| 123.54 | 789.43 |

> **1 row returned**

---

*SQL Fundamentals · Module 1 · 7 queries*