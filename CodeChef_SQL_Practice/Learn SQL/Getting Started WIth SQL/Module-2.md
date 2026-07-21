# 📌 Sub-Module 2: ALTER / UPDATE / DELETE / Constraints

---

## 1. Update Table Column Value

### ❓ Question
Write a query to set the `Department` as `'Hr'` for the employee with `Employee_id = 2` in the existing `employee` table. Output all entries of the table.

### 📋 Initial Table (`employee`)
| Employee_id | Employee_Name | Department |
| :--- | :--- | :--- |
| 1 | Kayla Thompson | Sales |
| 2 | Ethan Chen | Operations |
| 3 | Julia Lee | Hr |

### 💻 SQL Query
```sql
UPDATE employee SET Department = 'Hr' WHERE Employee_id = 2;

SELECT * FROM employee;
```

### 📤 Output
| Employee_id | Employee_Name | Department |
| :--- | :--- | :--- |
| 1 | Kayla Thompson | Sales |
| 2 | Ethan Chen | Hr |
| 3 | Julia Lee | Hr |

---

## 2. Practice Problem - Alter Table

### ❓ Question
Add a new column `Hourly_Pay` to the table `employee` and set the default value as `100`. Output the entire table.

### 📋 Initial Table (`employee`)
| Employee_id | Employee_Name | Department |
| :--- | :--- | :--- |
| 1 | Kayla Thompson | Sales |
| 2 | Ethan Chen | Hr |
| 3 | Julia Lee | Operations |
| 4 | Marcus Garcia | Hr |

### 💻 SQL Query
```sql
ALTER TABLE employee ADD COLUMN Hourly_Pay INT DEFAULT 100;

SELECT * FROM employee;
```

### 📤 Output
| Employee_id | Employee_Name | Department | Hourly_Pay |
| :--- | :--- | :--- | :--- |
| 1 | Kayla Thompson | Sales | 100 |
| 2 | Ethan Chen | Hr | 100 |
| 3 | Julia Lee | Operations | 100 |
| 4 | Marcus Garcia | Hr | 100 |

---

## 3. Practice Problem - Update Table with Condition

### ❓ Question
Set `Hourly_Pay` to `150` for the employees in the `Hr` department. Output the entire table.

### 📋 Initial Table (`employee`)
| Employee_id | Employee_Name | Department | Hourly_Pay |
| :--- | :--- | :--- | :--- |
| 1 | Kayla Thompson | Sales | 100 |
| 2 | Ethan Chen | Hr | 100 |
| 3 | Julia Lee | Operations | 100 |
| 4 | Marcus Garcia | Hr | 100 |

### 💻 SQL Query
```sql
UPDATE employee SET Hourly_Pay = 150 WHERE Department = 'Hr';

SELECT * FROM employee;
```

### 📤 Output
| Employee_id | Employee_Name | Department | Hourly_Pay |
| :--- | :--- | :--- | :--- |
| 1 | Kayla Thompson | Sales | 100 |
| 2 | Ethan Chen | Hr | 150 |
| 3 | Julia Lee | Operations | 100 |
| 4 | Marcus Garcia | Hr | 150 |

---

## 4. Delete Rows from Table

### ❓ Question
Delete all rows in the `employee` table whose `Department` is `'Hr'`. Output all the entries of the table.

### 📋 Initial Table (`employee`)
| Employee_id | Employee_Name | Department |
| :--- | :--- | :--- |
| 1 | Kayla Thompson | Sales |
| 2 | Ethan Chen | Operations |
| 3 | Julia Lee | Hr |
| 4 | Marcus Garcia | Product |

### 💻 SQL Query
```sql
DELETE FROM employee WHERE Department = 'Hr';

SELECT * FROM employee;
```

### 📤 Output
| Employee_id | Employee_Name | Department |
| :--- | :--- | :--- |
| 1 | Kayla Thompson | Sales |
| 2 | Ethan Chen | Operations |
| 4 | Marcus Garcia | Product |

---

## 5. Constraints - Create Table with Constraints

### ❓ Question
Write a query to create a table `employee` with the mentioned constraints on the columns:
- `employee_id` - `INTEGER PRIMARY KEY`
- `employee_Name` - `TEXT UNIQUE`
- `department` - `TEXT NOT NULL CHECK (department IN ('Sales', 'Finance', 'Operations'))`

### 📋 Initial State
Empty database schema.

### 💻 SQL Query
```sql
CREATE TABLE employee (
    employee_id INTEGER PRIMARY KEY,
    employee_Name TEXT UNIQUE,
    department TEXT NOT NULL CHECK (department IN ('Sales', 'Finance', 'Operations'))
);
```

### 📤 Output
Empty table created with the defined key, unique, not null, and check constraints:

| employee_id | employee_Name | department |
| :--- | :--- | :--- |

---

## 6. Practice - Delete From

### ❓ Question
Write a query which does the following:
- Delete the row where the department is `Client`.
- Output the entire table.

### 📋 Initial Table (`employee`)
| Employee_id | Employee_Name | Department |
| :--- | :--- | :--- |
| 1 | Kayla Thompson | Sales |
| 2 | Ethan Chen | Operations |
| 3 | Julia Lee | Client |
| 4 | Marcus Garcia | Product |

### 💻 SQL Query
```sql
DELETE FROM employee WHERE department = 'Client';

SELECT * FROM employee;
```

### 📤 Output
| Employee_id | Employee_Name | Department |
| :--- | :--- | :--- |
| 1 | Kayla Thompson | Sales |
| 2 | Ethan Chen | Operations |
| 4 | Marcus Garcia | Product |

---

## 7. Debug Insert Query with Constraints

### ❓ Question
The query written in the console is trying to insert data into the table `employee`. Debug this query to run the problem successfully (resolve constraint conflict where `'12Main St'` was modified to be unique from `'123 Main St'`).

### 📋 Initial Table Schema (`employee`)
- `Id PRIMARY KEY (INT)`
- `Name (TEXT)`
- `Age (INT)`
- `Address UNIQUE (TEXT)`

### 💻 SQL Query
```sql
INSERT INTO employee (Id, Name, Age, Address)
VALUES 
    (1, 'John Smith', 25, '123 Main St'),
    (2, 'Sarah Johnson', 30, '456 Broadway'),
    (3, 'Michael Brown', 45, '12Main St'),
    (4, 'Jessica Davis', 28, '321 Elm St');
```

### 📤 Output
| Id | Name | Age | Address |
| :--- | :--- | :--- | :--- |
| 1 | John Smith | 25 | 123 Main St |
| 2 | Sarah Johnson | 30 | 456 Broadway |
| 3 | Michael Brown | 45 | 12Main St |
| 4 | Jessica Davis | 28 | 321 Elm St |