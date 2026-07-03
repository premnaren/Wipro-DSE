# Basic Commands

This file tracks my progress and solutions for the Basic Commands of the SQL practice modules on CodeChef. Each problem statement is documented alongside its verified query and output schema.

---

## 📑 Day 1: Basic Selection

### Products Table: 

| product_id | product_name | price | category |
| :--- | :--- | :--- | :--- |
| 1 | Laptop | 999.99 | Electronics |
| 2 | Desk Chair | 149.99 | Furniture |
| 3 | Smartphone | 599.99 | Electronics |
| 4 | Notebook | 2.99 | Stationery |
| 5 | Headphones | 89.99 | Electronics |
| 6 | Coffee Maker | 49.99 | Appliances |
| 7 | Standing Desk | 249.99 | Furniture |
| 8 | Tablet | 399.99 | Electronics |
| 9 | Mouse | 19.99 | Electronics |
| 10 | Water Bottle | 12.99 | Stationery |

### Q1: All Products
**Task:** Write a query to output the complete `Products` table.

#### SQL Query:

sql-> SELECT * FROM Products;

### Expected Output Data:

| PRODUCT_ID | PRODUCT_NAME | PRICE | CATEGORY |
| :--- | :--- | :--- | :--- |
| 1 | Laptop | 999.99 | Electronics |
| 2 | Desk Chair | 149.99 | Furniture |
| 3 | Smartphone | 599.99 | Electronics |
| 4 | Notebook | 2.99 | Stationery |
| 5 | Headphones | 89.99 | Electronics |
| 6 | Coffee Maker | 49.99 | Appliances |
| 7 | Standing Desk | 249.99 | Furniture |
| 8 | Tablet | 399.99 | Electronics |
| 9 | Mouse | 19.99 | Electronics |
| 10 | Water Bottle | 12.99 | Stationery |

### Q2: High Price of Products
**Task:** Write a query to find all product_name and category that have a price greater than 100.00 from the Products table.

#### SQL Query: 
sql-> select product_name, category FROM Products where price > 100.00;

### Expected Output Data:

| product_name | category |
| :--- | :--- |
| Laptop | Electronics |
| Desk Chair | Furniture |
| Smartphone | Electronics |
| Standing Desk | Furniture |
| Tablet | Electronics |

### Works Table: 

| employee_id | company_name | salary |
| :--- | :--- | :--- |
| 1 | TechCorp | 75000.00 |
| 2 | InnovateLtd | 62000.50 |
| 3 | HealthPlus | 54000.75 |
| 4 | EduWorks | 48000.00 |
| 5 | GreenTech | 68000.00 |
| 6 | TechCorp | 80000.00 |
| 7 | InnovateLtd | 66000.20 |
| 8 | HealthPlus | 50000.10 |
| 9 | EduWorks | 51000.00 |
| 10 | GreenTech | 72000.00 |

### Q3: Average Salary
**Task:** Write a query to calculate the average salary across all companies combined. Rename the column as avg_salary.

#### SQL Query:
sql-> SELECT AVG(salary) AS avg_salary FROM works;

### Expected Output Data:
│ avg_salary │
| :--- |
│ 62600.155  │

### Departments Table:

| department_id | department_name | location |
| :--- | :--- | :--- |
| 1 | Human Resources | New York |
| 2 | Research and Development | San Francisco |
| 3 | Sales | Los Angeles |
| 4 | Marketing | New York |
| 5 | Customer Support | Boston |
| 6 | Finance | Austin |
| 7 | IT Support | Seattle |
| 8 | Product Management | San Francisco |
| 9 | Quality Assurance | Los Angeles |
| 10 | Legal | Boston |

### Q4: Locate People
**Task:** Write a query to retrieve the department_name and location of departments located in a city that starts with 'S'.

#### SQL Query:
sql-> SELECT department_name, location 
FROM departments 
WHERE location LIKE 'S%';

### Expected Output Data:

| department_name | location |
| :--- | :--- |
| Research and Development | San Francisco |
| IT Support | Seattle |
| Product Management | San Francisco |

