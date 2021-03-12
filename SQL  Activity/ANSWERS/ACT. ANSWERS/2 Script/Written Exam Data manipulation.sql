--DATA MANIPULATION WRITTEN EXAM

--NO. 1
CREATE TABLE zEmployees
(
EmployeeId INT  NOT NULL,
LastName VARCHAR (30) NOT NULL,
FirstName VARCHAR (30) NOT NULL,
Age INT NOT NULL,
PositionCd INT NULL
)


CREATE TABLE zPositions
(
PositionCd INT  NOT NULL,
PositionName VARCHAR (30) NOT NULL,
NotFlagUse int NULL,


PRIMARY KEY (PositionCd)
)


--NO. 2
ALTER TABLE zEmployees ADD PRIMARY KEY (EmployeeId) 




-------**************------------
ALTER TABLE zEmployees ADD FOREIGN KEY (PositionCd) REFERENCES zPositions (PositionCd)
ALTER TABLE zEmployees DROP  CONSTRAINT FK__zEmployee__Posit__16CE6296

SELECT zEmployees.lastname FROM zEmployees
INNER JOIN zPositions
ON zEmployees.PositionCd=zPositions.PositionCd
WHERE zPositions.PositionName='Staff'
		
		
INSERT INTO zEmployees(EMPLOYeeId, LastName, Firstname, age, PositionCd)
VALUES (02, 'Denver', 'John', 25, 002),
		(04, 'hhh', 'KK', 26, 002)
		
		
INSERT INTO zEmployees(EMPLOYeeId, LastName, Firstname, age, PositionCd)
VALUES(03, 'Standard', 'Jonas', 30, NULL)
----------****************----------------



--NO. 3
INSERT INTO zEmployees(EMPLOYeeId, LastName, Firstname, age, PositionCd)
VALUES (01, 'Smith', 'John',23 ,001),
		(02, 'Denver', 'John', 25, 002),
		(03, 'Standard', 'Jonas', 30, NULL),
		(04, 'hhh', 'KK', 26, 002)
		
		
INSERT INTO zPositions(PositionCd, PositionName, NotFlagUse)
VALUES (001, 'Manager',  11),
		(002, 'Staff', 22),
		(003, 'Asst Mngr',33)	

--NO. 4  COUNT EMPLOYEE WITH STAFF AS POSITION
SELECT count(EMPLOYEEID) FROM zEmployees
INNER JOIN zPositions
ON zEmployees.PositionCd = zPositions.PositionCd
WHERE zPositions.PositionName='Staff'



--NO. 5 DELETE THE TABLE POSITIONS

DROP TABLE zPositions


--NO. 6  DISPLAY YOUNGEST EMPLOYEE

SELECT TOP 1LASTNAME  , min (AGE) AS 'Minimum Age' FROM zEmployees
GROUP BY AGE, LASTNAME 
HAVING AGE = MIN(AGE)  ORDER BY AGE ASC

SELECT min age FROM 


--NO.7 TRANSFER CONTENT OF POSITIONS IN OFFICE_POSITIONS

SELECT * INTO zOffice_Positions FROM zPositions


		
--NO.8	DELETE EMPLOYE WITH STAFF AS POSITION

DELETE FROM zEmployees 
WHERE PositionCd IN (SELECT PositionCd  FROM  zPositions  WHERE PositionName ='Staff')
	
	
--NO. 9    
DELETE FROM zEmployees
WHERE PositionCd IS NULL


--NO. 10




		
		
		



