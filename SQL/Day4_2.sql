create procedure GetAllProducts
as
begin
select * from Courses;
end
exec GetAllProducts;
-- 
create procedure GetProductId
@productId int
as
begin
select * from products
where productId=@productId
end;
exec GetProductId @productId=1;

create procedure GetProductsbyCategoryandPrice
@category varchar(50),
@minprice Decimal(10,2)
as
begin
select * from products
where category = @category
and price>=@minprice
end;
exec GetProductsbyCategoryandPrice @category='Electronics', @minprice=500.00

-- Procedures 
--Stored Procedure for Insert operation
CREATE PROCEDURE InsertEmployee
    @employee_name VARCHAR(255),
    @employee_id int
AS
BEGIN
    INSERT INTO Employees (employee_name, employee_id)
    VALUES (@employee_name, @employee_id);
END;


-- Update Operation
CREATE PROCEDURE UpdateEmployee
@employee_id INT,
@employee_name VARCHAR(255)
AS
BEGIN
UPDATE Employees
SET employee_name = @employee_name
WHERE employee_id = @employee_id;
END;

--Delete Operation
CREATE PROCEDURE DeleteEmployee
@employee_id INT
AS
BEGIN
DELETE FROM Employees
WHERE employee_id = @employee_id;
END;

-- Output Procedure
create procedure GetTotalProductsinCategory
@category varchar(50),
@TotalProducts int output
as
begin 
select @TotalProducts=count(*)
from products
where category = @category
end;
declare @Total int;
EXEC GetTotalProductsinCategory @category='Electronics',
@TotalProducts= @Total output;
select @Total as TotalProductsinCategory


--- Transaction
create procedure ProcessOrder
@ProductId int,
@quantity int,
@orderDate date
as
begin
begin transaction;
begin try
--insertorder
insert into Orders(product_id, Quantity, ord_date)
values (@ProductId,@quantity,@orderDate);

-- Update product stock
update Products
set StockQuantity=StockQuantity - @quantity
where productID=@ProductId
commit transaction
end try
begin catch
rollback transaction
-- here we can handle errors such as logging or returning error message
THROW;
end catch
end;

-- if-else block
create procedure AdjustStock
@productId int,
@adjustment int
as
begin
if @adjustment > 0
begin
update products
set StockQuantity = StockQuantity+@adjustment
where ProductID =@productId
end
else if @adjustment< 0
begin
update products
set StockQuantity = StockQuantity+@adjustment
where ProductID =@productId
end
End;
Exec AdjustStock @productId=1, @adjustment=5; --increase stock by 5
Exec AdjustStock @productId=1, @adjustment=-3; --decrease stock by 5
