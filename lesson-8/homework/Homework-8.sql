--1
SELECT Customers.CustomerName, Orders.OrderDate
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

--2
SELECT Employees.EmployeeID, Employees.EmployeeName, EmployeeDetails.Address, EmployeeDetails.Phone
FROM Employees
INNER JOIN EmployeeDetails ON Employees.EmployeeID = EmployeeDetails.EmployeeID;

--3
SELECT Products.ProductName, Categories.CategoryName
FROM Products
INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID;

--4
SELECT Customers.CustomerName, Orders.OrderDate
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

--5
SELECT Orders.OrderID, Products.ProductName, OrderDetails.Quantity
FROM Orders
INNER JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
INNER JOIN Products ON OrderDetails.ProductID = Products.ProductID;

--6
SELECT Products.ProductName, Categories.CategoryName
FROM Products
CROSS JOIN Categories;

--7
SELECT Customers.CustomerName, Orders.OrderID, Orders.OrderDate
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

--8
SELECT Products.ProductName, Orders.OrderID, Orders.OrderAmount
FROM Products
CROSS JOIN Orders
WHERE Orders.OrderAmount > 500;

--9
SELECT Employees.EmployeeName, Departments.DepartmentName
FROM Employees
INNER JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;

--10
SELECT A.Column1, B.Column2
FROM TableA A
INNER JOIN TableB B ON A.ColumnX <> B.ColumnY;

--11
SELECT Customers.CustomerName, COUNT(Orders.OrderID) AS TotalOrders
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerName;

--12
SELECT Students.StudentName, Courses.CourseName
FROM Students
INNER JOIN StudentCourses ON Students.StudentID = StudentCourses.StudentID
INNER JOIN Courses ON StudentCourses.CourseID = Courses.CourseID;

--13
SELECT Employees.EmployeeName, Departments.DepartmentName
FROM Employees
CROSS JOIN Departments
WHERE Employees.Salary > 5000;

--14
SELECT Employee.EmployeeName, EmployeeDetails.Address, EmployeeDetails.Phone
FROM Employee
INNER JOIN EmployeeDetails ON Employee.EmployeeID = EmployeeDetails.EmployeeID;

--15
SELECT Products.ProductName, Suppliers.SupplierName
FROM Products
INNER JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE Suppliers.SupplierName = 'Supplier A';

--16
SELECT Products.ProductName, COALESCE(Sales.Quantity, 0) AS SalesQuantity
FROM Products
LEFT JOIN Sales ON Products.ProductID = Sales.ProductID;

--17
SELECT Employees.EmployeeName, Departments.DepartmentName, Employees.Salary
FROM Employees
INNER JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID
WHERE Employees.Salary > 4000 AND Departments.DepartmentName = 'HR';

--18
SELECT A.Column1, B.Column2
FROM TableA A
INNER JOIN TableB B ON A.Value >= B.Value;

--19
SELECT Products.ProductName, Suppliers.SupplierName, Products.Price
FROM Products
INNER JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE Products.Price >= 50;

--20
SELECT Sales.SaleAmount, Regions.RegionName
FROM Sales
CROSS JOIN Regions
WHERE Sales.SaleAmount > 1000;
