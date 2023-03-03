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
      ,[Status_date] AS Start_date
      ,[Status] 
	  --,[Update_Time]
  FROM [DPO].[AD_STRUCTURE2]
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
      ,[Status_date]
      ,[Status] 
)
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


