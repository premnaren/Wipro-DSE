## Pattern Matching with the `LIKE` Operator

### 1. The `LIKE` Operator vs. the `=` Operator
* **Exact Matching (`=`):** Filters rows by looking for a precise, identical match (e.g., `WHERE location = 'Seattle'` will *only* return rows where the value is exactly "Seattle").
* **Pattern Matching (`LIKE`):** Provides flexibility to query data when you only know a part of a string, allowing you to filter based on a specific prefix, suffix, or internal substring.

### 2. SQL Wildcards Cheat Sheet
Wildcards are special placeholder characters used alongside the `LIKE` operator to define a search pattern:

* **`%` (Percent Sign):** Represents **zero, one, or multiple** characters.
* **`_` (Underscore):** Represents **exactly one single** character.

### 3. Wildcard Behavior Examples
* **`'S%'`**: Finds any value that **starts with** 'S' (e.g., "San Francisco", "Seattle"). The `%` handles any sequence of characters following the 'S'.
* **`'%S'`**: Finds any value that **ends with** 'S' (e.g., "Los Angeles").
* **`'%S%'`**: Finds any value that **contains** 'S' anywhere in the string.

### 4. Verified Implementation Example
To extract specific department records where the location starts with the letter 'S':

## Usage of DISTINCT: Row De-duplication with the `DISTINCT` Operator

### 1. Core Purpose of `DISTINCT`
* **Eliminating Redundancy:** Used inside a `SELECT` statement to suppress duplicate values and filter down rows so that only unique records are displayed.
* **Sole Objective Focus:** Ideal for instances when de-duplication is the primary requirement, providing a clean, concise result set every time without aggregate overhead.

### 2. How `DISTINCT` Operates
* **Positioning:** It must be placed immediately following the `SELECT` keyword (e.g., `SELECT DISTINCT column_name`).
* **Multi-Column Behavior:** If applied to multiple columns, it evaluates the *combination* of all selected attributes across each row to determine uniqueness, rather than filtering each column independently.

### 3. Verified Implementation Example
To extract a unique inventory list of corporate entities from employment tracking logs:

## 📊 Aggregate Operations: Computational & Analytical Functions

### 1. The `AVG()` Function
* **Mathematical Mean:** An aggregate function that computes the arithmetic mean of a column containing numerical elements.
* **Null Value Exclusion:** It automatically ignores `NULL` fields during calculation instead of treating them as zero, ensuring the mathematical average remains accurate based on existing data points.
* **Column Aliasing:** Often paired with the `AS` keyword to rename the resulting aggregated column (e.g., `AVG(salary) AS avg_salary`) for clean, readable output tables.

### 2. The `COUNT()` Function
* **Row Enumeration:** Used to count the number of rows that match a specified criterion in a query.
* **`COUNT(*)` vs. `COUNT(column_name)`:** * `COUNT(*)` counts every row in the result set, including rows containing `NULL` values or duplicates.
  * `COUNT(column_name)` only counts rows where the specified column contains a non-null value.

---

## 📭 Missing Data: Evaluation with `IS NULL`

### 1. The Nature of `NULL`
* **Absence of Data:** In SQL, `NULL` represents missing, unknown, or unassigned data. It is not equivalent to an empty string `''` or a numerical value of `0`.
* **The Equality Failure:** Standard comparison operators like `=` or `!=` cannot evaluate `NULL` entries because `NULL` cannot be compared to any value.

### 2. The `IS NULL` Operator
* **Specialized Filtering:** Used explicitly within a `WHERE` clause to catch uninitialized records (e.g., `WHERE rating IS NULL`). 
* **Inverse Matching (`IS NOT NULL`):** Can be inverted to filter out missing data and isolate rows where concrete information has been actively populated.

---

## 📑 Data Formatting: Sorting, Truncating, and Row Controls

### 1. The `ORDER BY` Clause
* **Sequential Arrangement:** Used to sort the result set in either ascending or descending order based on one or more columns.
* **Directional Modifiers:**
  * **`ASC` (Default):** Sorts data from lowest to highest (A-Z, 1-10, oldest to newest date).
  * **`DESC`:** Sorts data from highest to lowest (Z-A, 10-1, newest to oldest date).

### 2. The `LIMIT` Clause
* **Result Set Truncation:** Instructs the database engine to cap the final output, returning only a specified maximum number of rows starting from the top entry.
* **Top-N Queries:** Frequently paired with `ORDER BY ... DESC` to easily fetch top-performing elements, such as the "top 3 highest scores" or "last 5 matches played."

---

## 🔗 Relational Architecture: Data Aggregation & Cross-Table Mapping

### 1. The `GROUP BY` Clause
* **Categorical Clustering:** Collects rows sharing identical values across specified columns into unified aggregate buckets.
* **Aggregate Integration:** Essential when working with functions like `COUNT()`, `SUM()`, or `AVG()` over specific segments (e.g., counting employees per department) rather than calculating a single total for the entire table.

### 2. Relational Joining with `JOIN` and `ON`
* **Cross-Table Mapping:** An `INNER JOIN` matches and pairs records from two separate data tables by checking intersecting properties.
* **The `ON` Statement:** Defines the explicit relational criteria or conditional bridge mapping the attributes between both tables (e.g., matching a table's winning player name with a player database identifier: `ON m.winner = p.player_name`).