### Works Table:

| employee_id | company_name | salary |
| :--- | :--- | :--- |
| 1 | TechCorp | 75000.00 |
| 2 | InnovateLtd | 62000.50 |
| 3 | HealthPlus | 54000.75 |
| 4 | EduWorks | 48000.00 |
| 5 | GreenTech | 68000.00 |
| 6 | TechCorp | 80000.00 |
| 7 | InnovateLtd | 66000.20 |
| 8 | HealthPlus | 50000.10 |
| 9 | EduWorks | 51000.00 |
| 10 | GreenTech | 72000.00 |

### Q5: Distinct Companies
**Task:** Write a query to select all the distinct companies (company_name) in the Works table.

#### SQL Query:
sql-> SELECT DISTINCT company_name FROM Works;

### Expected Output Data:

| company_name |
| :--- |
| TechCorp |
| InnovateLtd |
| HealthPlus |
| EduWorks |
| GreenTech |

### Books Table:

| id | title | author | genre | price | published_year |
| :--- | :--- | :--- | :--- | :--- | :--- |
| 1 | The Great Gatsby | F. Scott Fitzgerald | Fiction | 10.99 | 1925 |
| 2 | 1984 | George Orwell | Dystopian | 15.99 | 1949 |
| 3 | To Kill a Mockingbird | Harper Lee | Fiction | 12.99 | 1960 |
| 4 | The Catcher in the Rye | J.D. Salinger | Fiction | 14.99 | 1951 |
| 5 | Brave New World | Aldous Huxley | Dystopian | 13.99 | 1932 |
| 6 | The Hobbit | J.R.R. Tolkien | Fantasy | 9.99 | 1937 |
| 7 | Moby Dick | Herman Melville | Fiction | 18.50 | 1851 |
| 8 | War and Peace | Leo Tolstoy | Historical | 20.00 | 1869 |
| 9 | The Picture of Dorian Gray | Oscar Wilde | Fiction | 11.50 | 1890 |
| 10 | The Alchemist | Paulo Coelho | Fiction | 16.00 | 1988 |
| 11 | Fahrenheit 451 | Ray Bradbury | Dystopian | 12.50 | 1953 |
| 12 | The Chronicles of Narnia | C.S. Lewis | Fantasy | 14.00 | 1950 |
| 13 | The Handmaid's Tale | Margaret Atwood | Dystopian | 15.50 | 1985 |
| 14 | A Tale of Two Cities | Charles Dickens | Historical | 13.00 | 1859 |
| 15 | Little Women | Louisa May Alcott | Fiction | 9.50 | 1868 |


### Q6: Fiction Collection Size
**Task:** Write a query to find the total count of books whose genre is Fiction.
Note: Output column name should be fiction_count.

#### SQL Query:
sql-> SELECT COUNT(*) AS fiction_count FROM Books WHERE genre = 'Fiction';

### Expected Output Data:

| fiction_count |
| :--- |
| 7 | 

### Cinema Table:

| Movie_id | Movie_name | Description | Rating |
| :--- | :--- | :--- | :--- |
| 1 | War | great 3D | 8.9 |
| 2 | Science | fiction | 8.5 |
| 3 | Irish | boring | 6.2 |
| 4 | Ice Song | Fantasy | 8.6 |
| 5 | House Card | Interesting | 9.1 |
| 6 | The Escape | Thriller | 7.8 |
| 7 | Solar Flare | Sci-Fi | 8.3 |
| 8 | The Joker | Drama | 9.0 |
| 9 | Lost Dreams | Mystery | 7.5 |
| 10 | Galaxy War | Action | 8.7 |

### Q7: List of Movies with Ratings
**Task:** Write a query to select only the movie names where the ratings are greater than 7 but less than 9.

#### SQL Query:
sql-> SELECT Movie_name FROM Cinema where Rating > 7 AND Rating < 9;

### Expected Output Data:

| Movie_name |
| :--- |
| War |
| Science |
| Ice Song |
| The Escape |
| Solar Flare |
| Lost Dreams |
| Galaxy War |

