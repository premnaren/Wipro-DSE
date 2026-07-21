# 🛒 Sub-Module 3: Practice Project: Supermarket Customers

This document contains the complete solutions for the **Practice
Project: Supermarket Customers** sub-module, formatted with question
statements, initial table schemas, SQL queries, and expected output
tables.

------------------------------------------------------------------------

# 1. Project - Customer Database

## ❓ Question

Imagine you are hired by a Supermarket chain as a database analyst. Your
initial task is to create a database of customers.

-   Create a table `customer`.
-   Add the below mentioned data to the table `customer`.
-   Output the entire table.

## 📋 Initial State

Empty database schema.

## 💻 SQL Query

``` sql
-- Create a table 'customer'
CREATE TABLE customer (
    Id INT PRIMARY KEY,
    Name TEXT,
    Age INT,
    Address TEXT
);

-- Insert data into the table
INSERT INTO customer (Id, Name, Age, Address)
VALUES
    (1, 'John Smith', 25, '123 Main St'),
    (2, 'Sarah Johnson', 30, '456 Broadway'),
    (3, 'Michael Brown', 45, '789 5th Ave'),
    (4, 'Jessica Davis', 28, '321 Elm St'),
    (5, 'David Lee', 35, '555 Park Ave');

-- Output the entire table
SELECT * FROM customer;
```

## 📤 Output

  Id   Name              Age Address
  ---- --------------- ----- --------------
  1    John Smith         25 123 Main St
  2    Sarah Johnson      30 456 Broadway
  3    Michael Brown      45 789 5th Ave
  4    Jessica Davis      28 321 Elm St
  5    David Lee          35 555 Park Ave

------------------------------------------------------------------------

# 2. Practice - Alter Table and Insert Data

## ❓ Question

Write a query which does the following:

-   Take the table given above and add an additional column `email` to
    the table `customer`.
-   Consider the table `customer` to be empty and insert the below data.
-   Output all the entries in the table.

## 📋 Initial Table (`customer`)

  Id   Name     Age Address
  ---- ------ ----- ---------

## 💻 SQL Query

``` sql
-- Alter the existing table to add the column 'email'
ALTER TABLE customer
ADD COLUMN email TEXT;

-- Insert into 'customer'
INSERT INTO customer (Id, Name, Age, Address, email)
VALUES
    (1, 'John Smith', 25, 'Main St', 'john@ex.com'),
    (2, 'Sarah Johnson', 30, 'Broadway', 'sarah@ex.com');

-- Output the table
SELECT * FROM customer;
```

## 📤 Output

  Id   Name              Age Address    Email
  ---- --------------- ----- ---------- --------------
  1    John Smith         25 Main St    john@ex.com
  2    Sarah Johnson      30 Broadway   sarah@ex.com

------------------------------------------------------------------------

# 3. Practice - Update Single Record

## ❓ Question

Update the age to **52** for the customer with customer id = **3**.
Output all the entries.

## 📋 Initial Table (`customer`)

  -------------------------------------------------------------------------
  Id   Name               Age Address          Email
  ---- ---------------- ----- ---------------- ----------------------------
  1    John Smith          25 123 Main St      john@example.com

  2    Sarah Johnson       30 456 Broadway     sarah@example.com

  3    Michael Brown       45 789 5th Ave      michael.brown@example.com

  4    Jessica Davis       28 321 Elm St       jessica.davis@example.com

  5    David Lee           35 555 Park Ave     David@example.com
  -------------------------------------------------------------------------

## 💻 SQL Query

``` sql
UPDATE customer
SET age = 52
WHERE id = 3;

SELECT * FROM customer;
```

## 📤 Output

  -------------------------------------------------------------------------
  Id   Name               Age Address          Email
  ---- ---------------- ----- ---------------- ----------------------------
  1    John Smith          25 123 Main St      john@example.com

  2    Sarah Johnson       30 456 Broadway     sarah@example.com

  3    Michael Brown       52 789 5th Ave      michael.brown@example.com

  4    Jessica Davis       28 321 Elm St       jessica.davis@example.com

  5    David Lee           35 555 Park Ave     David@example.com
  -------------------------------------------------------------------------

------------------------------------------------------------------------

# 4. Practice - Delete Single Record

## ❓ Question

Delete the entire row of the customer with customer id = **1**. Output
the table after deletion.

## 📋 Initial Table (`customer`)

  -------------------------------------------------------------------------
  Id   Name               Age Address          Email
  ---- ---------------- ----- ---------------- ----------------------------
  1    John Smith          25 123 Main St      john@example.com

  2    Sarah Johnson       30 456 Broadway     sarah@example.com

  3    Michael Brown       45 789 5th Ave      michael.brown@example.com

  4    Jessica Davis       28 321 Elm St       jessica.davis@example.com
  -------------------------------------------------------------------------

## 💻 SQL Query

``` sql
DELETE FROM customer
WHERE id = 1;

SELECT * FROM customer;
```

## 📤 Output

  -------------------------------------------------------------------------
  Id   Name               Age Address          Email
  ---- ---------------- ----- ---------------- ----------------------------
  2    Sarah Johnson       30 456 Broadway     sarah@example.com

  3    Michael Brown       45 789 5th Ave      michael.brown@example.com

  4    Jessica Davis       28 321 Elm St       jessica.davis@example.com
  -------------------------------------------------------------------------

------------------------------------------------------------------------

# 5. Practice - Create Table with Constraints

## ❓ Question

The query written in the console is trying to create a table and add
data to the same. Debug this query to execute it successfully.

## 📋 Initial State

Empty database schema.

## 💻 SQL Query

``` sql
CREATE TABLE customer (
    Id INT PRIMARY KEY,
    Name VARCHAR(30),
    Age INT,
    Address VARCHAR(30),
    email VARCHAR(30) UNIQUE
);

INSERT INTO customer (Id, Name, Age, Address, email)
VALUES
    (1, 'John Smith', 25, '123 Main St', 'john@example.com'),
    (2, 'Sarah Johnson', 30, '456 Broadway', 'sarah@example.com'),
    (3, 'Michael Brown', 45, '789 5th Ave', 'michael@example.com'),
    (4, 'Jessica Davis', 28, '321 Elm St', 'Jessica@example.com');

SELECT * FROM customer;
```

## 📤 Output

  Id   Name              Age Address        Email
  ---- --------------- ----- -------------- ---------------------
  1    John Smith         25 123 Main St    john@example.com
  2    Sarah Johnson      30 456 Broadway   sarah@example.com
  3    Michael Brown      45 789 5th Ave    michael@example.com
  4    Jessica Davis      28 321 Elm St     Jessica@example.com
