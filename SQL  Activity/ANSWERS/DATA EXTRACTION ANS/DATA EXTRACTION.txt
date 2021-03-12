DATA EXTRACTION1

---Cnd: 
1. Joutou date of November 1, 2017 onwards, 
2. 鉄筋コンクリート高耐久高耐震布基礎(基礎巾160㎜) Plans only.


---Output:

Customer Code.....2820277-2016	
Kiso Start Date	..2017/9/11
Joutou Plan Date..2017/11/25	
Product Code	..0100028
Product Name	..鉄筋コンクリート高耐久高耐震布基礎(基礎巾160㎜)



---References:
 Customer Code   = ConstructionSchedule.StartedFoundationWorkDate AS 'Kiso Start Date'
 Kiso Start Date = ConstructionSchedule.StartedFoundationWorkDate AS 'Kiso Start Date'
 Joutou Plan Date= ConstructionSchedule.ExpectedHouseRaisingDate AS 'Joutou Plan Date'
 Product Code    = SpecificationProductDetails.ProductCode 
 Product Name    = SpecificationProductDetails.ProductName

---Queries:

SELECT  Constructions.ConstructionCode AS 'Construction Code', 
ConstructionSchedule.StartedFoundationWorkDate AS 'Kiso Start Date', 
ConstructionSchedule.ExpectedHouseRaisingDate AS 'Joutou Plan Date', 
SpecificationProductDetails.ProductCode,SpecificationProductDetails.ProductNAme
FROM Constructions

INNER JOIN ConstructionSchedule
ON Constructions.ConstructionCode=ConstructionSchedule.ConstructionCode
INNER JOIN SpecificationProductDetails
ON ConstructionSchedule.ConstructionCode=SpecificationProductDetails.ConstructionCode
WHERE ExpectedHouseRaisingDate >'2017/11/01' 
AND SpecificationProductDetails.ProductName='鉄筋コンクリート高耐久高耐震ベタ基礎(基礎巾160㎜)'




