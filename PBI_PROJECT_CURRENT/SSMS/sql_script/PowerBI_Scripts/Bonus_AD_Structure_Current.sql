CREATE OR ALTER VIEW [AD_Current] AS
WITH Q AS (
SELECT DISTINCT [AD_Code]
      ,MAX([ExplodedDate]) AS END_DATE
FROM [PowerBI].[DPO].[AD5]
GROUP BY [AD_Code]
)

SELECT DISTINCT AD.[AD_Code]
      --,G0.Territory
	  --,G0.AD_Name AS AD_Name, G0.Grade AS AD_Grade,G0.Status
	  --,Appointed.Status_date AS Appointed_Date
      ,[ExplodedDate] AS Status_Date
      --,[L0]
      ,[L1]--,G1.AD_Name AS L1_Name, G1.Grade AS L1_Grade
      ,[L2]--,G2.AD_Name AS L2_Name, G2.Grade AS L2_Grade
      ,[L3]--,G3.AD_Name AS L3_Name, G3.Grade AS L3_Grade
      ,[L4]--,G4.AD_Name AS L4_Name, G4.Grade AS L4_Grade
  FROM Q LEFT JOIN [PowerBI].[DPO].[AD5] AS AD
  ON Q.AD_Code = AD.AD_Code
  AND Q.END_DATE = AD.ExplodedDate

  --LEFT JOIN [DPO].[AD] AS G0
  --ON G0.AD_Code = AD.AD_Code

  --LEFT JOIN [DPO].[AD] AS G1
  --ON G1.AD_Code = AD.L1

  --LEFT JOIN [DPO].[AD] AS G2
  --ON G2.AD_Code = AD.L2

  --LEFT JOIN [DPO].[AD] AS G3
  --ON G3.AD_Code = AD.L3

  --LEFT JOIN [DPO].[AD] AS G4
  --ON G4.AD_Code = AD.L4

  --LEFT JOIN [dbo].[Main_AD_STRUCTURE] AS Appointed
  --ON Appointed.AD_Code = AD.[AD_Code]
  --AND Appointed.Status = 'Appointed'
