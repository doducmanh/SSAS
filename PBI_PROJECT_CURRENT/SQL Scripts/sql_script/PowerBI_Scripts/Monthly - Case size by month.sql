/****** Script for SelectTopNRows command from SSMS  ******/
WITH K AS (
SELECT [Policy No]
      ,SUM([FYP]) AS FYP
      ,MONTH([Issued Date]) AS Month_Issued
	  ,YEAR([Issued Date]) AS Year_Issued
	  , IIF(SUM([FYP]) >= 5000000 AND SUM([FYP]) < 12000000,1,0) AS FYP5
	  , IIF(SUM([FYP]) >= 12000000 AND SUM([FYP]) < 25000000,1,0) AS FYP12
	  --, IIF(SUM([FYP]) >= 15000000 AND SUM([FYP]) < 20000000,1,0) AS FYP15
	  --, IIF(SUM([FYP]) >= 20000000 AND SUM([FYP]) < 25000000,1,0) AS FYP20
	  --, IIF(SUM([FYP]) >= 25000000 AND SUM([FYP]) < 30000000,1,0) AS FYP25
	  , IIF(SUM([FYP]) >= 25000000,1,0) AS FYP25
	

  FROM [PowerBI].[DPO].[DP_TAGENTPREMIUM_TEST]
  GROUP BY [Policy No]      ,MONTH([Issued Date])
	  ,YEAR([Issued Date])
	  )

	  SELECT Month_Issued, Sum(FYP5) AS F5, SUM(FYP12) AS F12, SUM(FYP25) AS F25
	  FROM K
	  WHERE Year_Issued = 2021
	  GROUP BY Month_Issued
	  ORDER BY Month_Issued