use Everyloop

--1.Företagets totala produktkatalog består av 77 unika produkter. 
--Om vi kollar bland våra ordrar, hur stor andel av dessa produkter har vi någon gång leverarat till London?
select * from company.orders
select * from company.order_details
select Id from company.products

--select
--t1.ShipCity,
--concat(Cast(count(distinct(t3.Id)) as float)/(77)*100,'%') as Andel

--from company.orders t1
-- join company.order_details t2
--on
--t1.Id=t2.orderId

-- join company.products t3
--on
--t2.ProductId=t3.Id

--group by 
--t1.ShipCity
--having t1.ShipCity like 'London'


--2.Till vilken stad har vi levererat flest unika produkter?
--select top 1
--t1.ShipCity,
--count(distinct(t2.ProductId)) as Antal 

--from company.orders t1
--join company.order_details t2
--on t1.Id=t2.OrderId
--group by ShipCity
--order by Antal desc;


--3.Av de produkter som inte längre finns I vårat sortiment, hur mycket har vi sålt för totalt till Tyskland?
--select 
----t1.ProductID,
--sum(t1.Unitprice*t1.Quantity) as summa,
--t2.ShipCountry,
--t3.Discontinued
--from company.order_details t1

--join company.orders t2
--on t1.OrderId=t2.Id

--join company.products t3
--on t1.ProductId=t3.Id

--where t2.ShipCountry='Germany' and t3.Discontinued=1  
--group by
----t1.ProductID,
--t2.ShipCountry,
--t3.Discontinued

--4.För vilken produktkategori har vi högst lagervärde?
--select --top 1
--t1.CategoryName,
--Convert(int,sum(t2.Unitprice*t2.UnitsInStock)) as summa

--from 
--company.categories t1
--join
--company.products t2
--on t1.Id=t2.Id
--group by
--t1.CategoryName
--order by summa desc


--5. Från vilken leverantör har vi sålt flest produkter totalt under sommaren 2013?
select
t1.CompanyName,
sum(t3.Quantity) as summa
--t4.ShippedDate
from 
company.suppliers t1
join company.products t2
on t1.Id=t2.SupplierId

join company.order_details t3
on t2.Id=t3.ProductId

join company.orders t4
on t3.OrderId=t4.Id

where t4.ShippedDate between '2013-06-01' and '2013-08-31' --ShippedDate alt OrderDate
group by
t1.CompanyName
--t4.ShippedDate
order by summa desc

select * from company.suppliers
select * from company.products
select * from company.order_details
select * from company.orders where ShippedDate between '2013-06-01' and '2013-08-31'