
-----ACT 3

---0170203-2017 AS Customer Code :    	= Constructions.ConstructionCode
-- 2018/5/22 	AS Joutou Plan Date 	= ConstructionSchedule.ExpectedHouseRaisingDate
-- 2018/2/1 	AS KAKOUIRAI SEND  	= ConstructionSchedule.SentProcessRequestDate 
--2018/6/16     AS Shiage Delivery      = ConstructionDelivery.DeliveredFinishingMaterialDate
--14943         AS PlannerCode  	= Constructions.PlannerCode
--?͈??@?}??     AS PlannerName    	=PlannerName.EmployeeNam
--06474	    	AS DirectorCode 	=Constructions.ConstructionWorkerCode
--???c?@?[?k      AS DirectorName          =  Employees.EmployeeName


--CND: 1 plans with Joutou Plan Date of 2018
--CND: 2 Kakouirai Send of February 2018 include the Shiage Delivery, Planner and Director.


SELECT  Constructions.ConstructionCode , 
ConstructionSchedule.ExpectedHouseRaisingDate ,
ConstructionSchedule.SentProcessRequestDate , 
ConstructionDelivery.DeliveredFinishingMaterialDate,
Constructions.PlannerCode, 
Employees.EmployeeName,
Constructions.ConstructionWorkerCode,
PlannerName.EmployeeName FROM Constructions

INNER JOIN Employees
ON Constructions.ConstructionWorkerCode = Employees.EmployeeCode
INNER JOIN PlannerName
ON PlannerName.EmployeeCode= ConstructionS.PlannerCode
INNER JOIN ConstructionSchedule
ON Constructions.ConstructionCode=ConstructionSchedule.ConstructionCode
INNER JOIN ConstructionDelivery
ON ConstructionSchedule.ConstructionCode=ConstructionDelivery.ConstructionCode
WHERE ConstructionSchedule.ExpectedHouseRaisingDate  LIKE '%2018%'  
AND  SentProcessRequestDate  BETWEEN '2018/02/01 ' AND '2018/02/28'
