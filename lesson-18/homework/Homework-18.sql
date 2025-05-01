CREATE PROCEDURE GetEmployeeBonus
AS
BEGIN
    -- Create temp table
    CREATE TABLE #EmployeeBonus (
        EmployeeID INT,
        FullName NVARCHAR(100),
        Department NVARCHAR(50),
        Salary DECIMAL(10,2),
        BonusAmount DECIMAL(10,2)
    );

    -- Insert data into the temp table
    INSERT INTO #EmployeeBonus
    SELECT 
        e.EmployeeID, 
        e.FirstName + ' ' + e.LastName AS FullName,
        e.Department,
        e.Salary,
        e.Salary * d.BonusPercentage / 100 AS BonusAmount
    FROM Employees e
    INNER JOIN DepartmentBonus d ON e.Department = d.Department;

    -- Select data from the temp table
    SELECT * FROM #EmployeeBonus;

    -- Drop the temp table
    DROP TABLE #EmployeeBonus;
END;


CREATE PROCEDURE IncreaseSalaryByDepartment
    @Department NVARCHAR(50),
    @IncreasePercentage DECIMAL(5,2)
AS
BEGIN
    -- Update salaries of employees in the specified department
    UPDATE e
    SET e.Salary = e.Salary + (e.Salary * @IncreasePercentage / 100)
    FROM Employees e
    WHERE e.Department = @Department;

    -- Return updated employees from that department
    SELECT * FROM Employees WHERE Department = @Department;
END;


MERGE INTO Products_Current AS target
USING Products_New AS source
ON target.ProductID = source.ProductID
WHEN MATCHED THEN
    UPDATE SET target.ProductName = source.ProductName, target.Price = source.Price
WHEN NOT MATCHED BY TARGET THEN
    INSERT (ProductID, ProductName, Price)
    VALUES (source.ProductID, source.ProductName, source.Price)
WHEN NOT MATCHED BY SOURCE THEN
    DELETE;

-- Return the final state of Products_Current
SELECT * FROM Products_Current;


SELECT 
    t.id,
    CASE 
        WHEN t.p_id IS NULL THEN 'Root'
        WHEN NOT EXISTS (SELECT 1 FROM Tree WHERE p_id = t.id) THEN 'Leaf'
        ELSE 'Inner'
    END AS type
FROM Tree t;


SELECT 
    s.user_id,
    COALESCE(
        (SELECT COUNT(*) * 1.0 / (SELECT COUNT(*) FROM Confirmations c WHERE c.user_id = s.user_id) 
        FROM Confirmations c WHERE c.user_id = s.user_id AND c.action = 'confirmed'), 
        0
    ) AS confirmation_rate
FROM Signups s;


SELECT * 
FROM employees
WHERE salary = (SELECT MIN(salary) FROM employees);


SELECT * 
FROM employees
WHERE salary = (SELECT MIN(salary) FROM employees);
