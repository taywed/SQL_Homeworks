create table salesman (salesman_id int, [name] varchar(20), city varchar(20), commission float )
select * from salesman

insert into salesman values(5001, 'James Hoog', 'New York', 0.15)
insert into salesman values(5002, 'Nail Knite', 'Paris', 0.13)
insert into salesman values(5005, 'Pit Alex', 'London', 0.11),(5006, 'Mc Lyon', 'Paris', 0.14),
(5007, 'Paul Adam', 'Rome', 0.13),(5003, 'Lauson Hen', 'San Jose', 0.12)  

SELECT 'This is SQL Exercise, Practice and Solution'
SELECT 5, 10, 15
select 10 + 15
select 5*25-100+75

select name, commission from salesman
select * from salesman

create table orders (ord_no int, purch_amt float, ord_date date, customer_id int, salesman_id int )
select * from orders
insert into orders values
(70001, 150.5, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.5, '2012-08-17', 3009, 5003),
(70007, 948.5, '2012-09-10', 3005, 5002),
(70005, 2400.6, '2012-07-27', 3007, 5001),
(70008, 5760, '2012-09-10', 3002, 5001),
(70010, 1983.43, '2012-10-10', 3004, 5006),
(70003, 2480.4, '2012-10-10', 3009, 5003),
(70012, 250.45, '2012-06-27', 3008, 5002)

select ord_date, salesman_id, ord_no, purch_amt from orders
select salesman_id from orders

select name, city from salesman where city = 'Paris'

create table customer (customer_id int, cust_name varchar(20), city varchar(20),grade int, salesman_id int)
select * from customer
insert into customer values
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3008, 'Julian Green', 'London', 300, 5002),
(3004, 'Fabian Johnson', 'Paris', 300, 5006),
(3009, 'Geoff Cameron', 'Berlin', 100, 5003),
(3003, 'Jozy Altidor', 'Moscow', 200, 5007),
(3001, 'Brad Guzan', 'London', NULL, 5005)

select cust_name, grade from customer where grade = 200

select ord_no, ord_date, purch_amt from orders where salesman_id = 5001

create table nobel_win ([YEAR] int, [SUBJECT] varchar(20), WINNER varchar(30), COUNTRY varchar(20), CATEGORY varchar(20))
select * from nobel_win

insert into nobel_win values
(1970, 'Physics', 'Hannes Alfven', 'Sweden', 'Scientist'),
(1970, 'Physics', 'Louis Neel', 'France', 'Scientist'),
(1970, 'Chemistry', 'Luis Federico Leloir', 'France', 'Scientist'),
(1970, 'Physiology', 'Ulf von Euler', 'Sweden', 'Scientist'),
(1970, 'Physiology', 'Bernard Katz', 'Germany', 'Scientist'),
(1970, 'Literature', 'Aleksandr Solzhenitsyn', 'Russia', 'Linguist'),
(1970, 'Economics', 'Paul Samuelson', 'USA', 'Economist'),
(1970, 'Physiology', 'Julius Axelrod', 'USA', 'Scientist'),
(1971, 'Physics', 'Dennis Gabor', 'Hungary', 'Scientist'),
(1971, 'Chemistry', 'Gerhard Herzberg', 'Germany', 'Scientist'),
(1971, 'Peace', 'Willy Brandt', 'Germany', 'Chancellor'),
(1971, 'Literature', 'Pablo Neruda', 'Chile', 'Linguist'),
(1971, 'Economics', 'Simon Kuznets', 'Russia', 'Economist'),
(1978, 'Peace', 'Anwar al-Sadat', 'Egypt', 'President'),
(1978, 'Peace', 'Menachem Begin', 'Israel', 'Prime Minister'),
(1987, 'Chemistry', 'Donald J. Cram', 'USA', 'Scientist'),
(1987, 'Chemistry', 'Jean-Marie Lehn', 'France', 'Scientist'),
(1987, 'Physiology', 'Susumu Tonegawa', 'Japan', 'Scientist'),
(1987, 'Physics', 'Johannes Georg Bednorz', 'Germany', 'Scientist'),
(1987, 'Literature', 'Joseph Brodsky', 'Russia', 'Linguist'),
(1987, 'Economics', 'Robert Solow', 'USA', 'Economist'),
(1994, 'Economics', 'Reinhard Selten', 'Germany', 'Economist'),
(1994, 'Peace', 'Yitzhak Rabin', 'Israel', 'Prime Minister'),
(1994, 'Literature', 'Kenzaburo Oe', 'Japan', 'Linguist');


