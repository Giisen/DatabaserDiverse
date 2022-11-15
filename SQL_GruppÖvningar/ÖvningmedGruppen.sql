use Everyloop;


--select 
--title, 
--concat('S', format(season, '00'), 
--'E', format(episode, '00')) as episode
--from GameOfThrones2;


--select * into Users2 from Users;


--Alter table Users2
--add UserName2 nvarchar(4);

--update Users2
--set UserName2 =concat(substring(Lower(FirstName),1,2),substring(Lower(LastName),1,2));

--select *
--from
--Users2;

--select * into Airports2 from Airports;

--Update  Airports2
----set [Time]= COALESCE([Time],'-')
--set [DST] = COALESCE([DST],'-');

--select * from Airports2;

--Ta bort de rader från (kopia på) tabellen Elements där ”Name” är någon av följande: 'Erbium', 'Helium', 'Nitrogen', 'Platinum', 'Selenium', samt alla rader där ”Name” börjar på någon av bokstäverna d, k, m, o, eller u.

--select * into Elements2 from Elements;



--select * from Elements2;

--Delete from Elements2
--where Name in('Erbium', 'Helium', 'Nitrogen', 'Platinum', 'Selenium')
-- Or Name like 'D%'
-- Or Name like 'K%'
-- Or Name like 'M%'
-- or Name like 'O%'
-- or name like 'U%';


--5. Skapa en ny tabell med alla rader från tabellen Elements. Den nya tabellen ska innehålla ”Symbol” och ”Name” från orginalet, samt en tredje kolumn med värdet ’Yes’ för de rader där ”Name” börjar med bokstäverna i ”Symbol”, och ’No’ för de rader där de inte gör det.

--select * from Elements3;

--select 
--Symbol,
--Name,
--case 
--when Symbol like left([Name],1) 
--or Symbol like left([Name],2) 
--then 'Yes' else 'No' 
--end as [Match]
--into Elements3 from Elements;

--select * from Elements3;


--6. Kopiera tabellen Colors till Colors2, men skippa kolumnen ”Code”. Gör sedan en select från Colors2 som ger samma resultat som du skulle fått från select * from Colors; (Dvs, återskapa den saknade kolumnen från RGBvärdena i resultatet).

--select
--Code
--into Colors2 from Colors;

--select
--t1.Code,
--t2.Red,
--t2.Green,
--t2.Blue
--from
--Colors2 t1
--left join Colors t2
--on t1.Code=t2.Code;

