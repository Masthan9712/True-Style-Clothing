--Database creation
create database truestyleclothing;

--Category
LOAD DATA LOCAL INFILE 'C:\\Program Files\\MariaDB 10.6\\data\\Category.csv'
     INTO TABLE Category
     FIELDS TERMINATED BY ','
     LINES TERMINATED BY '\r\n'
     IGNORE 1 LINES
     (CategoryID, Gender, CategoryDescription);

--Costume
LOAD DATA LOCAL INFILE 'C:\\Program Files\\MariaDB 10.6\\data\\Costume.csv'
     INTO TABLE Costumes
     FIELDS TERMINATED BY ','
     LINES TERMINATED BY '\r\n'
     IGNORE 1 LINES
     (CostumeID, Brand, CostumeName, CostumeDesigner, Color, Price, Size);

--Customer
LOAD DATA LOCAL INFILE 'C:\\Program Files\\MariaDB 10.6\\data\\customer.csv'
     INTO TABLE Customers
     FIELDS TERMINATED BY ','
     LINES TERMINATED BY '\r\n'
     IGNORE 1 LINES
     (CustomerID, CustomerFirstName, CustomerLastName, CustomerEmail, CustomerDOB);

--Employee
LOAD DATA LOCAL INFILE 'C:\\Program Files\\MariaDB 10.6\\data\\employee.csv'
     INTO TABLE Employees
     FIELDS TERMINATED BY ','
     LINES TERMINATED BY '\r\n'
     IGNORE 1 LINES
     (EmployeeID, EmployeeFirstName, EmployeeLastName, Role, Salary, SalesCompleted);

--Sales
LOAD DATA LOCAL INFILE 'C:\\Program Files\\MariaDB 10.6\\data\\sales.csv'
     INTO TABLE Sales
     FIELDS TERMINATED BY ','
     LINES TERMINATED BY '\r\n'
     IGNORE 1 LINES
     (SalesDate, CostumesSold, SaleValue, SalesID, EmployeeID);

--Order
LOAD DATA LOCAL INFILE 'C:\\Program Files\\MariaDB 10.6\\data\\order.csv'
     INTO TABLE Orders
     FIELDS TERMINATED BY ','
     LINES TERMINATED BY '\r\n'
     IGNORE 1 LINES
     (OrderID, OrderDate, AmountPaid, CustomerID, SalesID);

--Vendor
LOAD DATA LOCAL INFILE 'C:\\Program Files\\MariaDB 10.6\\data\\vendor.csv'
     INTO TABLE Vendor
     FIELDS TERMINATED BY ','
     LINES TERMINATED BY '\r\n'
     IGNORE 1 LINES
     (VendorID, VendorName, DeliveryDate, ExpectedQuantity, CostumeID);

--Join command 1
select Employees.EmployeeID, Sales.SalesDate, Sales.SaleValue from Employees inner join Sales on Employees.EmployeeID=Sales.EmployeeID;

--Join command 2
select Category.CategoryID, Costumes.CostumeID, Costumes.Brand, Costumes.CostumeDesigner, Costumes.Color, Costumes.Price from Category right join Costumes on Category.CategoryID = Costumes.CategoryID;

--Insert command 1
insert into Customers(CustomerID, CustomerFirstName, CustomerLastName, CustomerEmail, CustomerDOB) values (14, 'Christiano', 'Ronaldo', 'christiano@gmail.com', '1980-03-23');

--Insert command 2
insert into Employees(EmployeeID, EmployeeFirstName, EmployeeLastName, Role, Salary, SalesCompleted) values (24, 'Kevin', 'Stevenson', 'Intern', 10000.00, 3);

--Update command 1
update Customers set CustomerEmail = 'masthanvalishaik@yahoo.com' where CustomerID = 11;

--Update command 2
update Costumes set CostumeDesigner = 'Malhotra', Color = 'Orange' where CostumeID = 1002;

--Delete command
delete from Customers where CustomerFirstName = 'Christiano';

--Select command
select Brand from Costumes;

--Max 
select max(Salary) from Employees;

--Avg
select avg(CostumesSold) from Sales;

--Sum
select sum(SaleValue) from Sales;

--Multi table
select Category.CategoryDescription, Costumes.Brand, Costumes.Price, Costumes.Size from Category, Costumes where Category.CategoryID = Costumes.CategoryID;


