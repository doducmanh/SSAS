USE [PowerBI]
GO

/****** Object:  View [DPO].[AD4]    Script Date: 7/26/2021 8:42:30 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Script for SelectTopNRows command from SSMS  ******/
CREATE OR ALTER VIEW [DPO].[AD4] AS
WITH G AS (
SELECT [AD_Code]
      ,[Grade]
	  ,[AD_Parent_Code]
      ,[ExplodedDate]
  FROM [PowerBI].[DPO].[AD_STRUCTURE_Exploded]
)

SELECT 
	A.AD_Code
	, A.Grade AS AD_Grade
	--IIF(A.[AD_Parent_Code] IS NULL,'', A.[AD_Parent_Code]) AS [AD_Parent_Code]
	 ,IIF(A.[Territory_Code] IS NULL, 'PHL', A.[Territory_Code]) AS [Territory_Code]
	--,IIF(A.[Office_Code] IS NULL, 'PHL', A.[Office_Code]) AS [Office_Code]
	,A.[ExplodedDate]
	,[Start_date]
    ,[End_Date]
    ,[Status]
	--, A.AD_Code AS AD_Code
	--, A.Grade AS AD_Grade
	, G1.AD_Code AS L1
	, G1.Grade AS L1G
	, G2.AD_Code AS L2
	, G2.Grade AS L2G
	, G3.AD_Code AS L3
	, G3.Grade AS L3G
	, G4.AD_Code AS L4
	, G4.Grade AS L4G

FROM [PowerBI].[DPO].[AD_STRUCTURE_Exploded] AS A
LEFT JOIN G AS G1 ON A.[AD_Parent_Code] = G1.AD_Code AND A.ExplodedDate = G1.ExplodedDate
LEFT JOIN G AS G2 ON G1.AD_Parent_Code = G2.AD_Code AND A.ExplodedDate = G2.ExplodedDate
LEFT JOIN G AS G3 ON G2.AD_Parent_Code = G3.AD_Code AND A.ExplodedDate = G3.ExplodedDate
LEFT JOIN G AS G4 ON G3.AD_Parent_Code = G4.AD_Code AND A.ExplodedDate = G4.ExplodedDate
GO