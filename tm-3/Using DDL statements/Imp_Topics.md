# Data Definition Language (DDL) Guide: TM-3 Module 2 (Advanced SQL)

A comprehensive reference guide covering DDL operations, constraint declarations, table management, metadata comments, and Oracle Flashback functionality.

---

## Overview of DDL Architecture

**Data Definition Language (DDL)** commands define, alter, and manage database schema structures. Unlike Data Manipulation Language (DML) queries (`INSERT`, `UPDATE`, `DELETE`), DDL operations auto-commit transaction blocks immediately and cannot be rolled back via standard `ROLLBACK` commands.

---

## 1. Table Creation & Constraints

### Key Principles
- **Primary Key (`PK`):** Guarantees unique identification and implicitly enforces `NOT NULL`.
- **Foreign Key (`FK`):** Maintains referential integrity between parent and child tables.
- **Check Constraints:** Enforces custom domain integrity (e.g., `sal > 5000`).

### Code Example
```sql
CREATE TABLE dept1 (
    deptno INTEGER CONSTRAINT pk_dept1 PRIMARY KEY,
    dname VARCHAR2(30) NOT NULL,
    loc VARCHAR2(30) NOT NULL
);

CREATE TABLE emp1 (
    empno INTEGER CONSTRAINT pk_emp1 PRIMARY KEY,
    ename VARCHAR2(28) NOT NULL,
    sal NUMBER(10,2) CONSTRAINT chk_emp1_sal CHECK (sal > 5000),
    mgr NUMBER CONSTRAINT fk_emp1_mgr REFERENCES emp1(empno),
    deptno INTEGER CONSTRAINT fk_emp1_dept1 REFERENCES dept1(deptno)
);
```

---

## 2. Table Creation Using Subqueries (CTAS)

### Concept & Syntax
The `CREATE TABLE ... AS SELECT` (CTAS) construct creates a table based on the structure and/or data returned by a query.

- **Structure + Data Copy:**
  ```sql
  CREATE TABLE emp1 AS 
  SELECT * FROM emp;
  ```
- **Structure-Only Copy (Empty Table):** Use a `WHERE` condition that always evaluates to `FALSE` (e.g., `1 = 2`).
  ```sql
  CREATE TABLE emp2 AS 
  SELECT * FROM emp 
  WHERE 1 = 2;
  ```

---

## 3. Altering Table Structures

### Structural Modifications
- **Add Column:** `ALTER TABLE table_name ADD (col_name datatype);`
- **Modify Column:** `ALTER TABLE table_name MODIFY (col_name datatype);`
- **Rename Column:** `ALTER TABLE table_name RENAME COLUMN old_name TO new_name;`
- **Rename Constraint:** `ALTER TABLE table_name RENAME CONSTRAINT old_cname TO new_cname;`
- **Drop Constraint / Nullability:** `ALTER TABLE table_name DROP CONSTRAINT cname;` or `ALTER TABLE table_name MODIFY (col NULL);`

---

## 4. Unused Columns Optimization

### Concept & Mechanics
Dropping large columns directly in production databases can lock tables and impact system IO performance. Setting columns to **`UNUSED`** makes them immediately invisible and inaccessible without physically removing the data from the disk during active transaction periods.

```sql
-- Mark columns as unused (instant operation)
ALTER TABLE emp1 SET UNUSED (salary, ename);

-- Reclaim storage space during low-traffic periods
ALTER TABLE emp1 DROP UNUSED COLUMNS;
```

---

## 5. Data Dictionary Comments

### Syntax & Usage
Data dictionary comments document business rules directly in the database catalog (`USER_TAB_COMMENTS` and `USER_COL_COMMENTS`).

- **Table Comment:** `COMMENT ON TABLE table_name IS 'comment text';`
- **Column Comment:** `COMMENT ON COLUMN table_name.column_name IS 'comment text';`
- **Remove Comment:** Set the comment string to an empty string (`''`).

---

## 6. Table Lifecycle & Flashback Technology

### Operations Summary
- **TRUNCATE:** Removes all rows from a table while retaining structural definition. Resets high-water mark and releases storage blocks (much faster than `DELETE`).
- **DROP:** Moves the table and associated dependent objects into the Oracle **Recycle Bin** (`USER_RECYCLEBIN`).
- **FLASHBACK TABLE:** Restores dropped tables from the Recycle Bin to their pre-drop state, including original or newly assigned identifiers.

```sql
-- Flashback to original table state
FLASHBACK TABLE emp2 TO BEFORE DROP;

-- Flashback and rename to resolve naming conflicts
FLASHBACK TABLE emp2 TO BEFORE DROP RENAME TO emp2_1;
```

---

## DDL Operations Quick Matrix

| Operation | Statement Type | Auto-Commits? | Reversible via ROLLBACK? | Reversible via FLASHBACK? |
| :--- | :--- | :--- | :--- | :--- |
| `CREATE TABLE` | DDL | Yes | No | No |
| `ALTER TABLE` | DDL | Yes | No | No |
| `TRUNCATE TABLE` | DDL | Yes | No | No |
| `DROP TABLE` | DDL | Yes | No | Yes (via Recycle Bin) |
| `DELETE FROM` | DML | No | Yes | No |
