/****** Script for SelectTopNRows command from SSMS  ******/
CREATE OR ALTER VIEW [DW_AD_Office_Code] AS
SELECT distinct [Sales_Unit_Code]
      ,[Sales_Unit]
	  ,[Area_Name]
FROM [PowerBI].[dbo].[Main_AGENT_INFO_DA]
--ORDER BY Sales_Unit_Code