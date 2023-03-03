/****** Script for SelectTopNRows command from SSMS  ******/
WITH A AS (
SELECT [Policy No]
      ,[Product Code]

  FROM [PowerBI].[dbo].[DP_TAGENTPREMIUM_TEST]
  WHERE [Collected Date] > '2021/04/30' AND [Collected Date] < '2021/06/01' AND [Issued Date] > '2021/04/30'
  ),

  B AS (

  SELECT A.[Policy No], count(Distinct A.[Product Code]) -1 AS Rider
  FROM A
  GROUP BY A.[Policy No]
  )

  SELECT *
  FROM B
  WHERE B.Rider >= 5
