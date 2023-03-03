/****** Script for SelectTopNRows command from SSMS  ******/
With Agent AS (
SELECT distinct P.[Policy No]
      ,P.[Policy Status]
      ,P.[Issued Date]
	  ,P.[Issuing Agent]
	  ,a.[Date_Appointed]
	  ,IIF(DATEDIFF(day, a.[Date_Appointed], P.[Issued Date]) <= 15,1,0) AS Day15
	  ,IIF(DATEDIFF(day, a.[Date_Appointed], P.[Issued Date]) <= 30,1,0) AS Day30
	  ,IIF(DATEDIFF(day, a.[Date_Appointed], P.[Issued Date]) <= 60,1,0) AS Day60
	  ,IIF(DATEDIFF(day, a.[Date_Appointed], P.[Issued Date]) <= 90,1,0) AS Day90
FROM [PowerBI].[dbo].[DP_TAGENTPREMIUM_TEST] AS P
LEFT JOIN [dbo].[Main_AGENT_INFO_DA] AS a
ON a.Agent_Number = P.[Issuing Agent]
),
GroupByAgent AS (
SELECT Agent.[Issuing Agent], YEAR(Agent.Date_Appointed) AS YearApp, MONTH(Agent.Date_Appointed) AS MonthApp, SUM(Agent.Day15) AS Day15,SUM(Agent.Day30) AS Day30,SUM(Agent.Day60) AS Day60,SUM(Agent.Day90) AS Day90
FROM Agent
GROUP BY MONTH(Agent.Date_Appointed), YEAR(Agent.Date_Appointed), Agent.[Issuing Agent]
),
Classify AS (
SELECT GroupByAgent.*, 	IIF(GroupByAgent.Day15 >= 1, 1,0) AS Day151
	,IIF(GroupByAgent.Day30 >= 3, 1,0) AS Day303
	,IIF(GroupByAgent.Day60 >= 5, 1,0) AS Day605
	,IIF(GroupByAgent.Day90 >= 6, 1,0) AS Day906

FROM GroupByAgent)

SELECT Classify.YearApp, Classify.MonthApp, SUM(Classify.Day151) AS Day151, SUM(Classify.Day303) AS Day303, SUM(Classify.Day605) AS Day605, SUM(Classify.Day906) AS Day906
FROM Classify
GROUP BY Classify.YearApp, Classify.MonthApp
ORDER By Classify.YearApp DESC, Classify.MonthApp
