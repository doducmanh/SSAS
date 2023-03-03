USE [PowerBI]
GO

/****** Object:  View [DPO].[Cal_Active_Agent_by_Month]    Script Date: 10/23/2021 11:43:35 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


/****** Script for SelectTopNRows command from SSMS  ******/
CREATE   VIEW [DPO].[Cal_Active_Agent_by_Month] AS
WITH Temp1 AS (
SELECT [Issuing Agent]
      --,[Date_Appointed]
      ,[Policy No]
      --,MONTH([DateActive]) AS MONTH_ACTIVE
	  ,CONVERT(CHAR(6),[DateActive],112) AS MONTH_ACTIVE
      ,SUM(CountPolicy) AS NET_CC
      --,[AD_Code]
      --,[ID]
      --,[DateDif]
  FROM [PowerBI].[DPO].[DW_AD_DailyPolicy]
  
  GROUP BY [AD_Code], CONVERT(CHAR(6),[DateActive],112)
        --,MONTH([DateActive])
	  --,YEAR([DateActive])
	  ,[Policy No],[Issuing Agent]
  HAVING SUM(CountPolicy) <> 0
--ORDER BY [Issuing Agent] DESC
--        ,MONTH([DateActive])
--	  , [AD_Code]
)
, Temp2 AS (
SELECT
	Temp1.[Issuing Agent] + Temp1.MONTH_ACTIVE AS ID
	,Temp1.[Issuing Agent]
	,Temp1.MONTH_ACTIVE
	,SUM(NET_CC) AS CASE_COUNT
	,IIF(SUM(NET_CC) > 0,1,0 ) AS Active_Agent


FROM Temp1
GROUP BY 	Temp1.[Issuing Agent]
	,Temp1.MONTH_ACTIVE
	--ORDER BY Temp1.[Issuing Agent] DESC
)

SELECT
	Temp2.ID
	,DATEFROMPARTS(Temp2.MONTH_ACTIVE / 100,Temp2.MONTH_ACTIVE % 100, '01') AS ID_DATE 
	,Temp2.[Issuing Agent]
	,Temp2.MONTH_ACTIVE
	,Temp2.CASE_COUNT
	,Temp2.Active_Agent
FROM Temp2


GO