USE [PowerBI]
GO

/****** Object:  View [DPO].[AD5]    Script Date: 7/26/2021 8:39:53 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Script for SelectTopNRows command from SSMS  ******/
CREATE OR ALTER VIEW [DPO].[AD5] AS
WITH Q AS 
(
SELECT [AD_Code]
      --,[Grade]
      --,[AD_Parent_Code]
      ,[Territory_Code]
      --,[Office_Code]
      --,[Start_date]
      --,[End_Date]
      --,[Status]
      ,[ExplodedDate]
      --,[AD_Code]
      --,[AD_Grade]
	  --,[L1]
   --   ,[L1G]
   --   ,[L2]
   --   ,[L2G]
   --   ,[L3]
   --   ,[L3G]
   --   ,[L4]
   --   ,[L4G]
	  	  ,CASE
	  WHEN [AD_Grade] LIKE '%CDO' THEN [AD_Code]
	  WHEN [L1G] LIKE '%CDO' THEN [L1]
	  WHEN [L2G] LIKE '%CDO' THEN [L2]
	  WHEN [L3G] LIKE '%CDO' THEN [L3]
	  WHEN [L4G] LIKE '%CDO' THEN [L4]
	  ELSE 'PHL'
	  END AS L0
	  ,CASE
	  WHEN [AD_Grade] LIKE '%TD' THEN [AD_Code]
	  WHEN [L1G] LIKE '%TD' THEN [L1]
	  WHEN [L2G] LIKE '%TD' THEN [L2]
	  WHEN [L3G] LIKE '%TD' THEN [L3]
	  WHEN [L4G] LIKE '%TD' THEN [L4]
	  ELSE NULL
	  END AS L1
	  ,CASE
		  WHEN [AD_Grade] LIKE '%SRD' THEN [AD_Code]
		  WHEN [L1G] LIKE '%SRD' THEN [L1]
		  WHEN [L2G] LIKE '%SRD' THEN [L2]
		  WHEN [L3G] LIKE '%SRD' THEN [L3]
		  WHEN [L4G] LIKE '%SRD' THEN [L4]
	  ELSE NULL
	  END AS L2
	  ,CASE
	  WHEN [AD_Grade] IN('RD','RAD','ARD') THEN [AD_Code]
	  WHEN [L1G]  IN('RD','RAD','ARD') THEN [L1]
	  WHEN [L2G]  IN('RD','RAD','ARD') THEN [L2]
	  WHEN [L3G]  IN('RD','RAD','ARD') THEN [L3]
	  WHEN [L4G]  IN('RD','RAD','ARD') THEN [L4]
	  ELSE NULL
	  END AS L3
	  	  ,CASE
	  WHEN [AD_Grade] LIKE '%ZD' THEN [AD_Code]
	  WHEN [L1G] LIKE '%ZD' THEN [L1]
	  WHEN [L2G] LIKE '%ZD' THEN [L2]
	  WHEN [L3G] LIKE '%ZD' THEN [L3]
	  WHEN [L4G] LIKE '%ZD' THEN [L4]
	  ELSE NULL
	  END AS L4
	  	  ,CASE
	  WHEN [AD_Grade] LIKE '%SE' THEN [AD_Code]
	  WHEN [L1G] LIKE '%SE' THEN [L1]
	  WHEN [L2G] LIKE '%SE' THEN [L2]
	  WHEN [L3G] LIKE '%SE' THEN [L3]
	  WHEN [L4G] LIKE '%SE' THEN [L4]
	  ELSE NULL
	  END AS SE
  FROM [PowerBI].[DPO].[AD4]
  WHERE [PowerBI].[DPO].[AD4].[ExplodedDate] IS NOT NULL
)
SELECT Q.*
	, CONCAT( Q.L0 + '|', Q.L1 + '|', Q.L2 +'|', Q.L3 + '|', Q.L4) AS Structure
	, COALESCE (L0, L1, L2, L3, L4, SE, AD_Code) AS L0new
	, COALESCE (L1, L2, L3, L4, SE, AD_Code, L0) AS L1new
	, COALESCE (L2, L3, L4, SE, AD_Code, L1, L0) AS L2new
	, COALESCE (L3, L4, SE, AD_Code, L2, L1, L0) AS L3new
	, COALESCE (L4, SE, AD_Code, L3, L2, L1, L0) AS L4new
	--, Q.SE
FROM Q

--ORDER BY Q.AD_Code, Q.ExplodedDate
GO