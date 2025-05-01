CREATE TABLE Schedule
(
ScheduleID  CHAR(1) PRIMARY KEY,
StartTime   DATETIME NOT NULL,
EndTime     DATETIME NOT NULL
);

CREATE TABLE Activity
(
ScheduleID    CHAR(1) REFERENCES Schedule (ScheduleID),
ActivityName  VARCHAR(100),
StartTime     DATETIME,
EndTime       DATETIME,
PRIMARY KEY (ScheduleID, ActivityName, StartTime, EndTime)
);

INSERT INTO Schedule (ScheduleID, StartTime, EndTime) VALUES
('A',CAST('2021-10-01 10:00:00' AS DATETIME),CAST('2021-10-01 15:00:00' AS DATETIME)),
('B',CAST('2021-10-01 10:15:00' AS DATETIME),CAST('2021-10-01 12:15:00' AS DATETIME));


INSERT INTO Activity (ScheduleID, ActivityName, StartTime, EndTime) VALUES
('A','Meeting',CAST('2021-10-01 10:00:00' AS DATETIME),CAST('2021-10-01 10:30:00' AS DATETIME)),
('A','Break',CAST('2021-10-01 12:00:00' AS DATETIME),CAST('2021-10-01 12:30:00' AS DATETIME)),
('A','Meeting',CAST('2021-10-01 13:00:00' AS DATETIME),CAST('2021-10-01 13:30:00' AS DATETIME)),
('B','Break',CAST('2021-10-01 11:00:00'AS DATETIME),CAST('2021-10-01 11:15:00' AS DATETIME));

CREATE TABLE Numbers
(
Id         INTEGER,
StepNumber INTEGER,
[Count]    INTEGER
);


INSERT INTO Numbers VALUES
 (1,1,1) 
,(1,2,-2)
,(1,3,-1)
,(1,4,12)
,(1,5,-2)
,(2,1,7)
,(2,2,-3);


CREATE TABLE Example
(
Id       INTEGER IDENTITY(1,1) PRIMARY KEY,
String VARCHAR(30) NOT NULL
);


INSERT INTO Example VALUES('123456789'),('abcdefghi');


CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    DepartmentID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Salary DECIMAL(10, 2)
);

INSERT INTO Employees (EmployeeID, DepartmentID, FirstName, LastName, Salary) VALUES
(1, 1, 'John', 'Doe', 60000.00),
(2, 1, 'Jane', 'Smith', 65000.00),
(3, 2, 'James', 'Brown', 70000.00),
(4, 3, 'Mary', 'Johnson', 75000.00),
(5, 4, 'Linda', 'Williams', 80000.00),
(6, 2, 'Michael', 'Jones', 85000.00),
(7, 1, 'Robert', 'Miller', 55000.00),
(8, 3, 'Patricia', 'Davis', 72000.00),
(9, 4, 'Jennifer', 'Garc?a', 77000.00),
(10, 1, 'William', 'Mart?nez', 69000.00);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'HR'),
(2, 'Sales'),
(3, 'Marketing'),
(4, 'Finance'),
(5, 'IT'),
(6, 'Operations'),
(7, 'Customer Service'),
(8, 'R&D'),
(9, 'Legal'),
(10, 'Logistics');

CREATE TABLE Sales (
    SalesID INT PRIMARY KEY,
    EmployeeID INT,
    ProductID INT,
    SalesAmount DECIMAL(10, 2),
    SaleDate DATE
);

