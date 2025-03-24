--1
SELECT ProductName AS Name FROM Products

--2
SELECT * FROM Customers AS Client

--3
SELECT ProductName FROM Products
UNION
SELECT ProductName FROM Products_Discontinued

--4
SELECT ProductName FROM Products
INTERSECT
SELECT ProductName FROM Products_Discontinued

--5
SELECT * FROM Products
UNION ALL
SELECT * FROM Orders

--6
SELECT DISTINCT CustomerName, Country FROM Customers

--7
SELECT ProductName, Price,
    CASE 
        WHEN Price > 100 THEN 'High'
        ELSE 'Low'
    END AS PriceCategory
FROM Products

--8
SELECT Country, Department AS EmployeeCount
FROM Employees
WHERE Department = 'Sales'
GROUP BY Country, Department

--9
SELECT CategoryID AS ProductCount
FROM Products
GROUP BY CategoryID

--10
SELECT ProductName, Stock,
    IIF(Stock > 100, 'Yes', 'No') AS InStock
FROM Products

--11
SELECT o.OrderID, c.CustomerName AS ClientName, o.OrderDate
FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID;

--12
SELECT ProductName FROM Products
UNION
SELECT ProductName FROM OutOfStock;

--13
SELECT ProductName FROM Products
EXCEPT
SELECT ProductName FROM DiscontinuedProducts;

--14
SELECT CustomerID, 
       COUNT(OrderID) AS TotalOrders, 
       CASE 
           WHEN COUNT(OrderID) > 5 THEN 'Eligible' 
           ELSE 'Not Eligible' 
       END AS EligibilityStatus
FROM Orders
GROUP BY CustomerID;

--15
SELECT ProductName, Price, 
       IIF(Price > 100, 'Expensive', 'Affordable') AS PriceCategory
FROM Products;

--16 
SELECT CustomerID, COUNT(OrderID) AS OrderCount
FROM Orders
GROUP BY CustomerID;

--17
SELECT * FROM Employees
WHERE Age < 25 OR Salary > 6000;

--18
SELECT Region, SUM(SalesAmount) AS TotalSales
FROM Sales
GROUP BY Region;

--19
SELECT c.CustomerName, o.OrderID, o.OrderDate AS PurchaseDate
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID;

--20
UPDATE Employees
SET Salary = Salary * 1.1
WHERE Department = 'HR';
