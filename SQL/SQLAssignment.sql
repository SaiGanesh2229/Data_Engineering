-- Date Function Exercise
-- 1. Calculate the Number of Months Between Your Birthday and the Current Date
Select datediff(month, '2001-12-22',getdate()) as MonthsBetween

-- 2. Retrieve All Orders That Were Placed in the Last 30 Days
select * from orders where order_date >=dateadd(day,-30,getdate())

-- 3. Write a Query to Extract the Year, Month, and Day from the Current Date
select year(getdate()) as CurrentYear,
month(getdate()) as CurrentMonth,
day(getdate()) as currentDate

-- 4. Calculate the Difference in Years Between Two Given Dates
Select datediff(year,'2002-12-03','2024-08-22') as YearsDifference

-- 5. Retrieve the Last Day of the Month for a Given Date
Select eomonth('2024-08-22') as LastDayofMonth

-- String Function Exercise
-- 1. Convert all customer names into uppercase
Select upper(customer_name) as CustomerNameinUpperCase from Customer

-- 2. Extract the First 5 Characters of Each Product Name
select left(product_name,5) as FirstFiveChars from Products;

-- 3. Concatenate the Product Name and Category with a Hyphen in Between
Select concat(product_name,'-',category) as ProductCategory from Products;

-- 4. Replace the Word 'Phone' with 'Device' in All Product Names
Select replace(product_name,'phone','device') as UpdatedProductName
from Products 

-- 5. Find the Position of the Letter 'a' in Customer Names
Select charIndex('a', customer_name) as PositionOfA, customer_name from Customer;

-- Aggregate Function Exercise
-- 1. Calculate the Total Sales Amount for All Orders
Select sum(quantity * price) as TotalSalesAmount from orders;

-- 2.  Find the Average Price of Products in Each Category
Select category, avg(price) as AveragePrice from Products 
group by category;

-- 3. Count the Number of Orders Placed in Each Month of the Year
Select month(order_date) as OrderMonth, count(*) as NumberofOrders
from orders
group by month(order_date) 
order by OrderMonth

-- 4. Find the maximum and minimum order quantities
Select max(quantity) as MaximumQuantity, Min(quantity) as MinimumQuantity
from orders;

-- 5. Calculate the Sum of Stock Quantities Grouped by Product Category
Select category, sum(stock_quantity) as TotalStockQuantity
from products group by category;

-- Join Exercise
-- 1. Join Customers and Orders Tables to Display Customer Names and Their Order Details
Select c.customer_name, o.order_id, o.order_date, o.quantity, o.price
from customer c
join orders o ON c.customer_id = o.customer_id;

-- 2.Perform an Inner Join Between Products and
-- Orders to Retrieve Product Names and Quantities Sold
select p.product_name, o.quantity
from product p
inner join orders o on p.product_id = o.product_id;

-- 3. Use a Left Join to Display All Products, Including Those That Have Not Been Ordered
select p.product_name, o.quantity
from products p
left join orders o on p.product_id = o.product_id;

-- 4.Join Employees with Departments and List Employee Names and Their Respective Department Names
select e.employee_name, d.department_name
from employees e
join departments d on e.department_id = d.department_id;

-- 5.Perform a Self-Join on an Employees Table to Show Pairs of Employees 
-- Who Work in the Same Department
select e1.employee_name as employee1, e2.employee_name as employee2
from employees e1
inner join employees e2 
on e1.department_id = e2.department_id and e1.employee_id <> e2.employee_id
order by e1.department_id;

-- SubQuery Exercise
--1. Find Products Whose Price is Higher Than the Average Price of All Products
select product_name, price
from products
where price > (select avg(price) from products);

--2.  Retrieve Customer Names Who Have Placed at Least One Order by Using a Subquery
select customer_name
from customers
where customer_id in (select customer_id from orders);

--3. Find the Top 3 Most Expensive Products Using a Subquery
select product_name, price
from products
where price in (select top 3 price from products order by price desc);

-- 4.  List All Employees Whose Salary is Higher Than the Average Salary of Their Department 
select e.employee_name, s.salary
from employees e
join salaries s on e.employee_id = s.employee_id
where s.salary > (select avg(salary) 
                  from employees e2
                  join salaries s2 on e2.employee_id = s2.employee_id
                  where e2.department_id = e.department_id);

--5.  Use a Correlated Subquery to Find Employees 
--Who Earn More Than the Average Salary of All Employees in Their Department
select e.employee_name, s.salary
from employees e
join salaries s on e.employee_id = s.employee_id
where s.salary > (select avg(s2.salary)
                  from employees e2
                  join salaries s2 on e2.employee_id = s2.employee_id
                  where e2.department_id = e.department_id);

-- Grouping and Summarizing Data exercise
-- 1. Group Orders by Customer and Calculate the Total Amount Spent by Each Customer
select c.customer_name, sum(o.quantity * o.price) as totalamountspent
from customers c
join orders o on c.customer_id = o.customer_id
group by c.customer_name;

--2.  Group Products by Category and Calculate the Average Price for Each Category
select category, avg(price) as averageprice
from products
group by category;

--3.  Group Orders by Month and Calculate the Total Sales for Each Month
select month(order_date) as ordermonth, sum(quantity * price) as totalsales
from orders
group by month(order_date)
order by ordermonth;

--4. Group Products by Category and Calculate the Number of Products in Each Category
select category, count(product_id) as numberofproducts
from products
group by category;

--5. Use the HAVING Clause to Filter Groups of Customers Who Have Placed More Than 5 Orders
select c.customer_name, count(o.order_id) as numberoforders
from customers c
join orders o on c.customer_id = o.customer_id
group by c.customer_name
having count(o.order_id) > 5;

-- Set Operations (Union, Intersection, Except)
-- 1.Combine the Results of Two Queries that 
--Return the Names of Customers from Different Tables Using UNION
select customer_name from customers_a
union
select customer_name from customers_b;

-- 2. Find Products that are in Both the Electronics and Accessories Categories Using INTERSECT
select product_name 
from products 
where category = 'electronics'
intersect
select product_name 
from products 
where category = 'accessories';

-- 3. Find Products that are in the Electronics Category 
-- but Not in the Furniture Category Using EXCEPT 
select product_name 
from products 
where category = 'electronics'
except
select product_name 
from products 
where category = 'furniture';
