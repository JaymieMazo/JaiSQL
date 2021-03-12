
-----ACT 2

---2820277-2016 AS Customer Code :    	= Constructions.ConstructionCode
-- YJ590  	    AS House Code 			=Construction.NAMECODE
--  2017/11/25  AS Joutou Plan date  	= ConstructionSchedule.ExpectedHouseRaisingDate
-- 2017/11/25   AS Joutoudate           = ConstructionSchedule.HouseRaisingDate
--2017/5/28     AS KAKOUIRAI SEND DATE  = HrdInformationService.dbo.ConstructionSchedule.SentProcessRequestDate
--2017/5/29     AS KAKOUIRAI (CADD DATE)= HrdInformationService.dbo.ConstructionSchedule.ProcessingRequestAcceptedDate
--240+          AS KANABAKARI           =BasicSpecificationDetails.SpecificationDetailName 


--CND: 1 2017/11/25   Joutou date of January 25, 2017 to November 25, 2017,
--CND: 2  include the other data


SELECT  Constructions.ConstructionCode AS  'Customer Code', 
Constructions.NAMECODE AS '	House Code', 
ConstructionSchedule.ExpectedHouseRaisingDate AS 'Joutou Plan Date', 
ConstructionSchedule.HouseRaisingDate AS 'Joutou Date' ,
ConstructionSchedule.SentProcessRequestDate AS 'KAKOUIRAI SEND DATE', 
ConstructionSchedule.ProcessingRequestAcceptedDate AS  'KAKOUIRAI (CADD DATE)',
BasicSpecificationDetails.SpecificationDetailName AS 'KANABAKARI'
FROM Constructions
INNER JOIN ConstructionSchedule
ON Constructions.ConstructionCode=ConstructionSchedule.ConstructionCode
INNER JOIN BasicSpecificationDetails
ON ConstructionSchedule.ConstructionCode=BasicSpecificationDetails.ConstructionCode
WHERE Constructions.ConstructionCode= '2820277-2016'
AND ConstructionSchedule.HouseRaisingDate >='January 25, 2017'
 AND  ConstructionSchedule.HouseRaisingDate <='November 25, 2017'


--------

SELECT  Constructions.ConstructionCode , 
Constructions.NAMECODE , 
ConstructionSchedule.ExpectedHouseRaisingDate , 
ConstructionSchedule.HouseRaisingDate  ,
ConstructionSchedule.SentProcessRequestDate , 
ConstructionSchedule.ProcessingRequestAcceptedDate,
BasicSpecificationDetails.SpecificationDetailName 
FROM Constructions
INNER JOIN ConstructionSchedule
ON Constructions.ConstructionCode=ConstructionSchedule.ConstructionCode
INNER JOIN BasicSpecificationDetails
ON ConstructionSchedule.ConstructionCode=BasicSpecificationDetails.ConstructionCode
WHERE Constructions.ConstructionCode= '2820277-2016'
AND ConstructionSchedule.HouseRaisingDate BETWEEN '2017/11/25' 
AND  '2017/11/25'
