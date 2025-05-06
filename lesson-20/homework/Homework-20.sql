CREATE TABLE #Sales (
    SaleID INT PRIMARY KEY IDENTITY(1,1),
    CustomerName VARCHAR(100),
    Product VARCHAR(100),
    Quantity INT,
    Price DECIMAL(10,2),
    SaleDate DATE
);


INSERT INTO #Sales (CustomerName, Product, Quantity, Price, SaleDate) VALUES
('Alice', 'Laptop', 1, 1200.00, '2024-01-15'),
('Bob', 'Smartphone', 2, 800.00, '2024-02-10'),
('Charlie', 'Tablet', 1, 500.00, '2024-02-20'),
('David', 'Laptop', 1, 1300.00, '2024-03-05'),
('Eve', 'Smartphone', 3, 750.00, '2024-03-12'),
('Frank', 'Headphones', 2, 100.00, '2024-04-08'),
('Grace', 'Smartwatch', 1, 300.00, '2024-04-25'),
('Hannah', 'Tablet', 2, 480.00, '2024-05-05'),
('Isaac', 'Laptop', 1, 1250.00, '2024-05-15'),
('Jack', 'Smartphone', 1, 820.00, '2024-06-01');

SELECT DISTINCT s.CustomerName
FROM #Sales s
WHERE EXISTS (
    SELECT 1
    FROM #Sales t
    WHERE t.CustomerName = s.CustomerName
      AND MONTH(t.SaleDate) = 3
      AND YEAR(t.SaleDate) = 2024
);


SELECT Product
FROM (
    SELECT Product, SUM(Quantity * Price) AS TotalRevenue
    FROM #Sales
    GROUP BY Product
) AS Revenue
WHERE TotalRevenue = (
    SELECT MAX(SUM(Quantity * Price))
    FROM #Sales
    GROUP BY Product
);


SELECT MAX(Quantity * Price) AS SecondHighestSale
FROM #Sales
WHERE (Quantity * Price) < (
    SELECT MAX(Quantity * Price)
    FROM #Sales
);


SELECT 
    FORMAT(SaleDate, 'yyyy-MM') AS SaleMonth,
    (SELECT SUM(s2.Quantity)
     FROM #Sales s2
     WHERE FORMAT(s2.SaleDate, 'yyyy-MM') = FORMAT(s1.SaleDate, 'yyyy-MM')
    ) AS TotalQuantity
FROM #Sales s1
GROUP BY FORMAT(SaleDate, 'yyyy-MM');


SELECT DISTINCT s1.CustomerName
FROM #Sales s1
WHERE EXISTS (
    SELECT 1
    FROM #Sales s2
    WHERE s1.CustomerName <> s2.CustomerName
      AND s1.Product = s2.Product
);


CREATE TABLE #FruitBasket (
    Person VARCHAR(50),
    Fruit VARCHAR(50)
);

INSERT INTO #FruitBasket VALUES
('Alice', 'Apple'),
('Alice', 'Banana'),
('Bob', 'Apple'),
('Bob', 'Orange'),
('Alice', 'Apple'),
('Charlie', 'Banana'),
('Charlie', 'Banana');


SELECT Person, Fruit, COUNT(*) AS Quantity
FROM #FruitBasket
GROUP BY Person, Fruit;


SELECT 
    Name,
    COUNT(CASE WHEN Fruit = 'Apple' THEN 1 END) AS Apple,
    COUNT(CASE WHEN Fruit = 'Orange' THEN 1 END) AS Orange,
    COUNT(CASE WHEN Fruit = 'Banana' THEN 1 END) AS Banana
FROM Fruits
GROUP BY Name;


WITH Ancestors AS (
    SELECT ParentId, ChildID
    FROM Family
    UNION ALL
    SELECT f.ParentId, a.ChildID
    FROM Family f
    JOIN Ancestors a ON f.ChildID = a.ParentId
)
SELECT DISTINCT ParentId AS PID, ChildID AS CHID
FROM Ancestors
ORDER BY PID, CHID;


SELECT o.*
FROM #Orders o
WHERE o.DeliveryState = 'TX'
  AND EXISTS (
      SELECT 1
      FROM #Orders ca
      WHERE ca.CustomerID = o.CustomerID
        AND ca.DeliveryState = 'CA'
  );



  create table #residents(resid int identity, fullname varchar(50), address varchar(100))

