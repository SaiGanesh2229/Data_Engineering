create database companydb;
use companydb;
create table tblEmployee(
ID int primary key,
Name nvarchar(50),
Gender nvarchar(10),
salary int,
DepartmentId int
);

create table tblDepartment(
ID int primary key,
DepartmentName nvarchar(50),
Location nvarchar(50),
DepartmentHead nvarchar(50),
);

Insert into tblEmployee(ID, Name, Gender, salary, DepartmentId)
values 
(1, 'Tom','Male',4000, 1),
(2, 'Pam', 'Female', 3000, 3),
(3, 'John', 'Male', 3500, 1),
(4, 'Sam', 'Male', 4500, 2),
(5, 'Todd', 'Male', 2800, 2),
(6, 'Ben', 'Male', 7000, 1),
(7, 'Sara', 'Female', 4800, 3),
(8, 'Valarie', 'Female', 5500, 1),
(9, 'James', 'Male', 6500, NULL),
(10, 'Russell', 'Male', 8800, NULL);

Insert into tblDepartment(ID, DepartmentName, Location, DepartmentHead)
values
(1, 'IT', 'London','Rick'),
(2, 'Payroll', 'Delhi', 'Ron'),
(3, 'HR', 'New York', 'Christie'),
(4, 'Other Department', 'Sydney', 'Cindrella');

-- Inner Join
select name, gender, salary, departmentname from tblEmployee
inner join tblDepartment
on tblEmployee.DepartmentId=tblDepartment.ID

-- Left outer join/ Left join
select name, gender, salary, departmentname from tblEmployee
left outer join tblDepartment
on tblEmployee.DepartmentId=tblDepartment.ID

-- Right outer join/Right Join
select name, gender, salary, departmentname from tblEmployee
right outer join tblDepartment
on tblEmployee.DepartmentId=tblDepartment.ID

-- Full outer join
select name, gender, salary, departmentname from tblEmployee
full outer join tblDepartment
on tblEmployee.DepartmentId=tblDepartment.ID


create table Products(
product_id int primary key,
product_name nvarchar(50),
price decimal(10,2)
);

create table Orderss(
order_id int primary key,
product_id int,
quantity int,
order_date Date
);

Insert into Products(product_id,product_name,price) 
values 
(1,'Laptop',800.00),
(2,'SmartPhone',500.00),
(3, 'Tablet', 300.00),
(4, 'Headphones', 50.00),
(5, 'Monitor', 150.00);

Insert into Orderss(order_id, product_id, quantity, order_date)
values
(1, 1, 2, '2024-08-01'),
(2, 2, 1, '2024-08-02'),
(3, 3, 3, '2024-08-03'),
(4, 1, 1, '2024-08-04'),
(5, 4, 4, '2024-08-05'),
(6, 5, 2, '2024-08-06'),
(7, 6, 1, '2024-08-07');


-- inner join
select order_id, product_name, quantity, order_date 
from Orders
inner join Products 
on Orders.product_id=Products.product_id;

-- Left Outer Join
select order_id, product_name, quantity, order_date
from Orders
left outer join Products on Orders.product_id = Products.product_id;

-- Right Outer Join
select order_id, product_name, quantity, order_date
from Products
right outer join Orders on Orders.product_id = Products.product_id;

-- Full outer join
select order_id, product_name, quantity, order_date
from Orders
full outer join Products on Orders.product_id = Products.product_id;

-- Grouping Set
select p.product_name, o.order_date, sum(o.quantity) 
as total_quantity from Orders o
join products p on o.product_id=p.product_id
group by GROUPING sets ((p.product_name),(o.order_date))

-- Sub Query
select o.order_id, o.product_id,
(select p.product_name from Products p where p.product_id=o.product_id) as product_name
from Orders o

--  Where clause sub query
select order_id, order_date, product_id
from orders
where product_id in (select product_id from Products where price>500);

-- Exists
select u.user_id, u.user_name from Users u
where exists(select 1 from Orders o where o.user_id=u.user_id);

-- Any
select p.product_name, p.price
from Products p
where p.price> any(select price from Products where product_name like 'LAPTOP%');

-- ALL
select p.product_name, p.price
from Products p
where p.price> All(select price from Products where product_name like 'smartphone%');

-- Nested Sub Query
select user_id, user_name
from Users
where user_id in (
    select user_id
    from Orders
    where product_id in (
        select product_id
		from Products
        where price>1000
    )
);


-- Union
select product_name from Products where price>500
union
select product_name from Products where product_name like 'smart%'

-- Intersection
select product_name from Products where price>500
Intersect 
select product_name from Products where product_name like 'smart%'

-- Except
select product_name from products where price>500
Except
select product_name from Products where product_name like 'smart%'

--  Mathematical Function
select product_name, price, round(price,2) as roundedprice
from Products;

select product_name, price, ceiling(price/8.0) as ceilingprice
from products

select product_name, price, floor(price) as floorofprice
from products

select product_name, price, sqrt(price) as squarerootprice
from products

select product_name, price, power(price,2) as pricesquared
from products

select product_name, price, price%5 as Moduloprice
from Products

select abs(max(price) - min(price)) as pricedifference
from Products

select round(rand()*100,2) as randomNumber  

select log(2) as LogarithmNumber

select product_name, price, round(price * 0.85, 2) as discountedprice,
ceiling(round(price * 0.85, 2)) as ceilingvalue,
floor(round(price * 0.85, 2)) as floorvalue
from products;

select ceiling(round((price-(price*0.15)),2)),floor(round((price-(price*0.15)),2)) from Products

-- Aggregate functions
select sum(quantity) as totalsales 
from Orderss

select avg(price) as averageprice from Products

select count(order_id) as totalorders from Orderss

select product_name, product_id, count(*) as TotalProducts
from products
group by product_name, product_id