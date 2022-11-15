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



select * from Elements2;

--Delete from Elements2
--where Name in('Erbium', 'Helium', 'Nitrogen', 'Platinum', 'Selenium')
-- Or Name like 'D%'
-- Or Name like 'K%'
-- Or Name like 'M%'
-- or Name like 'O%'
-- or name like 'U%';

