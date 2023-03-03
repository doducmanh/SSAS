/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [Territory_Code]
      ,COUNT(DISTINCT [AD_Code])
      ,[AD_Grade]
  FROM [PowerBI].[DPO].[Main_AD_STRUCTURE_FULL]
  WHERE [ExplodedDate] = '2021-12-01' AND [Terminated_Date] IS NULL
  GROUP BY [AD_Grade], [Territory_Code]