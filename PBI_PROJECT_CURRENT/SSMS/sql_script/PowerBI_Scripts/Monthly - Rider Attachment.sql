/****** Script for SelectTopNRows command from SSMS  ******/
WITH A AS (
SELECT [Policy No]
      ,[Product Code]
	  , MONTH([Issued Date]) AS M
	  , YEAR([Issued Date]) AS Y
  FROM [PowerBI].[DPO].[DP_TAGENTPREMIUM_TEST]
  --WHERE [Collected Date] > '2021/06/30' AND [Collected Date] <= '2021/07/31' AND [Issued Date] > '2021/06/30'
  GROUP BY [Policy No]
      ,[Product Code]
	  , MONTH([Issued Date])
	  , YEAR([Issued Date])
-- ORDER BY [Policy No]
  )
  , B AS (
  SELECT --[Issuing Agent]
      --,[Date_Appointed]
      --,
	  [Policy No]
      --,[DateActive]
      ,SUM([CountPolicy]) AS CO
      --,[AD_Code]
      --,[ID]
      --,[DateDif]
  FROM [PowerBI].[DPO].[DW_AD_DailyPolicy]
  --WHERE [DateActive] >= '2021-07-01' AND [DateActive] < '2021-08-01'
  GROUP BY [Policy No]
  --HAVING SUM([CountPolicy]) <= 0


  )
  , D AS (
  SELECT A.[Policy No]
  ,A.[Product Code]
  ,A.M AS MonthIssued
  ,A.Y AS YearIssued
  , B.CO
  FROM A LEFT JOIN B ON A.[Policy No] = B.[Policy No]
  WHERE CO > 0
  --GROUP BY A.[Policy No], B.CO

  )
  
,E AS (

  SELECT D.[Policy No]
	  , count(Distinct D.[Product Code]) -1 AS Rider
	  ,D.MonthIssued
	  ,D.YearIssued
  FROM D
  GROUP BY D.[Policy No]	  
		,D.MonthIssued
		,D.YearIssued
  --ORDER BY D.[Policy No]
 )
 , MonthlyCasecount AS (
 SELECT MONTH([DateActive]) AS MonthActive
	  ,YEAR([DateActive]) AS YearActive
      ,SUM([CountPolicy]) AS CaseCount

  FROM [PowerBI].[DPO].[DW_AD_DailyPolicy]
  GROUP BY MONTH([DateActive])
	  ,YEAR([DateActive])
  --ORDER BY YEAR([DateActive]), MONTH([DateActive])
 )
, Temp2 AS (
  SELECT 
	  SUM(E.Rider) AS SumRider
  	  ,E.MonthIssued
	  ,E.YearIssued
  FROM E
  GROUP BY E.MonthIssued
	  ,E.YearIssued
  --WHERE E.Rider >= 5
  --ORDER BY E.YearIssued, E.MonthIssued
  )
, Temp3 AS (
  SELECT 
	  COUNT(E.[Policy No]) AS Over5Rider
  	  ,E.MonthIssued
	  ,E.YearIssued
  FROM E
  WHERE E.Rider >= 5
  GROUP BY  E.MonthIssued
	  ,E.YearIssued
)


----, Temp4 AS (
  SELECT Temp2.YearIssued AS YearCount
		,Temp2.MonthIssued AS MonthCount
		,MC.CaseCount
		,Temp2.SumRider
		,Over5.Over5Rider
		,Temp2.SumRider * 1./ MC.CaseCount  AS AverageRider
		,Over5.Over5Rider * 1. / MC.CaseCount  AS Over5RiderPercent
  FROM Temp2
  LEFT JOIN MonthlyCasecount AS MC
  ON Temp2.MonthIssued = MC.MonthActive
  AND Temp2.YearIssued = MC.YearActive

  LEFT JOIN Temp3 AS Over5
  ON Temp2.MonthIssued = Over5.MonthIssued
  AND Temp2.YearIssued = Over5.YearIssued

  ORDER BY Temp2.YearIssued, Temp2.MonthIssued
--  --)

  
