use Everyloop

--1.F?retagets totala produktkatalog best?r av 77 unika produkter. 
--Om vi kollar bland v?ra ordrar, hur stor andel av dessa produkter har vi n?gon g?ng leverarat till London?
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


--3.Av de produkter som inte l?ngre finns I v?rat sortiment, hur mycket har vi s?lt f?r totalt till Tyskland?
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

--4.F?r vilken produktkategori har vi h?gst lagerv?rde?
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



--5. Fr?n vilken leverant?r har vi s?lt flest produkter totalt under sommaren 2013?
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






---------------------------------------------Musik----------------------------------------------


--6.Anv?nd dig av tabellerna fr?n schema ?music?, och utg? fr?n:
declare @playlist varchar(max) = 'Heavy Metal Classic';

select 
t2.[Name] as Genre,
t4.[Name] as Artist,
t3.Title as Album,
t1.[Name] as Track,
format(DateAdd(ms,t1.Milliseconds*1,1),'mm:ss') as [Length],
concat(Format(t1.Bytes*0.000001,'N1'),+' '+'MiB') as Size,
case
when t1.Composer is null then '-' else t1.Composer end as Composer

from music.tracks t1

join music.genres t2
on t1.GenreId=t2.GenreId

join music.Albums t3
on t1.AlbumId=t3.AlbumId

join music.artists t4
on t3.ArtistId=t4.ArtistId

join music.playlist_track t5
on t1.TrackId=t5.TrackId

--where t5.PlaylistId=17 Du kan anv?nda denna utan att g?ra nedanst?ende eftersom 'Heavy Metal Classic' har id:17


join music.playlists t6
on t5.PlaylistId=t6.PlaylistId

where t6.[Name]=@playlist



select * from music.playlists


--1.Av alla audiosp?r, vilken artist har l?ngst total speltid?
select
t1.[Name] as ArtistNamn,
sum(t3.Milliseconds) as TotLength
--format(DateAdd(ms,sum(t3.Milliseconds)*1,1),'mm:ss') as [Length]
from
music.artists t1

join music.albums t2
on t1.ArtistId=t2.ArtistId

join music.tracks t3
on t3.AlbumId=t2.AlbumId

where t3.MediaTypeId in(1,4,5,6,8,11,12,13,14,15,16,17,18)
group by
t1.[Name]
--format(DateAdd(ms,t3.Milliseconds*1,1),'mm:ss')
order by TotLength desc



--2.Vad ?r den genomsnittliga speltiden p? den artistens l?tar?
select
t1.[Name] as ArtistNamn,
count(distinct t3.TrackId) as Antal,
sum(t3.Milliseconds) as TotLength,
--sum(t3.Milliseconds)/count(distinct t3.TrackId) as AvgLength,
avg(t3.Milliseconds) as AvgLength2

from
music.artists t1

join music.albums t2
on t1.ArtistId=t2.ArtistId

join music.tracks t3
on t3.AlbumId=t2.AlbumId

where t1.[Name] like 'Iron Maiden'
group by
t1.[Name]
order by AvgLength2 desc


--3.Vad ?r den sammanlagda filstorleken f?r all video?

select
t2.Name,
Format(sum(Cast(t1.Bytes AS BIGINT))*0.000001,'N0') as Storlek  --BIGINT beh?vs inte eftersom jag g?r om til MB
from music.tracks t1

join music.media_types t2
on t1.MediaTypeId=t2.MediaTypeId

where t2.[Name] like '%video%'
group by
t2.Name




--4.Vilket ?r det h?gsta antal artister som finns p? en enskild spellista?
select --top 1
t1.[Name] as Spellista,
count(distinct(t5.artistid)) as UnikaArtister,
count(t5.artistid) as AntalArtister

from music.playlists t1

join music.playlist_track t2
on t1.PlaylistId=t2.PlaylistId

join music.tracks t3
on t2.TrackId=t3.TrackId

join music.albums t4
on t3.AlbumId=t4.AlbumId

join music.artists t5
on t4.ArtistId=t5.ArtistId

group by
t1.[Name]
order by UnikaArtister desc


--5.Vilket ?r det genomsnittliga antalet artister per spellista?
select
t1.[Name] as Spellista,
--count(distinct( t1.PlaylistId)) as AntalUnikaPlaylists,
avg(t5.artistid) as SnittArtister,
count(t5.artistid) as AntalArtister

from music.playlists t1

join music.playlist_track t2
on t1.PlaylistId=t2.PlaylistId

join music.tracks t3
on t2.TrackId=t3.TrackId

join music.albums t4
on t3.AlbumId=t4.AlbumId

join music.artists t5
on t4.ArtistId=t5.ArtistId

group by
t1.[Name]

