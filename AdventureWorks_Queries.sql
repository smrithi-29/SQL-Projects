Task 1: Person details with email, phone, and phone type

select p.BusinessEntityId,p.FirstName,p.LastName,p.PersonType,ea.EmailAddress,pp.PhoneNumber,pnt.Name as PhoneNumberType
from Person.Person p
left join Person.EmailAddress ea on p.BusinessEntityId = ea.BusinessEntityId
left join Person.PersonPhone pp on p.BusinessEntityId = pp.BusinessEntityId
left join Person.PhoneNumberType pnt on pp.PhoneNumberTypeId = pnt.PhoneNumberTypeId;


Task 2: Sales header orders in May 2011

select * from Sales.SalesOrderHeader 
where Year(OrderDate) = 2011 
and MONTH(OrderDate) = 5;


Task 3: Sales detail orders in May 2011

select sod.* from Sales.SalesOrderDetail sod
join Sales.SalesOrderHeader soh
on sod.SalesOrderDetailID = soh.SalesOrderID
where Year(soh.OrderDate) = 2011
and Month(soh.OrderDate) = 5;


Task 4: Total sales in May 2011

select sum(TotalDue) as TotalSalesMay2011
from Sales.SalesOrderHeader
where Year(OrderDate) = 2011
and Month(OrderDate) = 5;


Task 5: Monthly sales in 2011 ordered by increasing sales

select Month(OrderDate) as Month, DATENAME(Month,OrderDate) as MonthName, Sum(TotalDue) as TotalSales
from Sales.SalesOrderHeader
where Year(OrderDate) = 2011
group by Month(OrderDate), DATENAME(Month,OrderDate)
order by TotalSales asc;


Task 6: Total sales for Gustavo Achong

select p.Firstname, p.LastName, SUM(soh.TotalDue) AS TotalSales
from Sales.SalesOrderHeader soh
join Sales.Customer c ON soh.CustomerID = c.CustomerID
join Person.Person p on c.PersonID = p.BusinessEntityID
where p.FirstName = 'Gustavo'
and p.LastName = 'Achong'
group by p.FirstName,p.LastName;