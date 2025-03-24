--1
SELECT MIN(Price) AS MinPrice
FROM Products;

--2
SELECT MAX(Salary) AS MaxSalary
FROM Employees;

--3
SELECT COUNT(*) AS TotalCustomers
FROM Customers;

--4
SELECT COUNT(DISTINCT Category) AS UniqueCategories
FROM Products;

--5
SELECT ProductName, SUM(SalesAmount) AS TotalSales
FROM Sales
WHERE ProductName = 'SomeProduct'
GROUP BY ProductName;

--6
SELECT AVG(Age) AS AverageAge
FROM Employees;

--7
SELECT Department, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY Department;

--8
SELECT Category, MIN(Price) AS MinPrice, MAX(Price) AS MaxPrice
FROM Products
GROUP BY Category;

--9
SELECT Region, SUM(SalesAmount) AS TotalSales
FROM Sales
GROUP BY Region;

--10
SELECT Department, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY Department
HAVING COUNT(*) > 5;

--11
SELECT Category, 
       SUM(SalesAmount) AS TotalSales, 
       AVG(SalesAmount) AS AverageSales
FROM Sales
GROUP BY Category;

--12
SELECT JobTitle, COUNT(JobTitle) AS EmployeeCount
FROM Employees
WHERE JobTitle = 'SomeJobTitle'  -- ”кажите конкретную должность
GROUP BY JobTitle;

--13
SELECT Department, 
       MAX(Salary) AS MaxSalary, 
       MIN(Salary) AS MinSalary
FROM Employees
GROUP BY Department;

--14
SELECT Department, AVG(Salary) AS AverageSalary
FROM Employees
GROUP BY Department;

--15
SELECT Department, 
       AVG(Salary) AS AverageSalary, 
       COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY Department;

--16
SELECT ProductName, AVG(Price) AS AveragePrice
FROM Products
GROUP BY ProductName
HAVING AVG(Price) > 100;

--17
SELECT COUNT(DISTINCT ProductID) AS HighSalesProducts
FROM Sales
WHERE SalesAmount > 100;

--18
SELECT YEAR(SaleDate) AS SalesYear, SUM(SalesAmount) AS TotalSales
FROM Sales
GROUP BY YEAR(SaleDate);

--19
SELECT Region, COUNT(DISTINCT CustomerID) AS CustomerCount
FROM Orders
GROUP BY Region;

--20
SELECT Department, SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY Department
HAVING SUM(Salary) > 100000;

--21
SELECT Category, AVG(SalesAmount) AS AverageSales
FROM Sales
GROUP BY Category
HAVING AVG(SalesAmount) > 200;

--22
SELECT EmployeeID, SUM(SalesAmount) AS TotalSales
FROM Sales
GROUP BY EmployeeID
HAVING SUM(SalesAmount) > 5000;

--23
SELECT Department, SUM(Salary) AS TotalSalary, AVG(Salary) AS AverageSalary
FROM Employees
GROUP BY Department
HAVING AVG(Salary) > 6000;

--24
SELECT CustomerID, MAX(OrderAmount) AS MaxOrder, MIN(OrderAmount) AS MinOrder
FROM Orders
GROUP BY CustomerID
HAVING MIN(OrderAmount) >= 50;

--25
SELECT Region, SUM(SalesAmount) AS TotalSales, COUNT(DISTINCT ProductID) AS UniqueProducts
FROM Sales
GROUP BY Region
HAVING COUNT(DISTINCT ProductID) > 10;

--26
SELECT ProductCategory, ProductID, MIN(OrderQuantity) AS MinOrderQty, MAX(OrderQuantity) AS MaxOrderQty
FROM Orders
GROUP BY ProductCategory, ProductID;

--27
SELECT Region, 
       SUM(CASE WHEN YEAR(SaleDate) = 2021 THEN SalesAmount ELSE 0 END) AS Sales_2021,
       SUM(CASE WHEN YEAR(SaleDate) = 2022 THEN SalesAmount ELSE 0 END) AS Sales_2022,
       SUM(CASE WHEN YEAR(SaleDate) = 2023 THEN SalesAmount ELSE 0 END) AS Sales_2023
FROM Sales
GROUP BY Region;

--28
SELECT SalesYear, Quarter, SalesAmount
FROM Sales
UNPIVOT (
    SalesAmount FOR Quarter IN (Q1, Q2, Q3, Q4)
) AS UnpivotedSales;

--29
SELECT ProductCategory, ProductID, COUNT(OrderID) AS OrderCount
FROM Orders
GROUP BY ProductCategory, ProductID
HAVING COUNT(OrderID) > 50;

--30
SELECT EmployeeID, 
       SUM(CASE WHEN Quarter = 'Q1' THEN SalesAmount ELSE 0 END) AS Q1_Sales,
       SUM(CASE WHEN Quarter = 'Q2' THEN SalesAmount ELSE 0 END) AS Q2_Sales,
       SUM(CASE WHEN Quarter = 'Q3' THEN SalesAmount ELSE 0 END) AS Q3_Sales,
       SUM(CASE WHEN Quarter = 'Q4' THEN SalesAmount ELSE 0 END) AS Q4_Sales
FROM EmployeeSales
GROUP BY EmployeeID;

