# SQL Fundamentals — Sub-Module 1: Introduction to Queries

Core `SELECT` syntax — column selection, `DISTINCT`, `WHERE` filtering, `BETWEEN` ranges, and compound conditions — worked against a single reference table.

---

## Reference Table — `Flights`

| Passenger_id | Passenger_name | Gender | Origin   | Destination |
|:------------:|:---------------|:------:|:---------|:------------|
| 10001 | Jackson | Male   | Mumbai   | New York |
| 10002 | Riya    | Female | Mumbai   | Delhi |
| 10003 | Roy     | Male   | London   | Daelhi |
| 10004 | Anthony | Male   | Mumbai   | Cairo |
| 10005 | Salim   | Male   | Ohio     | New York |
| 10006 | Dia     | Female | New York | Cairo |
| 10007 | Jackson | Male   | New York | London |
| 10008 | Dia     | Female | Beijing  | Mumbai |
| 10009 | Riya    | Female | Damascus | Mumbai |
| 10010 | Betty   | Female | Beijing  | Cairo |

---

## Query 01 — Display All Records

**Question:** Display all records from the `Flights` table.

```sql
SELECT * FROM Flights;
```

**Output:** Returns all columns for all 10 rows.

> **10 rows returned**

---

## Query 02 — Select Specific Columns

**Question:** Display only the `Passenger_name` and `Gender` columns.

```sql
SELECT Passenger_name, Gender
FROM Flights;
```

**Output:**

| Passenger_name | Gender |
|:----------------|:-------|
| Jackson | Male |
| Riya    | Female |
| Roy     | Male |
| Anthony | Male |
| Salim   | Male |
| Dia     | Female |
| Jackson | Male |
| Dia     | Female |
| Riya    | Female |
| Betty   | Female |

> **10 rows returned**

---

## Query 03 — `DISTINCT` Clause

**Question:** Display all unique origin locations.

```sql
SELECT DISTINCT Origin
FROM Flights;
```

**Output:**

| Origin |
|:-------|
| Mumbai |
| London |
| Ohio |
| New York |
| Beijing |
| Damascus |

> **6 rows returned**

---

## Query 04 — `WHERE` Clause

**Question:** Display all passengers whose Origin is Mumbai.

```sql
SELECT *
FROM Flights
WHERE Origin='Mumbai';
```

**Output:**

| Passenger_id | Passenger_name | Gender | Origin | Destination |
|:------------:|:----------------|:------:|:-------|:------------|
| 10001 | Jackson | Male   | Mumbai | New York |
| 10002 | Riya    | Female | Mumbai | Delhi |
| 10004 | Anthony | Male   | Mumbai | Cairo |

> **3 rows returned**

---

## Query 05 — `BETWEEN` Clause

**Question:** Display passengers whose names fall alphabetically between 'A' and 'D'.

```sql
SELECT *
FROM Flights
WHERE Passenger_name BETWEEN 'A' AND 'D';
```

**Output:**

| Passenger_id | Passenger_name | Gender | Origin  | Destination |
|:------------:|:----------------|:------:|:--------|:------------|
| 10004 | Anthony | Male   | Mumbai  | Cairo |
| 10010 | Betty   | Female | Beijing | Cairo |

> **2 rows returned**

---

## Query 06 — Practice: Basic `WHERE` Query

**Question:** Display the `Passenger_name` and `Gender` where Origin is New York.

```sql
SELECT Passenger_name, Gender
FROM Flights
WHERE Origin='New York';
```

**Output:**

| Passenger_name | Gender |
|:----------------|:-------|
| Dia     | Female |
| Jackson | Male |

> **2 rows returned**

---

## Query 07 — Practice: Debug This Query

**Question:** Display distinct male passenger names whose origin is Mumbai.

```sql
SELECT DISTINCT Passenger_name
FROM Flights
WHERE Gender='Male'
AND Origin='Mumbai';
```

**Output:**

| Passenger_name |
|:----------------|
| Jackson |
| Anthony |

> **2 rows returned**

---

*SQL Fundamentals · Module 1 · 7 queries*