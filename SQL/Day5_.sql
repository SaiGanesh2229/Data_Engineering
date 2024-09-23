use companydb;
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(15)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10, 2),
    StockQuantity INT
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT,
    ProductID INT,
    Quantity INT,
    TotalAmount DECIMAL(10, 2),
    OrderDate DATE,
    FOREIGN KEY (customerid) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Products (ProductName, Category, Price, StockQuantity)
VALUES 
('Laptop', 'Electronics', 75000.00, 15),
('Smartphone', 'Electronics', 25000.00, 30),
('Desk Chair', 'Furniture', 5000.00, 10),
('Monitor', 'Electronics', 12000.00, 20),
('Bookshelf', 'Furniture', 8000.00, 8);

INSERT INTO Orders (CustomerID, ProductID, Quantity, TotalAmount, OrderDate)
VALUES 
(1, 1, 2, 150000.00, '2024-08-01'),
(2, 2, 1, 25000.00, '2024-08-02'),
(3, 3, 4, 20000.00, '2024-08-03'),
(4, 4, 2, 24000.00, '2024-08-04'),
(5, 5, 5, 40000.00, '2024-08-05');



INSERT INTO Customers (FirstName, LastName, Email, PhoneNumber)
VALUES 
('Amit', 'Sharma', 'amit.sharma@example.com', '9876543210'),
('Priya', 'Mehta', 'priya.mehta@example.com', '8765432109'),
('Rohit', 'Kumar', 'rohit.kumar@example.com', '7654321098'),
('Neha', 'Verma', 'neha.verma@example.com', '6543210987'),
('Siddharth', 'Singh', 'siddharth.singh@example.com', '5432109876'),
('Asha', 'Rao', 'asha.rao@example.com', '4321098765');

Select * From Customers;

Update Customers
Set FirstName=LTRIM(RTRIM(LOWER(FirstName))),
LastName=LTRIM(RTRIM(LOWER(LastName)));

SELECT * from Customers
where FirstName Like 'A%'

Select * from Customers 
where PhoneNumber Like '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9]';

Select * From Customers
Where LastName LIKE '_____'; -- UnderScore Written 5 times

Select CustomerID, OrderID, TotalAmount, 
Sum(TotalAmount) over (Partition by CustomerID Order by OrderDate)
as RunningTotal from Orders;

-- Rank
Select CustomerId, TotalSales,
Rank() Over (Order by TotalSales Desc) as SalesRank
From(
select CustomerId, Sum(TotalAmount) As TotalSales
From Orders Group by CustomerID
) As SalesData

Create table Employees1(
EmployeeId int primary key identity(1,1),
EmployeeName varchar(100),
ManagerId int null
);

Insert into Employees1(EmployeeName, ManagerId)
values
('Amit Sharma', Null),
('priya mehta', 1),
('Neha varma',2),
('Siddharth Singh',2),
('Asha Rao',3);

Insert into Employees1(EmployeeName,ManagerId)
values 
('Vikram Gupta',4),
('Rajesh Patel',5);


with RecursiveEmployeeCTE as(
select  EmployeeId, ManagerId, EmployeeName
from Employees1
where ManagerId is null
union all
select  e.employeeId, e.ManagerId, e.EmployeeName
from Employees1 e
inner join RecursiveEmployeeCTE r on e.ManagerId=r.EmployeeId
)
Select * from RecursiveEmployeeCTE

Create table Sales(
SaleId int primary key,
ProductId int,
Category Varchar(50),
Amount Decimal(10,2),
SaleDate Date
);

Insert into Sales(SaleId, ProductId, Category, Amount, SaleDate)
Values
(1,101, 'Electronics',1500.00,'2024-01-15'),
(2,102, 'Furniture',800.00,'2024-01-16'),
(3,103, 'Electronics',2000.00,'2024-01-17'),
(4,104, 'Electronics',1200.00,'2024-02-01'),
(5,105, 'Furniture',900.00,'2024-02-03');

Select Category, sum(amount) As totalSales
from Sales
Group by rollup(Category)

-- Correlated SubQuery
Create table Orders1(
OrderId int primary key,
CustomerId int,
OrderAmount Decimal(10,2),
OrderDate Date
);
Insert into Orders1(OrderId, CustomerId, OrderAmount, OrderDate)
values
(1,1,500.00, '2024-01-15'),
(2,2,700.00, '2024-01-16'),
(3,1,300.00, '2024-01-17'),
(4,3,1200.00, '2024-02-01'),
(5,2,900.00, '2024-02-03')

Select Distinct o1.CustomerId
from Orders1 o1
where (
select count(*) 
from Orders1 o2
where o2.CustomerID=o1.CustomerID
) > 1;


Create table ProductSales(
SaleId int primary key,
ProductId Int,
Amount Decimal(10,2),
SaleDate Date
);

Insert into ProductSales(SaleId,ProductId,Amount,SaleDate)
values 
(1, 101, 1500.00, '2024-01-15'),
(2, 102, 800.00, '2024-01-16'),
(3, 103, 2000.00, '2024-01-17'),
(4, 104, 1200.00, '2024-02-01'),
(5, 105, 900.00, '2024-02-03');


Create view TotalSalesbyProduct
with SchemaBinding
as
Select ProductId, Sum(Amount) as TotalSales
From dbo.ProductSales
Group by ProductID;

Select * from TotalSalesbyProduct;