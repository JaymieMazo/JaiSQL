ALTER TABLE FRIENDS ALTER COLUMN Firstname VARCHAR(20)


TRUNCATE TABLE FRIENDS


INSERT INTO FRIENDS
VALUES ('MEZA' ,'AL', 200,'555-2222', 'UK' ,NULL)

INSERT INTO FRIENDS
VALUES ('MERRICK' ,'BUD', 300,'555-6666', 'IL' ,80212)


INSERT INTO Friends
VALUES ('MAST' ,'JD', 381,'555-6767', 'CO' ,23456)


INSERT INTO Friends
VALUES ('BULHER' ,'FERRIS', 345,'555-3223', 'LA' ,23332)

INSERT INTO Friends
VALUES ('PERKINS ' ,'ALTON', 911,'555-3116', 'CA' ,95633)

INSERT INTO Friends
VALUES ('BOSS ' ,'SIR', 204,'555-2345', 'CT' ,95633)


Select * from FRIENDS

Select lastname from FRIENDS



Select * from FRIENDS
Where Lastname Like 'M%'

Select * from FRIENDS
Where ST= 'IL' AND Firstname ='AL'

Select * from FRIENDS
Where AreaCode BETWEEN 200 and 910


Select * from FRIENDS
Order by Lastname DESC

Select Firstname +  '      FROM' as NAME , ST from FRIENDS
Where Firstname='AL'  AND ST='IL'


Select Lastname + ', ' +  Firstname as NAME , Phone as PHONE from FRIENDS
Where Lastname='MERRICK' OR  Lastname='MAST'  OR  Lastname='BULHER' 

Select * from FRIENDS
where ZIP like '%33%'


Update  dbo.FRIENDS
set lastname='BUNDY'
Where lastname='BOSS' 

select * from FRIENDS
Order by Firstname 

Select * from FRIENDS
where Firstname ='AL' AND Lastname ='BUNDY'


Select * from FRIENDS
WHERE Firstname = 'AL'  OR  lastname ='BUNDY'

Select * from FRIENDS
WHERE Firstname = 'AL'  OR  Firstname = 'FERRIS'

Select count(*) from FRIENDS
where Firstname='AL'


Select  lastname + '     '    +   convert (VARCHAR(10),ZIP) as ZIPCODE
from Friends 


DELETE from FRIENDS
where zip is NULL


SELECT * INTO FRIENDS FROM Frien



