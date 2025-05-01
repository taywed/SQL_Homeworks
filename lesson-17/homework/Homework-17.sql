CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    Quantity INT,
    SaleDate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Products (ProductID, ProductName, Category, Price)
VALUES
(1, 'Samsung Galaxy S23', 'Electronics', 899.99),
(2, 'Apple iPhone 14', 'Electronics', 999.99),
(3, 'Sony WH-1000XM5 Headphones', 'Electronics', 349.99),
(4, 'Dell XPS 13 Laptop', 'Electronics', 1249.99),
(5, 'Organic Eggs (12 pack)', 'Groceries', 3.49),
(6, 'Whole Milk (1 gallon)', 'Groceries', 2.99),
(7, 'Alpen Cereal (500g)', 'Groceries', 4.75),
(8, 'Extra Virgin Olive Oil (1L)', 'Groceries', 8.99),
(9, 'Mens Cotton T-Shirt', 'Clothing', 12.99),
(10, 'Womens Jeans - Blue', 'Clothing', 39.99),
(11, 'Unisex Hoodie - Grey', 'Clothing', 29.99),
(12, 'Running Shoes - Black', 'Clothing', 59.95),
(13, 'Ceramic Dinner Plate Set (6 pcs)', 'Home & Kitchen', 24.99),
(14, 'Electric Kettle - 1.7L', 'Home & Kitchen', 34.90),
(15, 'Non-stick Frying Pan - 28cm', 'Home & Kitchen', 18.50),
(16, 'Atomic Habits - James Clear', 'Books', 15.20),
(17, 'Deep Work - Cal Newport', 'Books', 14.35),
(18, 'Rich Dad Poor Dad - Robert Kiyosaki', 'Books', 11.99),
(19, 'LEGO City Police Set', 'Toys', 49.99),
(20, 'Rubiks Cube 3x3', 'Toys', 7.99);

INSERT INTO Sales (SaleID, ProductID, Quantity, SaleDate)
VALUES
(1, 1, 2, '2025-04-01'),
(2, 1, 1, '2025-04-05'),
(3, 2, 1, '2025-04-10'),
(4, 2, 2, '2025-04-15'),
(5, 3, 3, '2025-04-18'),
(6, 3, 1, '2025-04-20'),
(7, 4, 2, '2025-04-21'),
(8, 5, 10, '2025-04-22'),
(9, 6, 5, '2025-04-01'),
(10, 6, 3, '2025-04-11'),
(11, 10, 2, '2025-04-08'),
(12, 12, 1, '2025-04-12'),
(13, 12, 3, '2025-04-14'),
(14, 19, 2, '2025-04-05'),
(15, 20, 4, '2025-04-19'),
(16, 1, 1, '2025-03-15'),
(17, 2, 1, '2025-03-10'),
(18, 5, 5, '2025-02-20'),
(19, 6, 6, '2025-01-18'),
(20, 10, 1, '2024-12-25'),
(21, 1, 1, '2024-04-20');

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT FOREIGN KEY REFERENCES Customers(customer_id),
    order_date DATE,
    amount DECIMAL(10,2)
);

-- Customers
INSERT INTO Customers (customer_id, name, city)
VALUES
(1, 'Alice Smith', 'New York'),
(2, 'Bob Jones', 'Chicago'),
(3, 'Carol White', 'Los Angeles');

-- Orders
INSERT INTO Orders (order_id, customer_id, order_date, amount)
VALUES
(101, 1, '2024-12-10', 120.00),
(102, 1, '2024-12-20', 200.00),
(103, 1, '2024-12-30', 220.00),
(104, 2, '2025-01-12', 120.00),
(105, 2, '2025-01-20', 180.00);
DROP TABLE IF EXISTS Gaps;

CREATE TABLE Gaps
(
RowNumber   INTEGER PRIMARY KEY,
TestCase    VARCHAR(100) NULL
);

INSERT INTO Gaps (RowNumber, TestCase) VALUES
(1,'Alpha'),(2,NULL),(3,NULL),(4,NULL),
(5,'Bravo'),(6,NULL),(7,'Charlie'),(8,NULL),(9,NULL);

