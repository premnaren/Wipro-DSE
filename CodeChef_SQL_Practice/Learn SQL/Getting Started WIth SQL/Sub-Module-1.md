---

# 📌 Sub-Module 1: Introduction to SQL

---

## 1. Select All Columns from Table

### ❓ Question
Output all the data entered in the table `employee`.

### 📋 Initial Table (`employee`)
| Employee_id | Employee_Name | Department |
| :--- | :--- | :--- |
| 1 | Kayla Thompson | Sales |
| 2 | Ethan Chen | Operations |
| 3 | Julia Lee | Hr |
| 4 | Marcus Garcia | Product |
| 5 | Samantha Park | Operations |

### 💻 SQL Query
```sql
SELECT * FROM employee;
```

### 📤 Output
| Employee_id | Employee_Name | Department |
| :--- | :--- | :--- |
| 1 | Kayla Thompson | Sales |
| 2 | Ethan Chen | Operations |
| 3 | Julia Lee | Hr |
| 4 | Marcus Garcia | Product |
| 5 | Samantha Park | Operations |

---

## 2. Create Table in SQL

### ❓ Question
Write a query to create a table `employee` with columns `Employee_id`, `Employee_Name`, and `Department`.

### 📋 Initial State
Empty database schema.

### 💻 SQL Query
```sql
CREATE TABLE employee (
    Employee_id INTEGER,
    Employee_Name TEXT,
    Department TEXT
);
```

### 📤 Output
Empty table created with the following column structure:

| Employee_id | Employee_Name | Department |
| :--- | :--- | :--- |

---

## 3. Insert Multiple Rows into Table

### ❓ Question
Write a query to insert the following employee details into the `employee` table together in a single statement:
1. Employee 1: `Employee_id: 4`, `Employee_Name: 'Marcus Garcia'`, `Department: 'Product'`
2. Employee 2: `Employee_id: 5`, `Employee_Name: 'Samantha Park'`, `Department: 'Hr'`

### 📋 Initial Table (`employee`)
| Employee_id | Employee_Name | Department |
| :--- | :--- | :--- |
| 1 | Kayla Thompson | Sales |
| 2 | Ethan Chen | Operations |
| 3 | Julia Lee | Hr |

### 💻 SQL Query
```sql
INSERT INTO employee (Employee_id, Employee_Name, Department) 
VALUES 
    (4, 'Marcus Garcia', 'Product'),
    (5, 'Samantha Park', 'Hr');
```

### 📤 Output
| Employee_id | Employee_Name | Department |
| :--- | :--- | :--- |
| 1 | Kayla Thompson | Sales |
| 2 | Ethan Chen | Operations |
| 3 | Julia Lee | Hr |
| 4 | Marcus Garcia | Product |
| 5 | Samantha Park | Hr |

---

## 4. Insert Single Row into Table

### ❓ Question
Write a query to add the following employee details to the `employee` table:
`Employee_id: 6`, `Employee_Name: 'Brandon Kim'`, `Department: 'Operations'`

### 📋 Initial Table (`employee`)
| Employee_id | Employee_Name | Department |
| :--- | :--- | :--- |
| 1 | Kayla Thompson | Sales |
| 2 | Ethan Chen | Operations |
| 3 | Julia Lee | Hr |
| 4 | Marcus Garcia | Product |
| 5 | Samantha Park | Operations |

### 💻 SQL Query
```sql
INSERT INTO employee VALUES (6, 'Brandon Kim', 'Operations');
```

### 📤 Output
| Employee_id | Employee_Name | Department |
| :--- | :--- | :--- |
| 1 | Kayla Thompson | Sales |
| 2 | Ethan Chen | Operations |
| 3 | Julia Lee | Hr |
| 4 | Marcus Garcia | Product |
| 5 | Samantha Park | Operations |
| 6 | Brandon Kim | Operations |

---

## 5. Debug Insert Query

### ❓ Question
The query written in the console is trying to insert data into the table `employee`. Debug this query to output the entire table correctly.

### 📋 Initial Table (`employee`)
| Id | Name | Age | Address |
| :--- | :--- | :--- | :--- |

### 💻 SQL Query
```sql
INSERT INTO employee (Id, Name, Age, Address)
VALUES 
    (1, 'John Smith', 25, '123 Main St'),
    (2, 'Sarah Johnson', 30, '456 Broadway');

SELECT * FROM employee;
```

### 📤 Output
| Id | Name | Age | Address |
| :--- | :--- | :--- | :--- |
| 1 | John Smith | 25 | 123 Main St |
| 2 | Sarah Johnson | 30 | 456 Broadway |

---

## 6. Alter Table - Add Column with Default Value

### ❓ Question
Write a query to add a column `Designation` to the table `employee` and set `NULL` as the default value. Output the entire table.

### 📋 Initial Table (`employee`)
| Employee_id | Employee_Name | Department |
| :--- | :--- | :--- |
| 1 | Kayla Thompson | Sales |
| 2 | Ethan Chen | Operations |
| 3 | Julia Lee | Hr |

### 💻 SQL Query
```sql
ALTER TABLE employee ADD COLUMN Designation TEXT DEFAULT NULL;

SELECT * FROM employee;
```

### 📤 Output
| Employee_id | Employee_Name | Department | Designation |
| :--- | :--- | :--- | :--- |
| 1 | Kayla Thompson | Sales | NULL |
| 2 | Ethan Chen | Operations | NULL |
| 3 | Julia Lee | Hr | NULL |

---