### Library Table:

| book_id | title | author | published_year | rating |
| :--- | :--- | :--- | :--- | :--- |
| 1 | The Great Gatsby | F. Scott Fitzgerald | 1925 | 4.2 |
| 2 | To Kill a Mockingbird | Harper Lee | 1960 | NULL |
| 3 | 1984 | George Orwell | 1949 | 4.8 |
| 4 | The Catcher in the Rye | J.D. Salinger | 1951 | NULL |
| 5 | Brave New World | Aldous Huxley | 1932 | 4.3 |

### Q8: Handling NULL Values
**Task:** Write a query to retrieve book_id, title, author and published_year of the books which have NULL rating for their books.

#### SQL Query:
sql-> SELECT book_id, title, author, published_year FROM Library where rating IS NULL;

### Expected Output Data:

| book_id | title | author | published_year |
| :--- | :--- | :--- | :--- |
| 2 | To Kill a Mockingbird | Harper Lee | 1960 |
| 4 | The Catcher in the Rye | J.D. Salinger | 1951 |

### Employees Table:

| employee_id | employee_name | company | category | department | salary |
| :--- | :--- | :--- | :--- | :--- | :--- |
| 1 | John Smith | TechCorp | Full-Time | Engineering | 80000 |
| 2 | Alice Johnson | TechCorp | Part-Time | HR | 30000 |
| 3 | Bob Brown | FinServ | Full-Time | Finance | 90000 |
| 4 | Carol White | HealthPlus | Contract | IT | 75000 |
| 5 | David Green | TechCorp | Full-Time | Engineering | 85000 |
| 6 | Emma Blue | FinServ | Part-Time | Finance | 32000 |
| 7 | Frank Black | HealthPlus | Full-Time | HR | 60000 |
| 8 | Grace Grey | TechCorp | Full-Time | Marketing | 70000 |
| 9 | Henry Red | FinServ | Contract | IT | 95000 |
| 10 | Ivy Yellow | HealthPlus | Part-Time | Marketing | 28000 |

### Q9: Salary of Employees
**Task:** Create a query to retrieve the employee_name, company, and salary for employees in the full-time category, ordered by salary in descending order

#### SQL Query:
sql-> SELECT employee_name, company, salary FROM Employees WHERE category = 'Full-Time' ORDER BY salary DESC;

### Expected Output Data:

| employee_name | company | salary |
| :--- | :--- | :--- |
| Bob Brown | FinServ | 90000 |
| David Green | TechCorp | 85000 |
| John Smith | TechCorp | 80000 |
| Grace Grey | TechCorp | 70000 |
| Frank Black | HealthPlus | 60000 |

### Q10: Department of Each Employee
**Task:** Write a query to group the employees by their department and display the total number of employees (as total_employees) in each department.

#### SQL Query:
sql-> SELECT department, COUNT(*) AS total_employees
FROM Employees
GROUP BY department;

### Expected Output Data:

| department | total_employees |
| :--- | :--- |
| Engineering | 2 |
| Finance | 2 |
| HR | 2 |
| IT | 1 |
| Marketing | 2 |
| Sales | 1 |

### Views Table:

| article_id | author_id | author_name | viewer_id | view_count | publication_name |
| :--- | :--- | :--- | :--- | :--- | :--- |
| 101 | 1 | John Doe | 1 | 3 | The Daily Times |
| 102 | 2 | Jane Smith | 2 | 1 | Global News |
| 103 | 3 | Emily Clark | 4 | 0 | Tech Monthly |
| 104 | 4 | Mark Lewis | 4 | 2 | Health Digest |
| 105 | 5 | Sara White | 3 | 0 | The Business Journal |
| 106 | 1 | John Doe | 2 | 0 | The Daily Times |
| 107 | 2 | Jane Smith | 2 | 2 | Global News |

### Q11: Article views
**Task:** Write a query to retrieve the author_id, author_name, and publication_name for authors whose articles got zero views. The result should be sorted by author_id in ascending order.

Return the result table sorted by id in ascending order.

