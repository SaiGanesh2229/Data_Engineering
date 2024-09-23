create table Products(
ProductId int primary key,
ProductName varchar(100) not null,
Category varchar(50) not null,
price decimal(10,2) check (price > 0),
stockQuantity int default 0
);

select ProductName, Upper(ProductName) as uppercase from Products;
select ProductName, lower(ProductName) as lowercase from Products;
select ProductName, Substring(ProductName,1,4) as SubCases from Products;
select ProductName, Len(ProductName) as LenofProducts from Products;
select ProductName, Replace(ProductName, 'Phone','Device') as Updated from Products;
select ProductName, LTRIM(RTRIM(ProductName)) as TrimmedName from Products;

-- Functions
select ProductName, CHARINDEX('e',Productname) as posofE from Products;

select ProductName,category, CONCAT(ProductName,'-',Category) as ProductDetails from Products;

select ProductName, left(Productname,5) as ShortName from Products;

select ProductName, right(Productname,5) as LastChars from Products;

select ProductName, reverse(Productname) as ReversedName from Products;

select ProductNAme, format(Price,'N2') as formattedPrice from products;

Select PRoductNAme, replicate(ProductNAme, 3) as repeatedName from Products;

select getdate() as currentdate, 
dateadd(day,10,getdate()) as futuredate

select dateadd(year,-1,getdate()) as Dateminus1year

select datediff(day, '2024-01-01',GETDATE()) as daysdifference

select format(getdate(),'dd-MM-yyyy') as Formatteddate

select year(getdate()) as currYear

select month(getdate()) as currYear

select day(getdate()) as currDate

select datediff(month, '2001-12-22',getdate() )  as diffinMonth