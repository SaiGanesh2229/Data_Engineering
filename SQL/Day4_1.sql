create database SQLCoding
use SQLCoding


### **1. Table: `Customers`**

#### Create `Customers` Table:

```sql
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(15)
);
```

#### Insert Sample Data into `Customers` (Indian Names):

```sql
INSERT INTO Customers (FirstName, LastName, Email, PhoneNumber)
VALUES 
('Amit', 'Sharma', 'amit.sharma@example.com', '9876543210'),
('Priya', 'Mehta', 'priya.mehta@example.com', '8765432109'),
('Rohit', 'Kumar', 'rohit.kumar@example.com', '7654321098'),
('Neha', 'Verma', 'neha.verma@example.com', '6543210987'),
('Siddharth', 'Singh', 'siddharth.singh@example.com', '5432109876'),
('Asha', 'Rao', 'asha.rao@example.com', '4321098765');
```

### **2. Table: `Products`**

#### Create `Products` Table:

```sql
CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10, 2),
    StockQuantity INT
);
```

#### Insert Sample Data into `Products`:

```sql
INSERT INTO Products (ProductName, Category, Price, StockQuantity)
VALUES 
('Laptop', 'Electronics', 75000.00, 15),
('Smartphone', 'Electronics', 25000.00, 30),
('Desk Chair', 'Furniture', 5000.00, 10),
('Monitor', 'Electronics', 12000.00, 20),
('Bookshelf', 'Furniture', 8000.00, 8);
```

### **3. Table: `Orders`**

#### Create `Orders` Table:

```sql
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT,
    ProductID INT,
    Quantity INT,
    TotalAmount DECIMAL(10, 2),
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
```

#### Insert Sample Data into `Orders`:

```sql
INSERT INTO Orders (CustomerID, ProductID, Quantity, TotalAmount, OrderDate)
VALUES 
(1, 1, 2, 150000.00, '2024-08-01'),
(2, 2, 1, 25000.00, '2024-08-02'),
(3, 3, 4, 20000.00, '2024-08-03'),
(4, 4, 2, 24000.00, '2024-08-04'),
(5, 5, 5, 40000.00, '2024-08-05');
```


-- Hands-on Exercise 
-- 1. Filtering Data using SQL Queries
SELECT * FROM Products 
WHERE Category='Electronics' and Price > 500;

-- 2. Total aggregations using SQL Queries
SELECT SUM(Quantity) as TotalQuantitySold
FROM orders;

-- 3. Group by Aggregations using SQL Queries
SELECT ProductId, SUM(Quantity* Price) as TotalRevenue
FROM orders 
GROUP BY ProductId;

--4. Order of Execution of SQL Queries
SELECT ProductId, SUM(Quantity * Price) as TotalRevenueGenerated
FROM Orders
WHERE Quantity > 1
GROUP BY productId
HAVING SUM(Quantity * Price) > 1000
ORDER BY TotalRevenueGenerated DESC;

	-- Order of Execution
	/* 
	1. FROM
	2. WHERE
	3. GROUP BY
	4. HAVING
	5. SELECT
	6. ORDER BY
	*/

-- 5. Rules and Restrictions to Group and Filter Data in SQL Queries
SELECT ProductID, Category, SUM(Price) as TotalPrice
FROM Products
Group By ProductId, Category;

-- 6. Filter data based on Aggregated Results using Group by and Having
SELECT CustomerId, Count(OrderID) as OrderCount
From Orders
Group By CustomerID
HAVING COUNT(OrderID)>5;

-- Stored Procedures Exercise
-- 1. Basic Stored Procedure
CREATE PROCEDURE GetAllCustomers
AS
BEGIN 
SELECT * FROM Customers;
END;

-- 2. Stored Procedure with input Parameter
CREATE PROCEDURE GetOrderDetailsByOrderId
@OrderID int
AS
BEGIN
SELECT * FROM Orders
where OrderID=@OrderID;
END;

-- 3. Stored Procedure with multiple Input Parameters
CREATE PROCEDURE GetProductsByCategoryandPrice
@Category Varchar(50),
@MinPrice Decimal(10,2)
AS
BEGIN
SELECT * FROM Products
WHERE Category=@Category AND Price>=@MinPrice;
END;

-- 4. Stored Procedure with Insert Operation
CREATE PROCEDURE InsertNewProduct
@ProductName varchar(50),
@Category varchar(50),
@Price Decimal(10,2),
@StockQuantity int
AS
BEGIN
INSERT INTO Products(ProductName, Category, Price, StockQuantity)
VALUES (@ProductName, @Category, @Price, @StockQuantity);
END;

-- 5. Stored Procedure with Update Operation
CREATE PROCEDURE UpdateCustomerEmail
@CustomerID int,
@NewMail Varchar(50)
AS
BEGIN
UPDATE Customers
SET Email=@NewMail
WHERE CustomerID=@CustomerID;
END;

-- 6. Stored Procedure with Delete Operation
CREATE PROCEDURE DeleteOrderByID
@OrderID int
AS
BEGIN
DELETE FROM Orders
WHERE OrderID= @OrderID;
END;

-- 7. Stored Procedure with Output Parameter
CREATE PROCEDURE GetTotalProductsInCategory
@Category VARCHAR(50),
@TotalProducts INT OUTPUT
AS
BEGIN
SELECT @TotalProducts=COUNT(*)
FROM Products
WHERE Category=@Category
END;
