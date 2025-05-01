CREATE TABLE Employee (
    Id INT,
    Name VARCHAR(50),
    Salary INT,
    ManagerId INT
);

INSERT INTO Employee (Id, Name, Salary, ManagerId) VALUES
(1, 'Joe', 70000, 3),
(2, 'Henry', 80000, 4),
(3, 'Sam', 60000, NULL),
(4, 'Max', 90000, NULL);

CREATE TABLE weather (
    Id INT,
    RecordDate DATE,
    Temperature INT
);

INSERT INTO weather (Id, RecordDate, Temperature) VALUES
(1, '2015-01-01', 10),
(2, '2015-01-02', 25),
(3, '2015-01-03', 20),
(4, '2015-01-04', 30);

CREATE TABLE Activity (
    player_id INT,
    device_id INT,
    event_date DATE,
    games_played INT
);

INSERT INTO Activity (player_id, device_id, event_date, games_played) VALUES
(1, 2, '2016-03-01', 5),
(1, 2, '2016-05-02', 6),
(2, 3, '2017-06-25', 1),
(3, 1, '2016-03-02', 0),
(3, 4, '2018-07-03', 5);

CREATE TABLE MultipleVals 
(
     Id INT
    ,[Vals] VARCHAR(100)
)

 
 
Insert Into MultipleVals values
 (1,'a,b,c')
,(2,'x,y,z')


CREATE TABLE fruits (
    fruit_list VARCHAR(100)
);

INSERT INTO fruits (fruit_list)
VALUES ('apple,banana,orange,grape');

CREATE TABLE RemoveLastComma
(
     Id INT
    ,Val VARCHAR(100)
)

 
INSERT INTO RemoveLastComma VALUES
(1,'Pawan'),
(2,'Pawan,Avtaar,'),
(3,','),
(4,'Hello,'),
(5,'a,a,b,c,'),
(6,NULL),
(7,'')

CREATE TABLE FindSameCharacters
(
     Id INT
    ,Vals VARCHAR(10)
)
 
INSERT INTO FindSameCharacters VALUES
(1,'aa'),
(2,'cccc'),
(3,'abc'),
(4,'aabc'),
(5,NULL),
(6,'a'),
(7,'zzz'),
(8,'abc')


CREATE TABLE Splitter
(
     Id INT
    ,Vals VARCHAR(100)
)
 
INSERT INTO Splitter VALUES
(1,'P.K'),
(2,'a.b'),
(3,'c.d'),
(4,'e.J'),
(5,'t.u.b')


CREATE TABLE testDots
(
     ID INT
    ,Vals VARCHAR(100)
)
 
INSERT INTO testDots VALUES
(1,'0.0'),
(2,'2.3.1.1'),
(3,'4.1.a.3.9'),
(4,'1.1.'),
(5,'a.b.b.b.b.b..b..b'),
(6,'6.')

CREATE TABLE GetIntegers
(
     Id INT
    ,VALS VARCHAR(100)
)
 
INSERT INTO GetIntegers VALUES
 (1,'P1')
,(2,'1 - Hero')
,(3,'2 - Ramesh')
,(4,'3 - KrishnaKANT')
,(5,'21 - Avtaar')
,(6,'5Laila')
,(7,'6  MMT')
,(8,'7#7#')
,(9,'#')
,(10,'8')
,(11,'98')
,(12,'111')
,(13,NULL)

CREATE TABLE RemoveDuplicateIntsFromNames
(
      PawanName INT
    , Pawan_slug_name VARCHAR(1000)
)
 
 
INSERT INTO RemoveDuplicateIntsFromNames VALUES
(1,  'PawanA-111'  ),
(2, 'PawanB-123'   ),
(3, 'PawanB-32'    ),
(4, 'PawanC-4444' ),
(5, 'PawanD-3'  )

CREATE TABLE TestPercent
(
    Strs VARCHAR(100)
)
 
INSERT INTO TestPercent
SELECT 'Pawan'
UNION ALL
SELECT 'Pawan%'
UNION ALL
SELECT 'Pawan%Kumar'
UNION ALL
SELECT '%'

CREATE TABLE [dbo].[TestMultipleColumns]
(
[Id] [int] NULL,
[Name] [varchar](20) NULL
)
 
INSERT INTO [TestMultipleColumns] VALUES
(1,    'Pawan,Kumar'),
(2,    'Sandeep,Goyal'),
(3,    'Isha,Mattoo'),
(4,    'Gopal,Ranjan'),
(5,    'Neeraj,Garg'),
(6,    'Deepak,Sharma'),
(7,    ' Mayank,Tripathi')
 

CREATE TABLE CountSpaces
(
texts VARCHAR(100)
)

 
INSERT INTO CountSpaces VALUES
('P Q R S '),
(' L M N O 0 0     '),
('I  am here only '),
(' Welcome to the new world '),
(' Hello world program'),
(' Are u nuts ')

create table p1 (id int, code int)
create table p2 (id int, code int)
insert into p1 select 1,0
insert into p1 select 2,1
insert into p2 select 1,5
insert into p2 select 2,5