insert into #residents values 
('Dragan', 'city=Bratislava country=Slovakia name=Dragan age=45'),
('Diogo', 'city=Lisboa country=Portugal age=26'),
('Celine', 'city=Marseille country=France name=Celine age=21'),
('Theo', 'city=Milan country=Italy age=28'),
('Rajabboy', 'city=Tashkent country=Uzbekistan age=22');

UPDATE #residents
SET address = CONCAT(address, ' name=', fullname)
WHERE CHARINDEX('name=', address) = 0;

CREATE TABLE #Routes
(
RouteID        INTEGER NOT NULL,
DepartureCity  VARCHAR(30) NOT NULL,
ArrivalCity    VARCHAR(30) NOT NULL,
Cost           MONEY NOT NULL,
PRIMARY KEY (DepartureCity, ArrivalCity)
);

INSERT INTO #Routes (RouteID, DepartureCity, ArrivalCity, Cost) VALUES
(1,'Tashkent','Samarkand',100),
(2,'Samarkand','Bukhoro',200),
(3,'Bukhoro','Khorezm',300),
(4,'Samarkand','Khorezm',400),
(5,'Tashkent','Jizzakh',100),
(6,'Jizzakh','Samarkand',50);


SELECT 
    'Tashkent - Samarkand - Khorezm' AS Route,
    r1.Cost + r2.Cost AS Cost
FROM #Routes r1
JOIN #Routes r2 ON r1.ArrivalCity = r2.DepartureCity
WHERE r1.DepartureCity = 'Tashkent' AND r2.ArrivalCity = 'Khorezm'

UNION ALL

SELECT 
    'Tashkent - Jizzakh - Samarkand - Bukhoro - Khorezm' AS Route,
    r1.Cost + r2.Cost + r3.Cost + r4.Cost AS Cost
FROM #Routes r1
JOIN #Routes r2 ON r1.ArrivalCity = r2.DepartureCity
JOIN #Routes r3 ON r2.ArrivalCity = r3.DepartureCity
JOIN #Routes r4 ON r3.ArrivalCity = r4.DepartureCity
WHERE r1.DepartureCity = 'Tashkent' AND r4.ArrivalCity = 'Khorezm';


CREATE TABLE #RankingPuzzle
(
     ID INT
    ,Vals VARCHAR(10)
)

 
INSERT INTO #RankingPuzzle VALUES
(1,'Product'),
(2,'a'),
(3,'a'),
(4,'a'),
(5,'a'),
(6,'Product'),
(7,'b'),
(8,'b'),
(9,'Product'),
(10,'c')

SELECT 
    ID,
    Vals,
    ROW_NUMBER() OVER (ORDER BY ID) AS Rank
FROM #RankingPuzzle
ORDER BY Rank;


CREATE TABLE #EmployeeSales (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeName VARCHAR(100),
    Department VARCHAR(50),
    SalesAmount DECIMAL(10,2),
    SalesMonth INT,
    SalesYear INT
);

INSERT INTO #EmployeeSales (EmployeeName, Department, SalesAmount, SalesMonth, SalesYear) VALUES
('Alice', 'Electronics', 5000, 1, 2024),
('Bob', 'Electronics', 7000, 1, 2024),
('Charlie', 'Furniture', 3000, 1, 2024),
('David', 'Furniture', 4500, 1, 2024),
('Eve', 'Clothing', 6000, 1, 2024),
('Frank', 'Electronics', 8000, 2, 2024),
('Grace', 'Furniture', 3200, 2, 2024),
('Hannah', 'Clothing', 7200, 2, 2024),
('Isaac', 'Electronics', 9100, 3, 2024),
('Jack', 'Furniture', 5300, 3, 2024),
('Kevin', 'Clothing', 6800, 3, 2024),
('Laura', 'Electronics', 6500, 4, 2024),
('Mia', 'Furniture', 4000, 4, 2024),
('Nathan', 'Clothing', 7800, 4, 2024);

SELECT 
    EmployeeID,
    EmployeeName,
    Department,
    SalesAmount,
    SalesMonth,
    SalesYear
