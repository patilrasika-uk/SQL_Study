-----------Q1.  1. What is a primary key? Why is it important? What is the difference between:----------*************
---a. Primary Key  
---Ans :Primary key is the column for an unique identify each row

------b. Foreign Key------- 
 Foreign Key is a column in a table that refers to primary key in other table

-----------Q2. Write a query to create a table Students with:--------------************
drop database Students;
create database Students;
create Table Students(ID INT Primary Key, Name VARCHAR(50), Age INT, City VARCHAR(100))
----------Q3. Insert 5 records into the Students table.----------********** 
Insert into Students values
(101, 'Riya', 20, 'Mumbai'),
(102, 'Neha', 23, 'Chennai'),
(103, 'Priy', 20, 'Kolkata'),
(104, 'Mehta', 25, 'Pune'),
(105, 'Raj', 29, 'Nashik');
------------Q4. Write a query to:-----------*********** 
---Display all students 
---Display students from 'Mumbai'  
select * from Students
Where City = 'Chennai'

-----------Q5. Difference between:-------------************ 
--WHERE vs HAVING 
| WHERE                                                                     | HAVING                             |
| ------------------------------------------------------------------------- | ---------------------------------- |
| Filters **rows** before grouping.                                         | Filters **groups** after grouping. |
| Used before `GROUP BY`.                                                   | Used after `GROUP BY`.             |
| Cannot use aggregate functions like `SUM()`, `COUNT()`, `AVG()` directly. | Can use aggregate functions.       |
| Works on individual records.                                              | Works on grouped results.          |


--Section 2: Intermediate (Queries & Joins)
-----------Q6. Create two tables: • Orders (OrderID, CustomerID, Amount)-----------************** 
---• Customers (CustomerID, Name, City)  Write a query to: Show all orders with customer names. 
drop table Orders;
drop table Customers;
Create table Orders (OrdersID int, CustomerID int, Amount int);
Insert into Orders values
(1, 1002, 3000), (3,1004, 5000), (5, 1006, 2000), (7, 1001, 8000);
Create table Customers  (CustomerID int , Name VARCHAR(150), City VARCHAR(100))
Insert into Customers Values
(1001, 'RAM', 'Bengaluru'),
(1002, 'Rohit', 'Delhi '),
(1003, 'Roy', 'Pune'),
(1004, 'Ramesh', 'Chennai'),
(1005, 'Shon', 'Bengaluru'),
(1006, 'Sonam', 'Kolkata');
Select * from Customers

-------------Q7. Explain types of joins:--------------*************** 
---• INNER JOIN  
Select Orders.OrdersID, Customers.Name--,Orders.Amount
from Orders
INNER JOIN Customers
on Customers.CustomerID = Orders.CustomerID;
 

--• RIGHT JOIN 
Select Orders.OrdersID, Customers.Name--,Orders.Amount
from Orders
right join Customers
on Customers.CustomerID = Orders.CustomerID;

--• LEFT JOIN 
Select Orders.OrdersID, Customers.Name--,Orders.Amount
from Orders
LEFT JOIN  Customers
on Orders.CustomerID = Customers.CustomerID;

--• FULL JOIN
Customers.Name, Orders.OrdersID
Select *
from Orders
FULL JOIN Customers
on Customers.CustomerID = Orders.CustomerID;

------------Q8. Write a query to find:----------------**************
--Second highest salary from an Employees table. 
--Q8. Second Highest Salary

Drop table Employees;

CREATE TABLE Employees(EmployeeID INT,LastName VARCHAR(50),FirstName VARCHAR(50),
BirthDate VARCHAR(50),Photo VARCHAR(50),Salary Int,jointdate date);


INSERT INTO Employees
VALUES(1,'Davolio','Nancy','1968-12-08','EmpID1.pic',25000,'09-6-2026'),
(2,'Fuller','Andrew','1952-02-19','EmpID2.pic',56000,'05-7-2026'),
(3,'Leverling','Janet','1963-08-30','EmpID3.pic',57820,'06-5-2026'),
(4,'Peacock','Margaret','1958-09-19','EmpID4.pic',36520,'06-8-2026'),
(5,'Buchanan','Steven','1955-03-04','EmpID5.pic',56200,'08-7-2026');


SELECT MAX(Salary) AS SecondHighestSalary
FROM Employees
WHERE Salary <
(
    SELECT MAX(Salary)
    FROM Employees
);


------------Q9. Write a query using:------------************* 
--GROUP BY to count students in each city. 
Select City, count(*) as totalstudents
from students
group by city;

------------Q10. Difference between:-------------************** 
--• DELETE, TRUNCATE, DROP  
--| DELETE                | TRUNCATE          | DROP                  |
--| --------------------- | ----------------- | --------------------- |
--| Deletes selected rows | Deletes all rows  | Deletes table         |
--| WHERE allowed         | WHERE not allowed | Removes structure     |
--| Can rollback          | Can rollback      | Cannot recover easily |
--| Slower                | Faster            | Removes entire object |

--Section 3: Advanced (Logic & Optimization) 
---------Q11. Write a query using a subquery:-----------************** 
--Find students who are older than average age. 
Select * from Students
where Age > (select avg (Age) from Students)
-
---------Q12. What is an Index? Types of indexes in SQL Server?------------************* 
---> an index is the database object that helps the database find data faster without scanning every row in table
--->there are two types of index non-Unique (duplicate values are allowed) and unique(duplicate values are not allowed).

------------Q13. Write a query using:-----------*************
--ROW_NUMBER() to rank employees by salary. 
select EmployeeID,
LastName,
FirstName,
Salary,
ROW_NUMBER() over (order by Salary DESC) AS [Salary rank]
From Employees;

-----------Q14. What is a Stored Procedure?------------*************** 
--Create one to fetch students by city. 
CREATE PROCEDURE GetStudentsByCity
    @City nvarchar(100)
As
BEGIN
    Select * 
    From Students
    Where City = @City;
END;

EXEC GetStudentsByCity @City = 'Chennai';

----------Q15. What is a View?-----------************** 
---> View is a virtual table which store SQL queries based on condition , with showing a data table.
--Create a view for students above age 18. 
create view [Age above 18 Students] as  
select * from Students
where Age >18;

select * from  [Age above 18 Students] 


-----------Q16.Write queries to:-----------************ 
--Total sales per month  
--Top 3 products by sales  
create table products(
ID int identity(1,1) primary key,
Name VARCHAR(50) unique,
Month VARCHAR(50) not null,
Sales Decimal(10,2) not null);
insert into products
values(101,'Ajay','Jan',50000.00),
(102,'Modi','Feb',89653.23),
(103,'Drump','Mar',45635.25),
(104,'Starmer','Apr',46899.25),
(105,'Takaichi','May',96523.21),
(106,'Vikram','Jan',5000.00),
(107,'Chakram','Feb',8953.23),
(108,'Virat','Mar',4565.25),
(109,'Dhoni','Apr',4699.25),
(110,'Ronaldo','May',9623.21);

-------------Q17. Find duplicate records in a table.----------*************** 
select LastName,
    count (*) as Duplicatecount 
from Employees
Group by LastName
Having count(*) > 1;
-----------Q18. Write a query to:-------------**************
--Find employees who joined in the last 30 days.

SELECT *
FROM Employees

select EmployeeID,FirstName,JointDate 
from Employees
where JointDate >= Dateadd(DAY,-30,getdate());