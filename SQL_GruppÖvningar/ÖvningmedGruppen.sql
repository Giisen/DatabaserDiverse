use Everyloop;

--1.Ta ut data (select) från tabellen GameOfThrones på sådant sätt att ni får ut en kolumn ’Title’ med titeln samt en kolumn ’Episode’ som visar episoder och säsonger i formatet ”S01E01”, ”S01E02”, osv. Tips: kolla upp funktionen format()

--select * from GameOfThrones2

--select 
--title, 
--concat('S', format(season, '00'),
--'E', format(episode, '00')) as episode
--from GameOfThrones2;



--2.Uppdatera (kopia på) tabellen user och sätt username för alla användare så den blir de 2 första bokstäverna i förnamnet, och de 2 första i efternamnet (istället för 3+3 som det är i orginalet). Hela användarnamnet ska vara i små bokstäver.


--update Users2
--set UserName =Lower(concat(substring(FirstName,1,2),substring(LastName,1,2)));


--update Users2
--set UserName =concat(substring(Lower(FirstName),1,2),substring(Lower(LastName),1,2));


--select *
--from
--Users2;


--3.Uppdatera (kopia på) tabellen airports så att alla null-värden i kolumnerna Time och DST byts ut mot ’-’


select * into Airports2 from Airports;

Update  Airports2
--set [Time]= COALESCE([Time],'-')
--set [DST] = COALESCE([DST],'-');
set [DST] = ISNULL([DST],'-');  --ISNull är ett alternativ till coalesce


select * from Airports2;

--4.Ta bort de rader från (kopia på) tabellen Elements där ”Name” är någon av följande: 'Erbium', 'Helium', 'Nitrogen', 'Platinum', 'Selenium', samt alla rader där ”Name” börjar på någon av bokstäverna d, k, m, o, eller u.

--select * into Elements2 from Elements;

--Delete from Elements2
--where Name in('Erbium', 'Helium', 'Nitrogen', 'Platinum', 'Selenium')
-- Or Name like 'D%'
-- Or Name like 'K%'
-- Or Name like 'M%'
-- or Name like 'O%'
-- or name like 'U%';

--select * from Elements2;

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

--select 
--Name,
--Red,
--Green,
--Blue
--into Colors3 from Colors;

--select 
--Name,
--concat('#',
--format(Red,'X2')+
--format(Green,'X2')+
--format(blue,'X2')) as code,
--Red,
--Green,
--Blue
--from colors3;

--select * from Colors


--7.Kopiera kolumnerna ”Integer” och ”String” från tabellen ”Types” till en ny tabell. Gör sedan en select från den nya tabellen som ger samma resultat som du skulle fått från select * from types;
--drop table Types2
--select
--[Integer],
--String
--into [Types2] from [Types];

--select
--t1.[Integer],
--t1.string,
--t2.[Float],
--t2.[DateTime],
--t2.[Bool]
--from [Types2] t1
--left join [Types] t2
--on t1.[Integer]=t2.[Integer];

select 
[Integer],
[Integer] *0.01 as [Float],
[String],
DATETIME2FROMPARTS(2019,01,[Integer],09,[Integer],0,0,7) as [DateTime],
Integer%2 as Bool
from Types2;