-- Create the temporary table MonthlySales
SELECT ProductID,
       SUM(Quantity) AS TotalQuantity,
       SUM(Quantity * Price) AS TotalRevenue
INTO #MonthlySales
FROM Sales
WHERE MONTH(SaleDate) = MONTH(GETDATE()) AND YEAR(SaleDate) = YEAR(GETDATE())
GROUP BY ProductID;

-- Return the result from the temporary table
SELECT ProductID, TotalQuantity, TotalRevenue
FROM #MonthlySales;


CREATE VIEW vw_ProductSalesSummary AS
SELECT p.ProductID, 
       p.ProductName, 
       p.Category, 
       SUM(s.Quantity) AS TotalQuantitySold
FROM Products p
JOIN Sales s ON p.ProductID = s.ProductID
GROUP BY p.ProductID, p.ProductName, p.Category;


CREATE FUNCTION fn_GetTotalRevenueForProduct(@ProductID INT)
RETURNS DECIMAL(18, 2)
AS
BEGIN
    DECLARE @TotalRevenue DECIMAL(18, 2);

    SELECT @TotalRevenue = SUM(Quantity * Price)
    FROM Sales
    WHERE ProductID = @ProductID;

    RETURN @TotalRevenue;
END;


CREATE FUNCTION fn_GetSalesByCategory(@Category VARCHAR(50))
RETURNS TABLE
AS
RETURN
(
    SELECT p.ProductName, 
           SUM(s.Quantity) AS TotalQuantity, 
           SUM(s.Quantity * s.Price) AS TotalRevenue
    FROM Products p
    JOIN Sales s ON p.ProductID = s.ProductID
    WHERE p.Category = @Category
    GROUP BY p.ProductName
);

CREATE FUNCTION dbo.fn_IsPrime (@Number INT)
RETURNS VARCHAR(3)
AS
BEGIN
    DECLARE @Result VARCHAR(3);
    IF @Number <= 1
        SET @Result = 'No';
    ELSE
    BEGIN
        DECLARE @i INT = 2;
        SET @Result = 'Yes';
        WHILE @i <= SQRT(@Number)
        BEGIN
            IF @Number % @i = 0
            BEGIN
                SET @Result = 'No';
                BREAK;
            END
            SET @i = @i + 1;
        END
    END
    RETURN @Result;
END;


CREATE FUNCTION fn_GetNumbersBetween (@Start INT, @End INT)
RETURNS TABLE
AS
RETURN
(
    WITH Numbers AS (
        SELECT @Start AS Number
        UNION ALL
        SELECT Number + 1 FROM Numbers WHERE Number + 1 <= @End
    )
    SELECT Number FROM Numbers
    OPTION (MAXRECURSION 0);
);


WITH RankedSalaries AS (
    SELECT DISTINCT salary,
           DENSE_RANK() OVER (ORDER BY salary DESC) AS rank
    FROM Employee
)
SELECT salary AS getNthHighestSalary
FROM RankedSalaries
WHERE rank = @N;


SELECT id, COUNT(*) AS num
FROM (
    SELECT requester_id AS id FROM RequestAccepted
    UNION ALL
    SELECT accepter_id AS id FROM RequestAccepted
) AS AllUsers
GROUP BY id
ORDER BY num DESC
LIMIT 1;


CREATE VIEW vw_CustomerOrderSummary AS
SELECT c.customer_id, 
       c.name, 
       COUNT(o.order_id) AS total_orders,
       SUM(o.amount) AS total_amount,
       MAX(o.order_date) AS last_order_date
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;


WITH WorkflowAssignments AS (
    SELECT RowNumber, 
           COALESCE(Workflow, LAG(Workflow) OVER (ORDER BY RowNumber)) AS Workflow, 
           Status
    FROM Gaps
)
SELECT RowNumber, 
       Workflow, 
       Status
FROM WorkflowAssignments
ORDER BY RowNumber;
