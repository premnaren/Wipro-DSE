# Oracle HR Schema Reference

## Overview

The HR sample schema contains **7 main tables**.

```
REGIONS
   │
   ▼
COUNTRIES
   │
   ▼
LOCATIONS
   │
   ▼
DEPARTMENTS
   │
   ├──────────────┐
   ▼              │
EMPLOYEES         │
   │              │
   ▼              │
JOB_HISTORY ◄─────┘

JOBS ─────────────► EMPLOYEES
JOBS ─────────────► JOB_HISTORY

EMPLOYEES (MANAGER_ID) ──► EMPLOYEES
```

---

# 1. REGIONS

Stores geographical regions.

### Primary Key
- `REGION_ID`

### Referenced By
- `COUNTRIES.REGION_ID`

---

# 2. COUNTRIES

Stores country information.

### Primary Key
- `COUNTRY_ID`

### Foreign Keys
- `REGION_ID` → `REGIONS.REGION_ID`

### Referenced By
- `LOCATIONS.COUNTRY_ID`

---

# 3. LOCATIONS

Stores office locations.

### Primary Key
- `LOCATION_ID`

### Foreign Keys
- `COUNTRY_ID` → `COUNTRIES.COUNTRY_ID`

### Referenced By
- `DEPARTMENTS.LOCATION_ID`

---

# 4. DEPARTMENTS

Stores department details.

### Primary Key
- `DEPARTMENT_ID`

### Foreign Keys
- `LOCATION_ID` → `LOCATIONS.LOCATION_ID`
- `MANAGER_ID` → `EMPLOYEES.EMPLOYEE_ID`

### Referenced By
- `EMPLOYEES.DEPARTMENT_ID`
- `JOB_HISTORY.DEPARTMENT_ID`

---

# 5. JOBS

Stores job roles.

### Primary Key
- `JOB_ID`

### Referenced By
- `EMPLOYEES.JOB_ID`
- `JOB_HISTORY.JOB_ID`

---

# 6. EMPLOYEES

Stores employee information.

### Primary Key
- `EMPLOYEE_ID`

### Foreign Keys
- `DEPARTMENT_ID` → `DEPARTMENTS.DEPARTMENT_ID`
- `JOB_ID` → `JOBS.JOB_ID`
- `MANAGER_ID` → `EMPLOYEES.EMPLOYEE_ID` *(Self Reference)*

### Referenced By
- `DEPARTMENTS.MANAGER_ID`
- `JOB_HISTORY.EMPLOYEE_ID`

---

# 7. JOB_HISTORY

Stores historical job assignments.

### Primary Key
- `(EMPLOYEE_ID, START_DATE)`

### Foreign Keys
- `EMPLOYEE_ID` → `EMPLOYEES.EMPLOYEE_ID`
- `JOB_ID` → `JOBS.JOB_ID`
- `DEPARTMENT_ID` → `DEPARTMENTS.DEPARTMENT_ID`

---

# Complete Foreign Key List

| Child Table | Child Column | Parent Table | Parent Column |
|-------------|--------------|--------------|---------------|
| COUNTRIES | REGION_ID | REGIONS | REGION_ID |
| LOCATIONS | COUNTRY_ID | COUNTRIES | COUNTRY_ID |
| DEPARTMENTS | LOCATION_ID | LOCATIONS | LOCATION_ID |
| DEPARTMENTS | MANAGER_ID | EMPLOYEES | EMPLOYEE_ID |
| EMPLOYEES | DEPARTMENT_ID | DEPARTMENTS | DEPARTMENT_ID |
| EMPLOYEES | JOB_ID | JOBS | JOB_ID |
| EMPLOYEES | MANAGER_ID | EMPLOYEES | EMPLOYEE_ID |
| JOB_HISTORY | EMPLOYEE_ID | EMPLOYEES | EMPLOYEE_ID |
| JOB_HISTORY | JOB_ID | JOBS | JOB_ID |
| JOB_HISTORY | DEPARTMENT_ID | DEPARTMENTS | DEPARTMENT_ID |

---

# Memorization Trick

Think of the flow as:

```
REGIONS
    ↓
COUNTRIES
    ↓
LOCATIONS
    ↓
DEPARTMENTS
    ↓
EMPLOYEES
```

Extra relationships:

- **JOBS** → Employees have a Job.
- **JOB_HISTORY** → Records an employee's previous jobs and departments.
- **EMPLOYEES** → Managers are also employees (self-reference).

Remember this sentence:

> **Region → Country → Location → Department → Employee**

Everything else branches from **EMPLOYEES** and **JOBS**.

---

# Most Common JOIN Path

```sql
REGIONS
JOIN COUNTRIES
JOIN LOCATIONS
JOIN DEPARTMENTS
JOIN EMPLOYEES
JOIN JOBS
LEFT JOIN JOB_HISTORY
```

This path covers nearly all common HR reporting queries.