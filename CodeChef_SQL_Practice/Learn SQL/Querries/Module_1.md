# ✈️ Sub-Module 1: Introduction to Queries

This document contains the complete solutions for **Sub-Module 1:
Introduction to Queries**.

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

# 1. Display all records

## Question

Display all records from the `Flights` table.

``` sql
SELECT * FROM Flights;
```

### Output

Displays all 10 rows.

------------------------------------------------------------------------

# 2. Select Specific Columns

## Question

Display only the `Passenger_name` and `Gender` columns.

``` sql
SELECT Passenger_name, Gender
FROM Flights;
```

### Output

  Passenger_name   Gender
  ---------------- --------
  Jackson          Male
  Riya             Female
  Roy              Male
  Anthony          Male
  Salim            Male
  Dia              Female
  Jackson          Male
  Dia              Female
  Riya             Female
  Betty            Female

------------------------------------------------------------------------

# 3. DISTINCT Clause

## Question

Display all unique origin locations.

``` sql
SELECT DISTINCT Origin
FROM Flights;
```

### Output

  Origin
  ----------
  Mumbai
  London
  Ohio
  New York
  Beijing
  Damascus

------------------------------------------------------------------------

# 4. WHERE Clause

## Question

Display all passengers whose Origin is Mumbai.

``` sql
SELECT *
FROM Flights
WHERE Origin='Mumbai';
```

### Output

  Passenger_id   Passenger_name   Gender   Origin   Destination
  -------------- ---------------- -------- -------- -------------
  10001          Jackson          Male     Mumbai   New York
  10002          Riya             Female   Mumbai   Delhi
  10004          Anthony          Male     Mumbai   Cairo

------------------------------------------------------------------------

# 5. BETWEEN Clause

## Question

Display passengers whose names fall alphabetically between 'A' and 'D'.

``` sql
SELECT *
FROM Flights
WHERE Passenger_name BETWEEN 'A' AND 'D';
```

### Output

  Passenger_id   Passenger_name   Gender   Origin    Destination
  -------------- ---------------- -------- --------- -------------
  10004          Anthony          Male     Mumbai    Cairo
  10010          Betty            Female   Beijing   Cairo

------------------------------------------------------------------------

# 6. Practice - Basic WHERE Query

## Question

Display the `Passenger_name` and `Gender` where Origin is New York.

``` sql
SELECT Passenger_name, Gender
FROM Flights
WHERE Origin='New York';
```

### Output

  Passenger_name   Gender
  ---------------- --------
  Dia              Female
  Jackson          Male

------------------------------------------------------------------------

# 7. Practice - Debug this Query

## Question

Display distinct male passenger names whose origin is Mumbai.

``` sql
SELECT DISTINCT Passenger_name
FROM Flights
WHERE Gender='Male'
AND Origin='Mumbai';
```

### Output

  Passenger_name
  ----------------
  Jackson
  Anthony
