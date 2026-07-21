# SQL Fundamentals — Module 1 Notes: Introduction to SQL Queries

## Overview

Module 1 introduces the fundamentals of retrieving data from a database using SQL.

---

## 1. SELECT Statement

Used to retrieve data from a table.

**Syntax**

```sql
SELECT column_name
FROM table_name;
```

**Retrieve every column:**

```sql
SELECT *
FROM Flights;
```

---

## 2. Selecting Specific Columns

Retrieve only the required columns instead of the whole table.

```sql
SELECT Passenger_name, Gender
FROM Flights;
```

**Advantages**
- Faster queries
- Less data transferred
- Easier to read

---

## 3. DISTINCT

Removes duplicate values.

```sql
SELECT DISTINCT Origin
FROM Flights;
```

**Example**

| Without DISTINCT | With DISTINCT |
|:------------------|:---------------|
| Mumbai | Mumbai |
| Mumbai | London |
| London | |

---

## 4. WHERE Clause

Filters rows based on a condition.

```sql
SELECT *
FROM Flights
WHERE Origin='Mumbai';
```

**Common operators**

| Operator | Meaning |
|:--------:|:--------|
| `=` | equal to |
| `!=` or `<>` | not equal to |
| `>` | greater than |
| `<` | less than |
| `>=` | greater than or equal to |
| `<=` | less than or equal to |

---

## 5. BETWEEN

Filters values within an inclusive range.

```sql
SELECT *
FROM Flights
WHERE Passenger_id BETWEEN 10001 AND 10005;
```

**Alphabetical example**

```sql
SELECT *
FROM Flights
WHERE Passenger_name BETWEEN 'A' AND 'D';
```

> `BETWEEN` includes both boundary values.

---

## 6. AND Operator

Combines multiple conditions — both must be true.

```sql
SELECT DISTINCT Passenger_name
FROM Flights
WHERE Gender='Male'
AND Origin='Mumbai';
```

---

## SQL Keywords Learned

`SELECT` · `FROM` · `DISTINCT` · `WHERE` · `BETWEEN` · `AND`

---

## SQL Syntax Rules

- SQL keywords are case-insensitive.
- Text values must be enclosed in single quotes.
- End statements with a semicolon.
- `*` means all columns.

---

## Key Takeaways

- Use `SELECT` to retrieve data.
- Use `*` for every column.
- Choose only required columns when possible.
- Use `DISTINCT` to remove duplicates.
- Use `WHERE` to filter rows.
- Use `BETWEEN` for inclusive ranges.
- Combine conditions with `AND`.