INSERT INTO Sales (SalesID, EmployeeID, ProductID, SalesAmount, SaleDate) VALUES
(1, 1, 1, 1500.00, '2025-01-01'),
(2, 2, 2, 2000.00, '2025-01-02'),
(3, 3, 3, 1200.00, '2025-01-03'),
(4, 4, 4, 1800.00, '2025-01-04'),
(5, 5, 5, 2200.00, '2025-01-05'),
(6, 6, 6, 1400.00, '2025-01-06'),
(7, 7, 1, 2500.00, '2025-01-07'),
(8, 8, 2, 1700.00, '2025-01-08'),
(9, 9, 3, 1600.00, '2025-01-09'),
(10, 10, 4, 1900.00, '2025-01-10'),
(11, 1, 5, 2100.00, '2025-01-11'),
(12, 2, 6, 1300.00, '2025-01-12'),
(13, 3, 1, 2000.00, '2025-01-13'),
(14, 4, 2, 1800.00, '2025-01-14'),
(15, 5, 3, 1500.00, '2025-01-15'),
(16, 6, 4, 2200.00, '2025-01-16'),
(17, 7, 5, 1700.00, '2025-01-17'),
(18, 8, 6, 1600.00, '2025-01-18'),
(19, 9, 1, 2500.00, '2025-01-19'),
(20, 10, 2, 1800.00, '2025-01-20'),
(21, 1, 3, 1400.00, '2025-01-21'),
(22, 2, 4, 1900.00, '2025-01-22'),
(23, 3, 5, 2100.00, '2025-01-23'),
(24, 4, 6, 1600.00, '2025-01-24'),
(25, 5, 1, 1500.00, '2025-01-25'),
(26, 6, 2, 2000.00, '2025-01-26'),
(27, 7, 3, 2200.00, '2025-01-27'),
(28, 8, 4, 1300.00, '2025-01-28'),
(29, 9, 5, 2500.00, '2025-01-29'),
(30, 10, 6, 1800.00, '2025-01-30'),
(31, 1, 1, 2100.00, '2025-02-01'),
(32, 2, 2, 1700.00, '2025-02-02'),
(33, 3, 3, 1600.00, '2025-02-03'),
(34, 4, 4, 1900.00, '2025-02-04'),
(35, 5, 5, 2000.00, '2025-02-05'),
(36, 6, 6, 2200.00, '2025-02-06'),
(37, 7, 1, 2300.00, '2025-02-07'),
(38, 8, 2, 1750.00, '2025-02-08'),
(39, 9, 3, 1650.00, '2025-02-09'),
(40, 10, 4, 1950.00, '2025-02-10');

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    CategoryID INT,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2)
);

INSERT INTO Products (ProductID, CategoryID, ProductName, Price) VALUES
(1, 1, 'Laptop', 1000.00),
(2, 1, 'Smartphone', 800.00),
(3, 2, 'Tablet', 500.00),
(4, 2, 'Monitor', 300.00),
(5, 3, 'Headphones', 150.00),
(6, 3, 'Mouse', 25.00),
(7, 4, 'Keyboard', 50.00),
(8, 4, 'Speaker', 200.00),
(9, 5, 'Smartwatch', 250.00),
(10, 5, 'Camera', 700.00);

-- 1
WITH Numbers AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1 FROM Numbers WHERE n < 100
)
SELECT * FROM Numbers;

-- 2
WITH Doubler AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n * 2 FROM Doubler WHERE n < 1000
)
SELECT * FROM Doubler;

-- 3
SELECT e.EmployeeID, SUM(s.Amount) AS TotalSales
FROM (
    SELECT EmployeeID, Amount FROM Sales
) AS s
JOIN Employees e ON s.EmployeeID = e.EmployeeID
GROUP BY e.EmployeeID;

-- 4
WITH AvgSalary AS (
    SELECT AVG(Salary) AS AvgSal FROM Employees
)
SELECT * FROM Employees
WHERE Salary > (SELECT AvgSal FROM AvgSalary);

-- 5
SELECT ProductID, MAX(Amount) AS MaxSale
FROM (
    SELECT ProductID, Amount FROM Sales
) AS s
GROUP BY ProductID;

-- 6
WITH SalesCount AS (
    SELECT EmployeeID, COUNT(*) AS SalesMade
    FROM Sales
    GROUP BY EmployeeID
)
SELECT e.Name
FROM Employees e
JOIN SalesCount s ON e.EmployeeID = s.EmployeeID
WHERE s.SalesMade > 5;

-- 7
WITH HighSales AS (
    SELECT ProductID, SUM(Amount) AS TotalSales
    FROM Sales
    GROUP BY ProductID
)
SELECT p.*
FROM Products p
JOIN HighSales hs ON p.ProductID = hs.ProductID
WHERE hs.TotalSales > 500;

-- 8
WITH AvgSal AS (
    SELECT AVG(Salary) AS AvgSalary FROM Employees
)
SELECT * FROM Employees
WHERE Salary > (SELECT AvgSalary FROM AvgSal);

-- 9
SELECT SUM(Quantity) AS TotalSold
FROM (
    SELECT Quantity FROM Sales
) AS x;

-- 10
WITH SoldEmp AS (
    SELECT DISTINCT EmployeeID FROM Sales
)
SELECT e.Name
FROM Employees e
LEFT JOIN SoldEmp s ON e.EmployeeID = s.EmployeeID
WHERE s.EmployeeID IS NULL;

-- 11
WITH Factorial(n, fact) AS (
    SELECT 1, 1
    UNION ALL
    SELECT n + 1, fact * (n + 1)
    FROM Factorial WHERE n < 10
)
SELECT * FROM Factorial;

-- 12
WITH Fib(n, a, b) AS (
    SELECT 1, 0, 1
    UNION ALL
    SELECT n + 1, b, a + b
    FROM Fib WHERE n < 20
)
SELECT a AS Fibonacci FROM Fib;