#### SQL Query:
sql-> SELECT author_id, author_name, publication_name FROM Views where view_count = 0 ORDER BY author_id ASC;

### Expected Output Data:

| author_id | author_name | publication_name |
| :--- | :--- | :--- |
| 1 | John Doe | The Daily Times |
| 3 | Emily Clark | Tech Monthly |
| 5 | Sara White | The Business Journal |

### Table 1: Players

| player_id | player_name | score | rank |
| :--- | :--- | :--- | :--- |
| 1 | Alice | 1200 | 5 |
| 2 | Bob | 1500 | 2 |
| 3 | Charlie | 1300 | 4 |
| 4 | David | 1600 | 1 |
| 5 | Eve | 1100 | 6 |

### Table 2: Matches

| match_id | player1 | player2 | winner | match_date |
| :--- | :--- | :--- | :--- | :--- |
| 101 | Alice | Bob | Bob | 2024-01-15 |
| 102 | Charlie | David | David | 2024-01-16 |
| 103 | Eve | Bob | Bob | 2024-01-17 |
| 104 | Alice | David | David | 2024-01-18 |
| 105 | Charlie | Eve | Charlie | 2024-01-19 |

### Q12: Player Performance Insights
**Task:** Write a query to find the names of the top 3 distinct players by highest score who have won matches, including their scores.

#### SQL Query:
sql-> SELECT DISTINCT player_name, score
FROM Players JOIN Matches WHERE winner=player_name
ORDER BY score DESC
LIMIT 3;

### Expected Output Data:

| player_name | score |
| :--- | :--- |
| David | 1600 |
| Bob | 1500 |
| Charlie | 1300 |

### Table 1: Players

| player_id | player_name | score | rank |
| :--- | :--- | :--- | :--- |
| 1 | Alice | 1200 | 5 |
| 2 | Bob | 1500 | 2 |
| 3 | Charlie | 1300 | 4 |
| 4 | David | 1600 | 1 |
| 5 | Eve | 1100 | 6 |
| 6 | Frank | 1450 | 3 |
| 7 | Grace | 1350 | 7 |
| 8 | Hank | 1250 | 9 |
| 9 | Ivy | 1550 | 8 |
| 10 | jack | 1400 | 10 |

### Table 2: Matches

| match_id | player_1 | player_2 | winner | match_date |
| :--- | :--- | :--- | :--- | :--- |
| 101 | Alice | Bob | Bob | 2024-01-25 |
| 102 | Charlie | David | David | 2024-01-06 |
| 103 | Eve | Bob | Bob | 2024-01-17 |
| 104 | Alice | David | David | 2024-01-01 |
| 105 | Charlie | Eve | Charlie | 2024-01-15 |
| 106 | Frank | Hank | Frank | 2024-01-29 |
| 107 | Grace | Ivy | Ivy | 2024-01-10 |
| 108 | Jack | Alice | Jack | 2024-01-19 |
| 109 | Bob | Charlie | Bob | 2024-01-13 |
| 110 | David | Eve | David | 2024-01-24 |

### Q13: Player Details
**Task:** Write a query to retrieve the details of the last five matches played, including the match ID, the names of the players who participated, the name of the winning player, match date, and the final score of the winner.

#### SQL Query:
sql-> SELECT m.match_id, m.player_1, m.player_2, m.winner, m.match_date, p.score
FROM Matches m
JOIN Players p ON m.winner = p.player_name
ORDER BY m.match_date DESC
LIMIT 5;

### Expected Output Data:

| match_id | player_1 | player_2 | winner | match_date | score |
| :--- | :--- | :--- | :--- | :--- | :--- |
| 106 | Frank | Hank | Frank | 2024-01-29 | 1450 |
| 101 | Alice | Bob | Bob | 2024-01-25 | 1500 |
| 110 | David | Eve | David | 2024-01-24 | 1600 |
| 108 | Jack | Alice | Jack | 2024-01-19 | 1400 |
| 103 | Eve | Bob | Bob | 2024-01-17 | 1500 |

