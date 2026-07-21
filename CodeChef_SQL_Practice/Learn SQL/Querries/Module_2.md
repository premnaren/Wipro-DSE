# 📘 Module 2: WHERE - Conditional Statements

This document contains the complete solutions for **Module 2 -- WHERE:
Conditional Statements**.

## 📋 Flights Table

  Passenger_id   Passenger_name   Gender   Origin     Destination
  -------------- ---------------- -------- ---------- -------------
  10001          Jackson          Male     Mumbai     New York
  10002          Riya             Female   Mumbai     Delhi
  10003          Roy              Male     London     Delhi
  10004          Anthony          Male     Mumbai     Cairo
  10005          Salim            Male     Ohio       New York
  10006          Dia              Female   New York   Cairo
  10007          Jackson          Male     New York   London
  10008          Dia              Female   Beijing    Mumbai
  10009          Riya             Female   Damascus   Mumbai
  10010          Betty            Female   Beijing    Cairo

------------------------------------------------------------------------

# 1. AND Operator

## ❓ Question

Display all flights where: - Gender = Female - Destination = Cairo

``` sql
SELECT *
FROM Flights
WHERE Gender='Female'
AND Destination='Cairo';
```

### 📤 Output

  Passenger_id   Passenger_name   Gender   Origin     Destination
  -------------- ---------------- -------- ---------- -------------
  10006          Dia              Female   New York   Cairo
  10010          Betty            Female   Beijing    Cairo

------------------------------------------------------------------------

# 2. OR Operator

## ❓ Question

Display all flights where: - Origin is Mumbai **OR** - Destination is
Mumbai

``` sql
SELECT *
FROM Flights
WHERE Origin='Mumbai'
OR Destination='Mumbai';
```

### 📤 Output

  Passenger_id   Passenger_name   Gender   Origin     Destination
  -------------- ---------------- -------- ---------- -------------
  10001          Jackson          Male     Mumbai     New York
  10002          Riya             Female   Mumbai     Delhi
  10004          Anthony          Male     Mumbai     Cairo
  10008          Dia              Female   Beijing    Mumbai
  10009          Riya             Female   Damascus   Mumbai

------------------------------------------------------------------------

# 3. LIKE Operator

## ❓ Question

Display passengers whose names end with **'a'**.

``` sql
SELECT *
FROM Flights
WHERE Passenger_name LIKE '%a';
```

### 📤 Output

  Passenger_id   Passenger_name   Gender   Origin     Destination
  -------------- ---------------- -------- ---------- -------------
  10002          Riya             Female   Mumbai     Delhi
  10006          Dia              Female   New York   Cairo
  10008          Dia              Female   Beijing    Mumbai
  10009          Riya             Female   Damascus   Mumbai

------------------------------------------------------------------------

# 4. Practice - Multiple LIKE Patterns

## ❓ Question

Display flights where: - Destination ends with **'o'** - Origin starts
with **'M'**

``` sql
SELECT *
FROM Flights
WHERE Destination LIKE '%o'
AND Origin LIKE 'M%';
```

### 📤 Output

  Passenger_id   Passenger_name   Gender   Origin   Destination
  -------------- ---------------- -------- -------- -------------
  10004          Anthony          Male     Mumbai   Cairo

------------------------------------------------------------------------

# 5. Practice - Debug this Query

## ❓ Question

Display flights where: - Gender = Female - Destination = Delhi

``` sql
SELECT *
FROM Flights
WHERE Gender='Female'
AND Destination='Delhi';
```

### 📤 Output

  Passenger_id   Passenger_name   Gender   Origin   Destination
  -------------- ---------------- -------- -------- -------------
  10002          Riya             Female   Mumbai   Delhi
