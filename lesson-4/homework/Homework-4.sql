--1
SELECT TOP 5 * FROM Employees;

--2
SELECT DISTINCT ProductName FROM Products;

--3
SELECT * FROM Products
WHERE Price > 100;

--4
SELECT CustomerName FROM Customers
WHERE CustomerName LIKE 'A%';

--5
SELECT * FROM Products
ORDER BY Price ASC;

--6
SELECT * FROM Employees
WHERE Salary >= 5000 AND Department = 'HR';

--7
SELECT EmployeeID, EmployeeName, ISNULL(Email, 'noemail@example.com') AS Email
FROM Employees;

--8
SELECT * FROM Products
WHERE Price BETWEEN 50 AND 100;

--9
SELECT DISTINCT Category, ProductName
FROM Products;

--10
SELECT * FROM Products
ORDER BY ProductName DESC;

--11
SELECT TOP 10 * FROM Products
ORDER BY Price DESC;

--12
SELECT EmployeeID, COALESCE(FirstName, LastName) AS EmployeeName
FROM Employees;

--13
SELECT DISTINCT Category, Price
FROM Products;

--14
SELECT * FROM Employees
WHERE (Age BETWEEN 30 AND 40) OR Department = 'Marketing';

--15
SELECT * FROM Employees
ORDER BY Salary DESC
OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY;

--16?
SELECT * FROM Products
WHERE Price <= 1000 AND Stock > 50
ORDER BY Stock ASC;

--17
SELECT * FROM Products
WHERE ProductName LIKE '%e%';

--18
SELECT * FROM Employees
WHERE Department IN ('HR', 'IT', 'Finance');

--19
SELECT * FROM Employees
WHERE Salary > ANY (SELECT AVG(Salary) FROM Employees);

--20
SELECT * FROM Customers
ORDER BY City ASC, PostalCode DESC;

--21
SELECT TOP (10) * 
FROM Products 
ORDER BY SalesAmount DESC;

--22
SELECT EmployeeID, COALESCE(FirstName + ' ' + LastName, FirstName, LastName) AS FullName
FROM Employees;

--23
SELECT DISTINCT Category, ProductName, Price
FROM Products
WHERE Price > 50;

--24
SELECT * FROM Products
WHERE Price BETWEEN (SELECT AVG(Price) * 0.9 FROM Products) 
                 AND (SELECT AVG(Price) * 1.1 FROM Products);

--25
SELECT * FROM Employees
WHERE Age < 30 AND Department IN ('HR', 'IT');

--26
SELECT * FROM Customers
WHERE Email LIKE '%@gmail.com%';

--27
SELECT * FROM Employees
WHERE Salary > ALL (SELECT Salary FROM Employees WHERE Department = 'Sales');

--28
SELECT * FROM Employees
ORDER BY Salary DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY; 

--29
SELECT * FROM Orders
WHERE OrderDate BETWEEN DATEADD(DAY, -30, CURRENT_DATE) AND CURRENT_DATE;

--30
SELECT * FROM Employees e
WHERE Salary > ANY (SELECT AVG(Salary) FROM Employees e2 WHERE e.Department = e2.Department);

