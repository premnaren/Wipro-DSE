# Data Manipulation Language (DML) & Transaction Control Guide: TM-3 Module 3 (Advanced SQL)

A comprehensive reference guide covering core DML commands (`INSERT`, `UPDATE`, `DELETE`), Multi-Table Operations (`INSERT ALL`, `MERGE`), Database Transaction Control (`COMMIT`, `ROLLBACK`), Data Control Language (`GRANT`), and Concurrency / Locking Mechanisms (`FOR UPDATE`).

---

## Overview of DML & Transaction Management

**Data Manipulation Language (DML)** enables insertion, modification, and deletion of table records. Unlike DDL statements, DML operations take place within an isolated **transaction block** until explicitly committed or rolled back.

---

## 1. Fundamental DML Operations

### INSERT
Adds new rows into a target table.
```sql
-- Explicit column insertion using database pseudo-column USER
INSERT INTO emptest (empno, ename, sal)
VALUES (9001, USER, 6000);
```

### UPDATE
Modifies existing records. Subqueries can dynamically derive updated values or target rows.
```sql
-- Direct UPDATE with scalar expression
UPDATE emptest
SET sal = sal * 1.15
WHERE ename = 'TURNER';

-- UPDATE driven by a Subquery
UPDATE emptest
SET sal = (SELECT sal FROM emptest WHERE ename = 'SCOTT')
WHERE ename = 'SMITH';
```

### DELETE
Removes targeted rows from a table while preserving the table schema and structure.
```sql
-- Set field values to NULL (clearing specific column data across all rows)
UPDATE emptest
SET comm = NULL;

-- DELETE with Subquery filtering
DELETE FROM emptest
WHERE deptno = (SELECT deptno FROM dept WHERE dname = 'SALES');
```

---

## 2. Advanced DML Constructs

### Multi-Table Insert (`INSERT ALL`)
Allows a single `SELECT` source query to simultaneously populate multiple target tables.
```sql
INSERT ALL
    INTO emp2 (empno, ename, sal) VALUES (empno, ename, sal)
    INTO emp3 (empno, job) VALUES (empno, job)
SELECT empno, ename, sal, job 
FROM emp;
```

### Conditional MERGE (UPSERT Operations)
Combines `INSERT` and `UPDATE` into a single atomic statement based on matching target and source keys.
```sql
MERGE INTO emp2 target
USING emp source
ON (target.empno = source.empno)
WHEN MATCHED THEN
    UPDATE SET target.sal = source.sal
    WHERE target.empno = 7788
WHEN NOT MATCHED THEN
    INSERT (empno, ename, sal)
    VALUES (source.empno, source.ename, source.sal)
    WHERE source.sal > 3000;
```

---

## 3. Transactions & Concurrency Control

### Transaction States & Atomicity
- **`COMMIT`:** Permanently saves all uncommitted DML changes made in the current transaction block. Releases row locks.
- **`ROLLBACK`:** Undoes all uncommitted DML changes back to the start of the transaction or a designated `SAVEPOINT`.

### Data Control Language (DCL)
- **`GRANT`:** Bestows schema object privileges from a grantor (e.g., `SCOTT`) to a grantee (e.g., `WIPRO`).
```sql
GRANT ALL ON emp TO wipro;
```

---

## 4. Database Locking & Row Contention

### Exclusive Row-Level Locks
When a transaction performs a DML operation (`INSERT`, `UPDATE`, `DELETE`) on a row, Oracle automatically places an **Exclusive Row Lock (X-Lock)** on affected rows. Other sessions attempting to update or delete the same rows are blocked until the holding transaction issues a `COMMIT` or `ROLLBACK`.

### The `FOR UPDATE` Clause
Prevents race conditions by explicitly locking rows during a read/selection phase before executing subsequent modifications.
```sql
-- Session locks target rows and waits up to 20 seconds if held by another transaction
SELECT * FROM emp
WHERE deptno = 10
FOR UPDATE WAIT 20;
```

### Multi-Session Interaction Breakdown (Tasks 21 - 25)
1. **Uncommitted Locks (Task 21 & 22):** When `SCOTT` deletes rows in `DEPTNO = 10` without issuing a `COMMIT`, row-level exclusive locks remain active. If `WIPRO` attempts to execute a `DELETE` or `UPDATE` on those exact same rows, `WIPRO`'s session **hangs/blocks** waiting for `SCOTT`'s lock release.
2. **Lock Release via Rollback (Task 23):** As soon as `SCOTT` issues a `ROLLBACK`, the pending changes are discarded, exclusive locks are released, and `WIPRO`'s waiting statement immediately executes.
3. **Pessimistic Locking & Timeouts (Task 24 & 25):** Issuing `FOR UPDATE WAIT 20` guarantees that if requested rows are locked by another session, the query will raise an `ORA-30006: resource busy` error after 20 seconds rather than hanging indefinitely.

---

## DML & Concurrency Feature Comparison

| Feature / Command | Scope / Mechanism | Impact on Database | Lock Behaviour |
| :--- | :--- | :--- | :--- |
| **`UPDATE` / `DELETE`** | DML | Temporary until committed | Acquires Exclusive Row Locks (`X`) |
| **`COMMIT`** | Transaction Control | Permanent write to redo log / disk | Releases all transaction locks |
| **`ROLLBACK`** | Transaction Control | Discards undo buffer changes | Releases all transaction locks |
| **`FOR UPDATE`** | Locking Query | Reserves rows for updating | Acquires Exclusive Row Locks (`X`) |
| **`MERGE`** | Multi-DML | Upsert matching/non-matching rows | Acquires locks on updated/inserted rows |
