USE [PowerBI]
GO

/****** Object:  View [DPO].[AD_Security]    Script Date: 12/14/2021 12:57:31 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [DPO].[AD_Security] AS 
SELECT DISTINCT IIF(RIGHT([AD Code],1) = 'C' OR RIGHT([AD Code],2) LIKE 'C%', LEFT([AD Code],5), [AD Code]) AS AD_Code
      ,[AD Name] AS AD_Name
      ,[AD user Name] AS ADUsername
  FROM [PowerBI].[DPO].[DP_AD_TARGET]
  WHERE [AD Code] IS NOT NULL --AND RIGHT([AD Code],1) = 'C' OR RIGHT([AD Code],2) LIKE 'C%'
  --AND [AD Code] <> 'AD421'

  UNION

 SELECT 'AD275' AS AD_Code
      ,'MINH' AS AD_Name
      ,'PHUHUNGLIFE\vagy0758' AS ADUsername
  FROM [PowerBI].[DPO].[DP_AD_TARGET]
GO


