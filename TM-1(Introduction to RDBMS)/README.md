# TM-1: Introduction to Database Management Systems (DBMS)

This module establishes the core theoretical foundations of Database Management Systems, mapping out system architectures, structural data modeling techniques, logical schemas, and structural data independence layers.

---

## 📘 Core Learning Modules Completed

### 1. Architectural Blueprint
* **Three-Schema Architecture:** Explored the structural division of database views designed to separate user applications from the physical database structure.
  * **External Level (View Schema):** Defines specific user views and application interfaces.
  * **Conceptual Level (Logical Schema):** Documents the global structural design, defining entities, relationships, data types, and semantic constraints.
  * **Internal Level (Physical Schema):** Describes low-level physical storage structures and access paths.


---

### 2. Data Modeling Paradigms
* **Purpose:** Investigated structural tools used to conceptualize and describe data relationships, semantics, and consistency rules.
* **Core Paradigms Analysed:**
  * **Relational Model:** Represents information systematically using interconnected tables consisting of rows (tuples) and columns (attributes).
  * **Entity-Relationship (ER) Model:** Captures real-world abstractions conceptually via entities, distinct properties, and logical associations.

---

### 3. Database Schemas & Structural Instantiation
* **Database Schema:** The static framework layout or logical design blueprint of the complete database, defined during initial engineering phases and rarely modified.
* **Database Instance:** The dynamic state or snapshot of actual values populated within the database schema at any given slice of time.

---

### 4. Data Independence Principles
Data independence ensures that modifications made at a lower structural tier do not break or require configuration changes at higher application tiers.

* **Logical Data Independence:** The capacity to alter the conceptual schema (e.g., adding or dropping columns/tables) without needing to rewrite external views or client application logic.
* **Physical Data Independence:** The capacity to alter the physical storage layout, optimization indexes, or hardware environments without affecting the conceptual or logical data schemas.

---

## 🛠️ Verification & Progress Status
* **Status:** Complete 🟩
* **Deliverables:** Analytical review of fundamental architecture, structural definitions, and data abstract layers.