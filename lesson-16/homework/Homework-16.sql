WITH Numbers AS (
    SELECT 1 AS n
    UNION ALL SELECT n + 1 FROM Numbers WHERE n < 100
)
SELECT g.Product, 1 AS Quantity
FROM Grouped g
JOIN Numbers n ON n.n <= g.Quantity
OPTION (MAXRECURSION 0);

SELECT r.Region, d.Distributor, ISNULL(s.Sales, 0) AS Sales
FROM (SELECT DISTINCT Region FROM #RegionSales) r
CROSS JOIN (SELECT DISTINCT Distributor FROM #RegionSales) d
LEFT JOIN #RegionSales s
  ON s.Region = r.Region AND s.Distributor = d.Distributor
ORDER BY d.Distributor, r.Region;


SELECT name
FROM Employee
WHERE id IN (
  SELECT managerId
  FROM Employee
  WHERE managerId IS NOT NULL
  GROUP BY managerId
  HAVING COUNT(*) >= 5
);


SELECT p.product_name, SUM(o.unit) AS unit
FROM Products p
JOIN Orders o ON p.product_id = o.product_id
WHERE o.order_date >= '2020-02-01' AND o.order_date < '2020-03-01'
GROUP BY p.product_name
HAVING SUM(o.unit) >= 100;


SELECT CustomerID, Vendor
FROM (
    SELECT CustomerID, Vendor, COUNT(*) AS cnt,
           RANK() OVER (PARTITION BY CustomerID ORDER BY COUNT(*) DESC) AS rnk
    FROM Orders
    GROUP BY CustomerID, Vendor
) a
WHERE rnk = 1;


DECLARE @Check_Prime INT = 91;
DECLARE @i INT = 2;
DECLARE @isPrime BIT = 1;

WHILE @i <= SQRT(@Check_Prime)
BEGIN
    IF @Check_Prime % @i = 0
    BEGIN
        SET @isPrime = 0;
        BREAK;
    END
    SET @i = @i + 1;
END

IF @Check_Prime <= 1
    SET @isPrime = 0;

IF @isPrime = 1
    PRINT 'This number is prime';
ELSE
    PRINT 'This number is not prime';


SELECT Device_id,
       COUNT(DISTINCT Locations) AS no_of_location,
       (SELECT TOP 1 Locations 
        FROM Device d2 
        WHERE d1.Device_id = d2.Device_id 
        GROUP BY Locations 
        ORDER BY COUNT(*) DESC) AS max_signal_location,
       COUNT(*) AS no_of_signals
FROM Device d1
GROUP BY Device_id;


SELECT e.EmpID, e.EmpName, e.Salary
FROM Employee e
JOIN (
  SELECT DeptID, AVG(Salary) AS avg_sal
  FROM Employee
  GROUP BY DeptID
) a ON e.DeptID = a.DeptID
WHERE e.Salary > a.avg_sal;


WITH Winning(Number) AS (
  SELECT 25 UNION ALL SELECT 45 UNION ALL SELECT 78
),
MatchCount AS (
  SELECT t.[Ticket ID], COUNT(*) AS match_count
  FROM Tickets t
  JOIN Winning w ON t.Number = w.Number
  GROUP BY t.[Ticket ID]
)
SELECT SUM(CASE 
             WHEN match_count = 3 THEN 100
             WHEN match_count BETWEEN 1 AND 2 THEN 10
             ELSE 0
           END) AS Total_Winnings
FROM MatchCount;


WITH PlatformUsage AS (
  SELECT Spend_date, User_id,
         MAX(CASE WHEN Platform = 'Mobile' THEN 1 ELSE 0 END) AS used_mobile,
         MAX(CASE WHEN Platform = 'Desktop' THEN 1 ELSE 0 END) AS used_desktop,
         SUM(CASE WHEN Platform = 'Mobile' THEN Amount ELSE 0 END) AS mobile_amt,
         SUM(CASE WHEN Platform = 'Desktop' THEN Amount ELSE 0 END) AS desktop_amt
  FROM Spending
  GROUP BY Spend_date, User_id
),
Final AS (
  SELECT Spend_date,
         CASE 
           WHEN used_mobile = 1 AND used_desktop = 1 THEN 'Both'
           WHEN used_mobile = 1 THEN 'Mobile'
           WHEN used_desktop = 1 THEN 'Desktop'
         END AS Platform,
         (mobile_amt + desktop_amt) AS Amount,
         User_id
  FROM PlatformUsage
)
SELECT ROW_NUMBER() OVER (ORDER BY Spend_date, Platform) AS Row,
       Spend_date,
       Platform,
       SUM(Amount) AS Total_Amount,
       COUNT(*) AS Total_users
FROM Final
GROUP BY Spend_date, Platform
ORDER BY Spend_date, 
         CASE Platform WHEN 'Mobile' THEN 1 WHEN 'Desktop' THEN 2 WHEN 'Both' THEN 3 END;
