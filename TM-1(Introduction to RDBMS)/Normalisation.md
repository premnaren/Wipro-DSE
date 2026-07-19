# Normalization Assignment — Answers
 
---
 
## Q1. EMPLOYEE Table
**Columns:** EMPNO, ENAME, SAL, DEPTNO, DNAME, LOC
 
### What's wrong with it?
- The primary key is **EMPNO** (one employee = one row).
- Since EMPNO is a single column, there's no *partial* dependency problem — so the table is already in **1NF and 2NF**.
- But look at DNAME and LOC. They don't really depend on EMPNO — they depend on **DEPTNO**.
  - EMPNO → DEPTNO
  - DEPTNO → DNAME, LOC
  - So EMPNO → DNAME, LOC only *indirectly* (through DEPTNO). This is called a **transitive dependency**, and it breaks **3NF**.
### Simple explanation
If a department changes its location, you'd have to update LOC in *every row* of every employee in that department — that's repeated, wasteful data (update anomaly).
 
### How to fix it (bring to 3NF)
Split into two tables:
 
**EMPLOYEE**
| EMPNO (PK) | ENAME | SAL | DEPTNO (FK) |
|---|---|---|---|
 
**DEPARTMENT**
| DEPTNO (PK) | DNAME | LOC |
|---|---|---|
 
Now department info is stored once per department, not once per employee. ✅ This satisfies **3NF**.
 
---
 
## Q2. STUDENT Table
**Columns:** ROLLNO, NAME, AGE, EXAM, MARKS, GRADE
 
### What's wrong with it?
- Primary key is **ROLLNO**.
- GRADE doesn't depend on ROLLNO directly — it depends on **MARKS** (e.g., 90+ marks = "A" grade, regardless of which student it is).
  - ROLLNO → MARKS
  - MARKS → GRADE
  - So this is again a **transitive dependency**: ROLLNO → GRADE only through MARKS. This breaks **3NF**.
### Simple explanation
The grading rule (which marks range gets which grade) is a fact about *marks*, not about a *specific student*. Storing GRADE next to ROLLNO means the same marks-to-grade rule gets repeated for every student, and if the grading scale changes, you'd have to update many rows.
 
### How to fix it (bring to 3NF)
Split into two tables:
 
**STUDENT**
| ROLLNO (PK) | NAME | AGE | EXAM | MARKS |
|---|---|---|---|---|
 
**GRADE_SCALE**
| MARKS (PK)* | GRADE |
|---|---|
 
*(In practice this is usually a marks *range* → grade table, but conceptually it separates the grading rule from student data.)*
 
Now the grading logic lives in one place. ✅ This satisfies **3NF**.
 
---
 
## Q3. EMPNO, PROJECT_NO, NO_OF_DAYS, CUSTOMERNAME
**Given:** EMPNO + PROJECT_NO together form the composite primary key.
 
### What's the problem?
- Check each non-key column against the **full** composite key (EMPNO + PROJECT_NO):
  - **NO_OF_DAYS** → makes sense only when you know *both* which employee and which project (how many days *that employee* worked on *that project*). ✅ Depends on the whole key.
  - **CUSTOMERNAME** → this only depends on **PROJECT_NO** (each project belongs to one customer), not on EMPNO at all. ❌
- Since CUSTOMERNAME depends on only *part* of the composite key (PROJECT_NO), not the whole key, this is called a **partial dependency**. This breaks **2NF** (the table isn't even in 2NF yet, so 3NF doesn't apply until this is fixed first).
### Simple explanation
If 5 employees work on the same project, CUSTOMERNAME gets repeated 5 times for no reason. If the customer's name changes, you'd need to update it in every one of those rows — a classic update anomaly.
 
### How to fix it (bring to 2NF)
Split into two tables:
 
**EMP_PROJECT**
| EMPNO (PK) | PROJECT_NO (PK) | NO_OF_DAYS |
|---|---|---|
 
**PROJECT_CUSTOMER**
| PROJECT_NO (PK) | CUSTOMERNAME |
|---|---|
 
Now CUSTOMERNAME is stored once per project. ✅ This satisfies **2NF** (and also 3NF, since there's no further transitive dependency left).
 
---
 
## Quick Recap
| Rule | Violation Type | Fix |
|---|---|---|
| 2NF | Non-key column depends on only **part** of a composite key | Move it to a table keyed by that part only |
| 3NF | Non-key column depends on **another non-key column**, not the primary key directly | Move it to a table keyed by that other column |
 