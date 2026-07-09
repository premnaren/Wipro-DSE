# 🚀 Oracle Database 26ai Free & SQL Developer Configuration Journal

This document tracks the comprehensive deployment, network troubleshooting, database administration, and schema provisioning steps taken to successfully establish an Oracle AI Database environment on a native Windows workstation.

---

## 📅 Timeline & Setup Summary
* **Database Engine:** Oracle AI Database 26ai Free Release 23.26.0.0.0
* **Client Tool:** Oracle SQL Developer
* **Target Pluggable Container:** `FREEPDB1`
* **Network Coordinates:** `localhost:1521` or `127.0.0.1:1521`

---

## 🛠️ Phase 1: Network Listener Architecture Rescue

### The Problem
Running `lsnrctl status` initially revealed that the Oracle network layer was completely isolated. The database listener was hardcoded to bind to an incorrect host definition:
```text
Connecting to (DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=host.docker.internal)(PORT=1521)))
...
The listener supports no services
```
Because the host was set to `host.docker.internal` instead of the local system loopback, any connection attempts from native client tools like SQL Developer or direct SQL*Plus endpoints resulted in connectivity failures.

### The Solution
I performed a manual override on the network listener configuration parameters.

1. **Located the File:** Navigated to the network administration repository at:
   `A:\oracle_db\dbhomeFree2\dbhomeFree\NETWORK\ADMIN\listener.ora`

2. **Refactored Configuration:** Rewrote the file to eliminate the Docker routing mapping, replacing it with a robust local loopback binding (`127.0.0.1`) paired with explicit static Service Identifier descriptions (`SID_LIST`) to ensure the pluggable sandboxes are persistently exposed.

```text
DEFAULT_SERVICE_LISTENER = FREE

SID_LIST_LISTENER =
  (SID_LIST =
    (SID_DESC =
      (GLOBAL_DBNAME = FREE)
      (SID_NAME = FREE)
    )
    (SID_DESC =
      (GLOBAL_DBNAME = freepdb1)
      (SID_NAME = FREE)
    )
  )

LISTENER =
  (DESCRIPTION_LIST =
    (DESCRIPTION =
      (ADDRESS = (PROTOCOL = TCP)(HOST = 127.0.0.1)(PORT = 1521))
      (ADDRESS = (PROTOCOL = IPC)(KEY = EXTPROC1521))
    )
  )
```

3. **Recycled the Network Daemon:** Opened an elevated command prompt and flushed the active listener memory to enforce the new configuration:
   ```cmd
   lsnrctl stop
   lsnrctl start
   ```

---

## 🏢 Phase 2: Container Navigation & Credential Provisioning

### The Architecture Concept
Oracle utilizes a Multitenant Architecture resembling a shopping mall:
* **`CDB$ROOT` (The Mall Management Office):** Handles background systems and global metadata. Business logic or application schemas cannot be created here.
* **`FREEPDB1` (The Storefront):** A Pluggable Database (PDB) sandbox where all developer user structures, application tables, and assignment datasets reside.

### Resolving ORA-01017 Authentication Blocks
Initial connection attempts using local accounts generated `ORA-01017: invalid credential or not authorized; logon denied` because the session defaulted to the root container (`CDB$ROOT`), which has no knowledge of user-space schemas.

To resolve this, we connected via the primary system administrator endpoint to properly target and configure the workspaces inside the pluggable container.

1. **Administrative Authentication:**
   ```cmd
   sqlplus / as sysdba
   ```
2. **Container State Optimization & Traversal:**
   ```sql
   ALTER PLUGGABLE DATABASE FREEPDB1 OPEN;
   ALTER SESSION SET CONTAINER = FREEPDB1;
   ```
3. **User Account Re-authorization:**
   ```sql
   ALTER USER C##PREMNAREN IDENTIFIED BY prem4735;
   ALTER USER hr IDENTIFIED BY hr ACCOUNT UNLOCK;
   ```

---

## 📊 Phase 3: Schema Provisioning & Data Hydration

When accessing the fresh workspace (`C##PREMNAREN`), running metadata queries initially yielded an empty canvas (`no rows selected`). 

We executed Data Definition Language (DDL) and Data Manipulation Language (DML) transactions to build and populate a traditional relational training model containing `EMP` and `DEPT` tables.

```sql
-- Create Department Structure
CREATE TABLE DEPT (
    DEPTNO NUMBER(2) CONSTRAINT PK_DEPT PRIMARY KEY,
    DNAME VARCHAR2(14),
    LOC VARCHAR2(13)
);

-- Create Employee Structure with Referential Integrity
CREATE TABLE EMP (
    EMPNO NUMBER(4) CONSTRAINT PK_EMP PRIMARY KEY,
    ENAME VARCHAR2(10),
    JOB VARCHAR2(9),
    MGR NUMBER(4),
    HIREDATE DATE,
    SAL NUMBER(7,2),
    COMM NUMBER(7,2),
    DEPTNO NUMBER(2) CONSTRAINT FK_DEPTNO REFERENCES DEPT
);

-- Populate Core Data
INSERT INTO DEPT VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPT VALUES (20, 'RESEARCH', 'DALLAS');

INSERT INTO EMP VALUES (7839, 'KING', 'PRESIDENT', NULL, TO_DATE('17-11-1981','DD-MM-YYYY'), 5000, NULL, 10);
INSERT INTO EMP VALUES (7566, 'JONES', 'MANAGER', 7839, TO_DATE('02-04-1981','DD-MM-YYYY'), 2975, NULL, 20);

-- Permanently Commit Transactions to Disk
COMMIT;
```

---

## 🚀 Phase 4: Current Working Workflows

Administrative overhead is no longer required for day-to-day work. The environment can be accessed instantly using direct network connection strings that guide the client past the root container straight to the pluggable workspace.

### Direct SQL*Plus CLI Connections
Open any fresh command prompt window and use the network string syntax:

* **For Personal Workspace (`C##PREMNAREN`):**
  ```cmd
  sqlplus C##PREMNAREN/pre4735@localhost:1521/freepdb1
  ```
* **For Sample Dataset Workspace (`hr`):**
  ```cmd
  sqlplus hr/hr@localhost:1521/freepdb1
  ```

### GUI Access via SQL Developer
When initializing a database connection profile within SQL Developer, apply the following verified parameters:
* **Connection Type:** `Basic`
* **Username:** `C##PREMNAREN` or `hr`
* **Password:** `prem4735` or `hr`
* **Hostname:** `localhost`
* **Port:** `1521`
* **Service Name (Radio Button Checked):** `freepdb1`

---
