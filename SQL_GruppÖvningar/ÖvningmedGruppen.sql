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

--Ta bort de rader fr�n (kopia p�) tabellen Elements d�r �Name� �r n�gon av f�ljande: 'Erbium', 'Helium', 'Nitrogen', 'Platinum', 'Selenium', samt alla rader d�r �Name� b�rjar p� n�gon av bokst�verna d, k, m, o, eller u.

--select * into Elements2 from Elements;



--select * from Elements2;

--Delete from Elements2
--where Name in('Erbium', 'Helium', 'Nitrogen', 'Platinum', 'Selenium')
-- Or Name like 'D%'
-- Or Name like 'K%'
-- Or Name like 'M%'
-- or Name like 'O%'
-- or name like 'U%';


--Skapa en ny tabell med alla rader fr�n tabellen Elements. Den nya tabellen ska inneh�lla �Symbol� och �Name� fr�n orginalet, samt en tredje kolumn med v�rdet �Yes� f�r de rader d�r �Name� b�rjar med bokst�verna i �Symbol�, och �No� f�r de rader d�r de inte g�r det.

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

