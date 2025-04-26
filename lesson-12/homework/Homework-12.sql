Create table Person (personId int, firstName varchar(255), lastName varchar(255))
Create table Address (addressId int, personId int, city varchar(255), state varchar(255))
Truncate table Person
insert into Person (personId, lastName, firstName) values ('1', 'Wang', 'Allen')
insert into Person (personId, lastName, firstName) values ('2', 'Alice', 'Bob')
Truncate table Address
insert into Address (addressId, personId, city, state) values ('1', '2', 'New York City', 'New York')
insert into Address (addressId, personId, city, state) values ('2', '3', 'Leetcode', 'California')

SELECT 
    p.firstName, 
    p.lastName, 
    a.city, 
    a.state
FROM 
    Person p
LEFT JOIN 
    Address a ON p.personId = a.personId;

Create table Employee (id int, name varchar(255), salary int, managerId int)
Truncate table Employee
insert into Employee (id, name, salary, managerId) values ('1', 'Joe', '70000', '3')
insert into Employee (id, name, salary, managerId) values ('2', 'Henry', '80000', '4')
insert into Employee (id, name, salary, managerId) values ('3', 'Sam', '60000', NULL)
insert into Employee (id, name, salary, managerId) values ('4', 'Max', '90000', NULL)

SELECT 
    e.name AS Employee
FROM 
    Employee e
JOIN 
    Employee m ON e.managerId = m.id
WHERE 
    e.salary > m.salary;

SELECT 
    email AS Email
FROM 
    Person
GROUP BY 
    email
HAVING 
    COUNT(*) > 1;


WITH CTE AS (
    SELECT 
        id,
        ROW_NUMBER() OVER (PARTITION BY email ORDER BY id ASC) AS rn
    FROM 
        Person
)
DELETE FROM CTE
WHERE rn > 1;


CREATE TABLE boys (
    Id INT PRIMARY KEY,
    name VARCHAR(100),
    ParentName VARCHAR(100)
);

CREATE TABLE girls (
    Id INT PRIMARY KEY,
    name VARCHAR(100),
    ParentName VARCHAR(100)
);

INSERT INTO boys (Id, name, ParentName) 
VALUES 
(1, 'John', 'Michael'),  
(2, 'David', 'James'),   
(3, 'Alex', 'Robert'),   
(4, 'Luke', 'Michael'),  
(5, 'Ethan', 'David'),    
(6, 'Mason', 'George');  


INSERT INTO girls (Id, name, ParentName) 
VALUES 
(1, 'Emma', 'Mike'),  
(2, 'Olivia', 'James'),  
(3, 'Ava', 'Robert'),    
(4, 'Sophia', 'Mike'),  
(5, 'Mia', 'John'),      
(6, 'Isabella', 'Emily'),
(7, 'Charlotte', 'George');

SELECT DISTINCT g.ParentName
FROM girls g
WHERE g.ParentName NOT IN (SELECT DISTINCT ParentName FROM boys);

SELECT 
    custid,
    SUM(SalesAmount) AS TotalSalesAmount,
    MIN(weight) AS LeastWeight
FROM Sales.Orders
WHERE weight > 50
GROUP BY custid;


SELECT 
    c1.Item AS [Item Cart 1], 
    c2.Item AS [Item Cart 2]
FROM 
    Cart1 c1
FULL OUTER JOIN 
    Cart2 c2
ON 
    c1.Item = c2.Item;


SELECT 
    MatchID,
    Match,
    Score,
    CASE 
        WHEN LEFT(Score, CHARINDEX(':', Score) - 1) > RIGHT(Score, LEN(Score) - CHARINDEX(':', Score))
            THEN LEFT(Match, CHARINDEX('-', Match) - 1)
        WHEN LEFT(Score, CHARINDEX(':', Score) - 1) < RIGHT(Score, LEN(Score) - CHARINDEX(':', Score))
            THEN RIGHT(Match, LEN(Match) - CHARINDEX('-', Match))
        ELSE 'Draw'
    END AS Result
FROM 
    match1;


SELECT c.name AS Customers
FROM Customers c
LEFT JOIN Orders o ON c.id = o.customerId
WHERE o.customerId IS NULL;


SELECT s.student_id,
       s.student_name,
       sub.subject_name,
       COUNT(e.student_id) AS attended_exams
FROM Students s
CROSS JOIN Subjects sub
LEFT JOIN Examinations e
  ON s.student_id = e.student_id
  AND sub.subject_name = e.subject_name
GROUP BY s.student_id, s.student_name, sub.subject_name
ORDER BY s.student_id, sub.subject_name;

