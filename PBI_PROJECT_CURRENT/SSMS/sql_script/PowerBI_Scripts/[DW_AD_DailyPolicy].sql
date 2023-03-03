USE [PowerBI]
GO

/****** Object:  View [DPO].[DW_AD_DailyPolicy]    Script Date: 7/26/2021 8:01:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER VIEW [DPO].[DW_AD_DailyPolicy] AS
WITH DateType2 AS (
SELECT	*
FROM 
(SELECT [Policy No]
      ,MIN([Issued Date]) AS FirstDate
	  ,MAX([Collected Date]) AS LastDate
      ,[Policy Status]
      ,[Issuing Agent]
  FROM [PowerBI].[DPO].[view_premium]
  WHERE [Policy Status] != 'PS_NNB'
  GROUP BY [Policy No],[Policy Status],[Issued Date],[Issuing Agent]
  ) AS DateType
  UNPIVOT(
		DateActive
		FOR DateType 
		IN (FirstDate, LastDate)) UNPVT
)
SELECT	[Issuing Agent]
		,AG.Date_Appointed
		,[Policy No]
		,DateActive
		,CountPolicy
		,AG.AD_Code
		,AG.AD_Code + REPLACE(CAST(DateActive AS date),'-','') AS ID
		,DATEDIFF(DAY,AG.Date_Appointed,DateActive) AS DateDif
FROM (
SELECT [Policy No],[Issuing Agent],DateActive,
	CASE 
	WHEN DateType = 'FirstDate' THEN 1
	WHEN [Policy Status] IN ('FL', 'PO', 'DC', 'WD', 'NT', 'CF') THEN -1
	ELSE 0 END AS CountPolicy
FROM DateType2
) AS DS
LEFT JOIN DW_Agent AG
ON DS.[Issuing Agent] = AG.Code
WHERE CountPolicy != 0

GO