select YEAR, SUBJECT, WINNER from nobel_win where YEAR = 1970
select WINNER from nobel_win where SUBJECT = 'Literature' and YEAR = 1970
select YEAR, SUBJECT from nobel_win where WINNER = 'Dennis Gabor'
select WINNER from nobel_win where YEAR > 1950
select YEAR, SUBJECT, WINNER, COUNTRY from nobel_win where SUBJECT = 'Chemistry' and YEAR > 1965 and YEAR < 1975
select YEAR, SUBJECT, WINNER from nobel_win where YEAR > 1972 and WINNER in ('Menachem Begin', 'Yitzhak Rabin')
select YEAR, SUBJECT, WINNER, COUNTRY, CATEGORY from nobel_win where WINNER like 'Louis%'
select YEAR, SUBJECT, WINNER, COUNTRY, CATEGORY from nobel_win where (SUBJECT = 'Physics' and YEAR=1970) or (SUBJECT = 'Economics' and YEAR=1971)
select YEAR, SUBJECT, WINNER, COUNTRY, CATEGORY from nobel_win where YEAR = 1970 and SUBJECT not in ('Physiology', 'Economics')
select YEAR, SUBJECT, WINNER, COUNTRY, CATEGORY from nobel_win where (YEAR < 1971 and SUBJECT = 'Physiology') or (SUBJECT = 'Peace' and YEAR >= 1974)
select YEAR, SUBJECT, WINNER, COUNTRY, CATEGORY from nobel_win where WINNER = 'Johannes Georg Bednorz'
select YEAR, SUBJECT, WINNER, COUNTRY, CATEGORY from nobel_win where SUBJECT not like 'P%' order by YEAR desc, WINNER asc
select YEAR, SUBJECT, WINNER, COUNTRY, CATEGORY from nobel_win where YEAR = 1970 order by SUBJECT asc

create table item_mast (PRO_ID int, PRO_NAME varchar(20),PRO_PRICE decimal(10,2),PRO_COM int)
insert into item_mast values
(101, 'Mother Board', 3200.00, 15),
(102, 'Key Board', 450.00, 16),
(103, 'ZIP drive', 250.00, 14),
(104, 'Speaker', 550.00, 16),
(105, 'Monitor', 5000.00, 11),
(106, 'DVD drive', 900.00, 12),
(107, 'CD drive', 800.00, 12),
(108, 'Printer', 2600.00, 13),
(109, 'Refill cartridge', 350.00, 13),
(110, 'Mouse', 250.00, 12)
select * from item_mast

create table emp_details (EMP_IDNO int, EMP_FNAME varchar(20), EMP_LNAME varchar(20), EMP_DEPT int)

insert into emp_details values
(127323, 'Michale', 'Robbin', 57),
(526689, 'Carlos', 'Snares', 63),
(843795, 'Enric', 'Dosio', 57),
(328717, 'Jhon', 'Snares', 63),
(444527, 'Joseph', 'Dosni', 47),
(659831, 'Zanifer', 'Emily', 47),
(847674, 'Kuleswar', 'Sitaraman', 57),
(748681, 'Henrey', 'Gabriel', 47),
(555935, 'Alex', 'Manuel', 57),
(539569, 'George', 'Mardy', 27),
(733843, 'Mario', 'Saule', 63),
(631548, 'Alan', 'Snappy', 27),
(839139, 'Maria', 'Foster', 57)
select * from emp_details
