# SQL Fundamentals — Module 2 Notes: WHERE Conditional Statements

## Topics Covered

`AND` Operator · `OR` Operator · `LIKE` Operator · Wildcards (`%` and `_`) · Combining Conditions

---

## 1. AND Operator

Returns rows only if **all conditions** are true.

```sql
SELECT *
FROM Flights
WHERE Gender='Female'
AND Destination='Cairo';
```

---

## 2. OR Operator

Returns rows if **at least one** condition is true.

```sql
SELECT *
FROM Flights
WHERE Origin='Mumbai'
OR Destination='Mumbai';
```

---

## 3. LIKE Operator

Used for pattern matching.

### `%` Wildcard

Represents **zero or more characters**.

**Starts with M:**

```sql
WHERE Origin LIKE 'M%';
```

**Ends with a:**

```sql
WHERE Passenger_name LIKE '%a';
```

**Contains 'ork':**

```sql
WHERE Origin LIKE '%ork%';
```

### `_` Wildcard

Represents **exactly one character**.

```sql
WHERE Passenger_id LIKE '1000_';
```

---

## Combining LIKE with AND

```sql
SELECT *
FROM Flights
WHERE Destination LIKE '%o'
AND Origin LIKE 'M%';
```

---

## SQL Keywords Learned

`WHERE` · `AND` · `OR` · `LIKE` · `%` · `_`

---

## Key Takeaways

- `AND` requires every condition to be true.
- `OR` requires at least one condition to be true.
- `LIKE` performs pattern matching.
- `%` matches any number of characters.
- `_` matches a single character.
- Complex filters can combine `LIKE`, `AND`, and `OR`.