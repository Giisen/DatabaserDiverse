use Everyloop;

--1.Ta ut data (select) fr�n tabellen GameOfThrones p� s�dant s�tt att ni f�r ut en kolumn �Title� med titeln samt en kolumn �Episode� som visar episoder och s�songer i formatet �S01E01�, �S01E02�, osv. Tips: kolla upp funktionen format()

--select * from GameOfThrones2

--select 
--title, 
--concat('S', format(season, '00'),
--'E', format(episode, '00')) as episode
--from GameOfThrones2;



--2.Uppdatera (kopia p�) tabellen user och s�tt username f�r alla anv�ndare s� den blir de 2 f�rsta bokst�verna i f�rnamnet, och de 2 f�rsta i efternamnet (ist�llet f�r 3+3 som det �r i orginalet). Hela anv�ndarnamnet ska vara i sm� bokst�ver.


--update Users2
--set UserName =Lower(concat(substring(FirstName,1,2),substring(LastName,1,2)));


--update Users2
--set UserName =concat(substring(Lower(FirstName),1,2),substring(Lower(LastName),1,2));


--select *
--from
--Users2;


--3.Uppdatera (kopia p�) tabellen airports s� att alla null-v�rden i kolumnerna Time och DST byts ut mot �-�


select * into Airports2 from Airports;

Update  Airports2
--set [Time]= COALESCE([Time],'-')
--set [DST] = COALESCE([DST],'-');
set [DST] = ISNULL([DST],'-');  --ISNull �r ett alternativ till coalesce


select * from Airports2;

--4.Ta bort de rader fr�n (kopia p�) tabellen Elements d�r �Name� �r n�gon av f�ljande: 'Erbium', 'Helium', 'Nitrogen', 'Platinum', 'Selenium', samt alla rader d�r �Name� b�rjar p� n�gon av bokst�verna d, k, m, o, eller u.

--select * into Elements2 from Elements;

--Delete from Elements2
--where Name in('Erbium', 'Helium', 'Nitrogen', 'Platinum', 'Selenium')
-- Or Name like 'D%'
-- Or Name like 'K%'
-- Or Name like 'M%'
-- or Name like 'O%'
-- or name like 'U%';

--select * from Elements2;

--5. Skapa en ny tabell med alla rader fr�n tabellen Elements. Den nya tabellen ska inneh�lla �Symbol� och �Name� fr�n orginalet, samt en tredje kolumn med v�rdet �Yes� f�r de rader d�r �Name� b�rjar med bokst�verna i �Symbol�, och �No� f�r de rader d�r de inte g�r det.

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


--6. Kopiera tabellen Colors till Colors2, men skippa kolumnen �Code�. G�r sedan en select fr�n Colors2 som ger samma resultat som du skulle f�tt fr�n select * from Colors; (Dvs, �terskapa den saknade kolumnen fr�n RGBv�rdena i resultatet).

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


--7.Kopiera kolumnerna �Integer� och �String� fr�n tabellen �Types� till en ny tabell. G�r sedan en select fr�n den nya tabellen som ger samma resultat som du skulle f�tt fr�n select * from types;
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