CREATE TABLE WeekPercentagePuzzle
(
      Area INT
    , [Date] DATE
    , SalesLocal INT
    , SalesRemote INT
    , [DayName] VARCHAR(4)
    , [DayOfWeek] SMALLINT
    , FinancialWeek TINYINT
    , [MonthName] VARCHAR(15)
    , FinancialYear INT
)

 
INSERT INTO WeekPercentagePuzzle VALUES
(1,'2015-04-01',0,50,'Wed',4,1,'April',2015),
(2,'2015-04-01',null,null,'Wed',4,1,'April',2015),
(3,'2015-04-01',100,0,'Wed',4,1,'April',2015),
(3,'2015-04-01',50,100,'Wed',4,1,'April',2015),
(3,'2015-04-04',50,50,'Sat',7,1,'April',2015);


CREATE TABLE SeperateNumbersAndCharcters
(
    Value VARCHAR(100)
)

 
INSERT INTO SeperateNumbersAndCharcters
VALUES
('dskfsda1224'),
('123'),
('ABC'),
('23874283bsdjfhsjadkhfas09')

-- 1
SELECT 
    LEFT(Name, CHARINDEX(',', Name) - 1) AS Name,
    RIGHT(Name, LEN(Name) - CHARINDEX(',', Name)) AS Surname
FROM TestMultipleColumns;

-- 2
SELECT *
FROM TestPercent
WHERE ColumnName LIKE '%[%]%';

-- 3
SELECT 
    value 
FROM STRING_SPLIT((SELECT columnname FROM Splitter), '.');

-- 4
SELECT 
    columnname,
    TRANSLATE(columnname, '0123456789', 'XXXXXXXXXX') AS MaskedString
FROM (SELECT '1234ABC123456XYZ1234567890ADS' AS columnname) AS x;

-- 5
SELECT *
FROM testDots
WHERE LEN(Vals) - LEN(REPLACE(Vals, '.', '')) > 2;

-- 6
SELECT 
    columnname,
    (LEN(columnname) - LEN(REPLACE(columnname, 'substring', ''))) / LEN('substring') AS Occurrences
FROM Not;

-- 7
SELECT 
    columnname,
    LEN(columnname) - LEN(REPLACE(columnname, ' ', '')) AS SpaceCount
FROM CountSpaces;

-- 8
SELECT e1.*
FROM Employee e1
JOIN Employee e2 ON e1.ManagerId = e2.Id
WHERE e1.Salary > e2.Salary;

-- 9
SELECT
    col,
    LEFT(col, PATINDEX('%[^0-9]%', col + 'A') - 1) AS Numbers,
    SUBSTRING(col, PATINDEX('%[^0-9]%', col + 'A'), LEN(col)) AS Characters
FROM SeperateNumbersAndCharcters;

-- 10
SELECT w1.Id
FROM weather w1
JOIN weather w2 ON DATEDIFF(DAY, w2.recordDate, w1.recordDate) = 1
WHERE w1.temperature > w2.temperature;

-- 11
SELECT player_id, device_id
FROM Activity A1
WHERE login_date = (
    SELECT MIN(login_date)
    FROM Activity A2
    WHERE A2.player_id = A1.player_id
);

-- 12
SELECT player_id, MIN(login_date) AS first_login
FROM Activity
GROUP BY player_id;

-- 13
SELECT
    value AS third_item
FROM (
    SELECT value, ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS rn
    FROM STRING_SPLIT('apple,banana,cherry,dates', ',')
) x
WHERE rn = 3;

-- 14
SELECT 
    SUBSTRING(columnname, Number, 1) AS Character
FROM master.dbo.spt_values
CROSS JOIN (SELECT 'sdgfhsdgfhs@121313131' AS columnname) AS str
WHERE type = 'P' AND Number BETWEEN 1 AND LEN(columnname);

-- 15
SELECT 
    p1.id,
    ISNULL(NULLIF(p1.code, 0), p2.code) AS code
FROM p1
JOIN p2 ON p1.id = p2.id;

-- 16
WITH WeekSums AS (
    SELECT Week, SUM(Sales) AS TotalSales
    FROM WeekPercentagePuzzle
    GROUP BY Week
)
SELECT w.Area, w.Week, w.Day, 
       CAST(w.Sales * 100.0 / s.TotalSales AS DECIMAL(5,2)) AS Percentage
FROM WeekPercentagePuzzle w
JOIN WeekSums s ON w.Week = s.Week;

-- 17
SELECT
    value AS Original,
    STUFF(value, 1, 2, RIGHT(LEFT(value, CHARINDEX(',', value + ',') - 1), 1) 
          + LEFT(LEFT(value, CHARINDEX(',', value + ',') - 1), 1)) AS Swapped
FROM MultipleVals;

-- 18
SELECT *
FROM FindSameCharacters
WHERE LEN(columnname) > 1 
  AND LEN(REPLACE(columnname, LEFT(columnname, 1), '')) = 0;

-- 19
WITH Digits AS (
    SELECT columnname,
           TRIM(value) AS number
    FROM RemoveDuplicateIntsFromNames
    CROSS APPLY STRING_SPLIT(columnname, ' ')
)
SELECT DISTINCT columnname, 
       STRING_AGG(DISTINCT TRY_CAST(number AS INT), ' ') AS Cleaned
FROM Digits
WHERE LEN(number) > 1
GROUP BY columnname;

-- 20 
SELECT *
FROM FindSameCharacters
WHERE LEN(columnname) > 1 
  AND LEN(REPLACE(columnname, LEFT(columnname, 1), '')) = 0;

-- 21
SELECT Vals,
       LEFT(Vals, PATINDEX('%[^0-9]%', Vals + 'X') - 1) AS StartingInteger
FROM GetIntegers
WHERE Vals LIKE '[0-9]%';