FROM #EmployeeSales E
WHERE SalesAmount > (
    SELECT AVG(SalesAmount)
    FROM #EmployeeSales
    WHERE Department = E.Department
)
ORDER BY Department, SalesAmount DESC;


CREATE TABLE Products (
    ProductID   INT PRIMARY KEY,
    Name        VARCHAR(50),
    Category    VARCHAR(50),
    Price       DECIMAL(10,2),
    Stock       INT
);

INSERT INTO Products (ProductID, Name, Category, Price, Stock) VALUES
(1, 'Laptop', 'Electronics', 1200.00, 15),
(2, 'Smartphone', 'Electronics', 800.00, 30),
(3, 'Tablet', 'Electronics', 500.00, 25),
(4, 'Headphones', 'Accessories', 150.00, 50),
(5, 'Keyboard', 'Accessories', 100.00, 40),
(6, 'Monitor', 'Electronics', 300.00, 20),
(7, 'Mouse', 'Accessories', 50.00, 60),
(8, 'Chair', 'Furniture', 200.00, 10),
(9, 'Desk', 'Furniture', 400.00, 5),
(10, 'Printer', 'Office Supplies', 250.00, 12),
(11, 'Scanner', 'Office Supplies', 180.00, 8),
(12, 'Notebook', 'Stationery', 10.00, 100),
(13, 'Pen', 'Stationery', 2.00, 500),
(14, 'Backpack', 'Accessories', 80.00, 30),
(15, 'Lamp', 'Furniture', 60.00, 25);

SELECT E.EmployeeID, E.EmployeeName, E.Department
FROM #EmployeeSales E
WHERE NOT EXISTS (
    SELECT 1
    FROM (SELECT DISTINCT SalesMonth, SalesYear FROM #EmployeeSales) AS Months
    WHERE NOT EXISTS (
        SELECT 1
        FROM #EmployeeSales E2
        WHERE E2.EmployeeID = E.EmployeeID
        AND E2.SalesMonth = Months.SalesMonth
        AND E2.SalesYear = Months.SalesYear
    )
);

SELECT Name
FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products);


SELECT Name
FROM Products
WHERE Stock < (SELECT MAX(Stock) FROM Products);


SELECT Name
FROM Products
WHERE Category = (SELECT Category FROM Products WHERE Name = 'Laptop');


SELECT Name
FROM Products
WHERE Price > (SELECT MIN(Price) FROM Products WHERE Category = 'Electronics');

CREATE TABLE Orders (
    OrderID    INT PRIMARY KEY,
    ProductID  INT,
    Quantity   INT,
    OrderDate  DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Orders (OrderID, ProductID, Quantity, OrderDate) VALUES
(1, 1, 2, '2024-03-01'),
(2, 3, 5, '2024-03-05'),
(3, 2, 3, '2024-03-07'),
(4, 5, 4, '2024-03-10'),
(5, 8, 1, '2024-03-12'),
(6, 10, 2, '2024-03-15'),
(7, 12, 10, '2024-03-18'),
(8, 7, 6, '2024-03-20'),
(9, 6, 2, '2024-03-22'),
(10, 4, 3, '2024-03-25'),
(11, 9, 2, '2024-03-28'),
(12, 11, 1, '2024-03-30'),
(13, 14, 4, '2024-04-02'),
(14, 15, 5, '2024-04-05'),
(15, 13, 20, '2024-04-08');

SELECT p.Name
FROM Products p
WHERE p.Price > (
    SELECT AVG(p2.Price)
    FROM Products p2
    WHERE p2.Category = p.Category
);


SELECT DISTINCT p.Name
FROM Products p
JOIN Orders o ON p.ProductID = o.ProductID;


SELECT p.Name
FROM Products p
JOIN Orders o ON p.ProductID = o.ProductID
GROUP BY p.Name
HAVING SUM(o.Quantity) > (
    SELECT AVG(SUM(o2.Quantity))
    FROM Orders o2
    GROUP BY o2.ProductID
);


SELECT p.Name
FROM Products p
LEFT JOIN Orders o ON p.ProductID = o.ProductID
WHERE o.ProductID IS NULL;
	

	SELECT TOP 1 p.Name
FROM Products p
JOIN Orders o ON p.ProductID = o.ProductID
GROUP BY p.Name
ORDER BY SUM(o.Quantity) DESC;

