/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [Commission Agent]
	  ,SUM([FYC]) AS FYC
      ,SUM([RYC]) AS RYC
      
	  --,[Collected Date]
	  ,MONTH([Collected Date]) AS MONTH_Collected
	  ,YEAR([Collected Date]) AS YEAR_Collected
FROM [PowerBI].[DPO].[DP_TAGENTCOMM_TEST]
GROUP BY   [Commission Agent]
	  --,[Collected Date]
	  ,MONTH([Collected Date]) ,YEAR([Collected Date])
ORDER BY  [Commission Agent]
	  ,YEAR([Collected Date])
	  ,MONTH([Collected Date]) 