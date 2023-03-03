/****** Script for SelectTopNRows command from SSMS  ******/
SELECT YEAR([Collected Date]) AS YearCollected
	  ,MONTH([Collected Date]) AS MonthCollected
	  ,DAY([Collected Date]) AS DayCollected
	  ,SUM([FYP]) AS FYP
      ,SUM([RYP]) AS RYP
      ,SUM([Topup Premium]) AS TOPUP
	  ,SUM([FYP]) + SUM([Topup Premium])*0.1 AS FYPinclTopup

  FROM [PowerBI].[dbo].[DP_TAGENTPREMIUM_TEST]
  GROUP BY MONTH([Collected Date]), YEAR([Collected Date]),DAY([Collected Date])
  ORDER BY YEAR([Collected Date]), MONTH([Collected Date]),DAY([Collected Date])
  --WHERE [Collected Date] > '2021/05/31'