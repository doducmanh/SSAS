USE [PowerBI]
GO

/****** Object:  View [DPO].[AD_STRUCTURE_Start_End]    Script Date: 7/26/2021 9:09:41 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER VIEW [DPO].[AD_STRUCTURE_Start_End0] AS
WITH Q AS (
SELECT [AD_Code]
      --,[AD_Name]
      ,[Grade]
      ,[AD_Parent_Code]
      --,[AD_Parent]
      --,[Territory]
      ,[Territory_Code]
      --,[Office]
      --,[Office_Code]
      ,[Status_Month] AS Start_date
      ,[Status] 
	  --,[Update_Time]
  FROM [DPO].[AD_STRUCTURE0]
  --WHERE [Status] <> 'Office / Territory' 
  GROUP BY [AD_Code]
      --,[AD_Name]
      ,[Grade]
      ,[AD_Parent_Code]
      --,[AD_Parent]
      --,[Territory]
      ,[Territory_Code]
      --,[Office]
      --,[Office_Code]
      ,[Status_Month]
      ,[Status] 
)
,F AS (
SELECT Q.[AD_Code] 
      --,Q.[AD_Name]
      ,Q.[Grade]
      ,Q.[AD_Parent_Code]
      --,Q.[AD_Parent]
      --,[Territory]
      ,[Territory_Code]
      --,[Office]
      --,[Office_Code]
      ,Q.[Start_date]
	  ,LEAD([Start_date]) OVER (PARTITION BY AD_Code ORDER BY [Start_date]) AS End_Date
	  ,[Status] 

FROM Q
)

SELECT F.AD_Code, F.Grade, F.AD_Parent_Code, F.Territory_Code, F.Start_date, F.End_Date, F.Status
FROM   F
--WHERE NOT ((F.End_Date IS NULL) AND (F.Status = 'Terminated'))
GO