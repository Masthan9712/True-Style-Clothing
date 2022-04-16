-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-04-05 16:09:48.772

-- tables
-- Table: Category
CREATE TABLE Category (
    CategoryID int NOT NULL,
    Gender char(1) NOT NULL,
    CategoryDescription varchar(50) NOT NULL,
    CONSTRAINT Category_pk PRIMARY KEY (CategoryID)
);

-- Table: Costumes
CREATE TABLE Costumes (
    CostumeID int NOT NULL,
    Brand varchar(50) NOT NULL,
    CostumeName varchar(50) NOT NULL,
    CostumeDesigner varchar(50) NOT NULL,
    Color varchar(50) NOT NULL,
    Price float(10,2) NOT NULL,
    Size char(2) NOT NULL,
    CategoryID int NOT NULL,
    CONSTRAINT Costumes_pk PRIMARY KEY (CostumeID)
);

-- Table: Customers
CREATE TABLE Customers (
    CustomerID int NOT NULL,
    CustomerFirstName varchar(50) NOT NULL,
    CustomerLastName varchar(50) NOT NULL,
    CustomerEmail varchar(50) NOT NULL,
    CustomerDOB date NOT NULL,
    CONSTRAINT Customers_pk PRIMARY KEY (CustomerID)
);

-- Table: Employees
CREATE TABLE Employees (
    EmployeeID int NOT NULL,
    EmployeeFirstName varchar(50) NOT NULL,
    EmployeeLastName varchar(50) NOT NULL,
    Role varchar(30) NOT NULL,
    Salary float(10,10) NOT NULL,
    SalesCompleted int NOT NULL,
    CONSTRAINT Employees_pk PRIMARY KEY (EmployeeID)
);

-- Table: Orders
CREATE TABLE Orders (
    OrderID int NOT NULL,
    OrderDate date NOT NULL,
    AmountPaid float(10,2) NOT NULL,
    Customers_CustomerID int NOT NULL,
    SalesID int NOT NULL,
    CONSTRAINT Orders_pk PRIMARY KEY (OrderID)
);

-- Table: Sales
CREATE TABLE Sales (
    SalesDate date NOT NULL,
    CostumesSold int NOT NULL,
    SaleValue float(10,2) NOT NULL,
    SalesID int NOT NULL,
    EmployeeID int NOT NULL,
    CONSTRAINT Sales_pk PRIMARY KEY (SalesID)
);

-- Table: Vendor
CREATE TABLE Vendor (
    VendorID int NOT NULL,
    VendorName varchar(50) NOT NULL,
    DeliveryDate date NOT NULL,
    ExpectedQuantity int NOT NULL,
    CostumeID int NOT NULL,
    CONSTRAINT Vendor_pk PRIMARY KEY (VendorID)
);

-- foreign keys
-- Reference: Costumes_Category (table: Costumes)
ALTER TABLE Costumes ADD CONSTRAINT Costumes_Category FOREIGN KEY Costumes_Category (CategoryID)
    REFERENCES Category (CategoryID);

-- Reference: Orders_Customers (table: Orders)
ALTER TABLE Orders ADD CONSTRAINT Orders_Customers FOREIGN KEY Orders_Customers (Customers_CustomerID)
    REFERENCES Customers (CustomerID);

-- Reference: Orders_Sales (table: Orders)
ALTER TABLE Orders ADD CONSTRAINT Orders_Sales FOREIGN KEY Orders_Sales (SalesID)
    REFERENCES Sales (SalesID);

-- Reference: Sales_Employees (table: Sales)
ALTER TABLE Sales ADD CONSTRAINT Sales_Employees FOREIGN KEY Sales_Employees (EmployeeID)
    REFERENCES Employees (EmployeeID);

-- Reference: Vendor_Costumes (table: Vendor)
ALTER TABLE Vendor ADD CONSTRAINT Vendor_Costumes FOREIGN KEY Vendor_Costumes (CostumeID)
    REFERENCES Costumes (CostumeID);

-- End of file.