-- 13
WITH SplitString AS (
    SELECT 1 AS pos, SUBSTRING('example', 1, 1) AS char
    UNION ALL
    SELECT pos + 1, SUBSTRING('example', pos + 1, 1)
    FROM SplitString
    WHERE pos < LEN('example')
)
SELECT * FROM SplitString;

-- 14
WITH EmpSales AS (
    SELECT EmployeeID, SUM(Amount) AS TotalSales
    FROM Sales
    GROUP BY EmployeeID
)
SELECT *, RANK() OVER (ORDER BY TotalSales DESC) AS SalesRank
FROM EmpSales;

-- 15
SELECT TOP 5 EmployeeID, COUNT(*) AS OrderCount
FROM (
    SELECT EmployeeID FROM Sales
) AS x
GROUP BY EmployeeID
ORDER BY OrderCount DESC;

-- 16
WITH SalesDiff AS (
    SELECT 
        YEAR(SaleDate) AS Y, MONTH(SaleDate) AS M,
        SUM(Amount) AS TotalSales
    FROM Sales
    GROUP BY YEAR(SaleDate), MONTH(SaleDate)
),
WithLag AS (
    SELECT *,
        LAG(TotalSales) OVER (ORDER BY Y, M) AS PrevMonthSales
    FROM SalesDiff
)
SELECT *, TotalSales - PrevMonthSales AS Diff
FROM WithLag;

-- 17
SELECT p.Category, SUM(s.Amount) AS CategorySales
FROM (
    SELECT ProductID, Amount FROM Sales
) AS s
JOIN Products p ON s.ProductID = p.ProductID
GROUP BY p.Category;

-- 18
WITH ProductTotal AS (
    SELECT ProductID, SUM(Amount) AS Total
    FROM Sales
    WHERE SaleDate >= DATEADD(YEAR, -1, GETDATE())
    GROUP BY ProductID
)
SELECT *, RANK() OVER (ORDER BY Total DESC) AS ProductRank
FROM ProductTotal;

-- 19
SELECT *
FROM (
    SELECT EmployeeID, 
           DATEPART(QUARTER, SaleDate) AS Q, 
           SUM(Amount) AS Total
    FROM Sales
    GROUP BY EmployeeID, DATEPART(QUARTER, SaleDate)
) AS x
WHERE Total > 5000;

-- 20
SELECT TOP 3 EmployeeID, SUM(Amount) AS TotalSales
FROM (
    SELECT EmployeeID, Amount
    FROM Sales
    WHERE SaleDate >= DATEADD(MONTH, -1, GETDATE())
) AS s
GROUP BY EmployeeID
ORDER BY TotalSales DESC;

-- 21
WITH Numbers AS (
    SELECT CAST('1' AS VARCHAR(MAX)) AS Seq, 1 AS n
    UNION ALL
    SELECT Seq + CAST(n + 1 AS VARCHAR), n + 1
    FROM Numbers
    WHERE n < 5
)
SELECT * FROM Numbers;

-- 22
SELECT EmployeeID
FROM (
    SELECT EmployeeID, COUNT(*) AS TotalSales
    FROM Sales
    WHERE SaleDate >= DATEADD(MONTH, -6, GETDATE())
    GROUP BY EmployeeID
) AS x
WHERE TotalSales = (
    SELECT MAX(cnt)
    FROM (
        SELECT COUNT(*) AS cnt
        FROM Sales
        WHERE SaleDate >= DATEADD(MONTH, -6, GETDATE())
        GROUP BY EmployeeID
    ) y
);

-- 23
WITH RunningTotal AS (
    SELECT 1 AS n, 1 AS total
    UNION ALL
    SELECT n + 1, 
           CASE 
             WHEN total + n + 1 > 10 THEN total
             WHEN total + n + 1 < 0 THEN 0
             ELSE total + n + 1 
           END
    FROM RunningTotal
    WHERE n < 20
)
SELECT * FROM RunningTotal;

-- 24
SELECT s.EmployeeID, s.TimeFrame, 
       ISNULL(a.Activity, 'Work') AS Status
FROM Schedule s
LEFT JOIN Activity a 
  ON s.EmployeeID = a.EmployeeID AND s.TimeFrame = a.TimeFrame;

-- 25
WITH DeptSales AS (
    SELECT e.DepartmentID, p.ProductID, SUM(s.Amount) AS TotalSales
    FROM Sales s
    JOIN Employees e ON s.EmployeeID = e.EmployeeID
    JOIN Products p ON s.ProductID = p.ProductID
    GROUP BY e.DepartmentID, p.ProductID
)
SELECT * FROM DeptSales;
