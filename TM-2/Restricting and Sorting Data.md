# 📖 Module 3: Restricting and Sorting Data

This study guide outlines the principles of row filtering (`WHERE`), result sorting (`ORDER BY`), evaluation operators, and runtime runtime variables (`&`). It contains matching query syntax variations structured specifically for your active schema configuration.

---

## 📝 Core Concepts Cheat-Sheet

### 1. Row Selection (`WHERE` Clause)
The `WHERE` clause restricts returned rows based on logical conditions. It must immediately follow the `FROM` clause.
* **String Values:** Character text literals are strictly case-sensitive and must be enclosed within single quotes (e.g., `'CLERK'`, `'SCOTT'`).
* **Comparison Operators:** Supports standard evaluations: `=`, `>`, `<`, `>=`, `<=`, and `<>` (Not Equal).

### 2. Specialized SQL Operators
* **`BETWEEN ... AND ...`:** Filters values within an inclusive lower and upper boundary.
* **`IN (v1, v2, ...)`:** Matches a column value against a discrete list of explicit criteria.
* **`LIKE`:** Performs wildcard pattern matching searches:
  * `%` matches zero or more characters.
  * `_` matches exactly one character position.
* **`IS NULL` / `IS NOT NULL`:** The only valid semantic option used to check for the presence or absence of unassigned `NULL` database variables.

### 3. Result Set Ordering (`ORDER BY`)
The `ORDER BY` clause sorts your query output in either Ascending (`ASC`, default) or Descending (`DESC`) order.
* **Position Sorters:** Instead of naming explicit column headers, you can provide the numeric column sequence index position as it appears within your projection array (e.g., `ORDER BY 2 DESC`).

### 4. Runtime Substitution Prompts (`&`)
Prefixing a word with an ampersand (`&`) instructs Oracle SQL*Plus to temporarily halt execution and prompt the user to input a dynamic value at runtime.
* **Text/Date Prompting:** If the user input is intended for character string fields or dates, wrap the substitution parameter inside single quotes: `'&user_input'`.

---