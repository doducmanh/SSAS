USE [PowerBI]
GO

/****** Object:  View [DPO].[Cal_AD_Premium]    Script Date: 1/22/2022 4:42:07 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






ALTER    VIEW [DPO].[Cal_AD_Premium] AS
WITH VP AS 
(SELECT [Area Code], [Policy No],[Product Code], [Collected Date], [Issued Date],[Proposal Receive Date], [Policy Status], [Issuing Agent], [Servicing Agent],[SFC], SUM(FYP) AS FYP, SUM(RYP) AS RYP, SUM([Topup Premium]) AS Topup, SUM(AFYP) AS AFYP
			,[POLICY ACKNOWLED]
			,[Freelook]
                    FROM    DPO.view_premium AS A
                    --WHERE A.[Servicing Agent] IS  NULL
					GROUP BY [Policy No], [Product Code],[Collected Date], [Policy Status], [Issuing Agent], [Issued Date], [Proposal Receive Date], [Servicing Agent],[SFC], [Area Code]
								,[POLICY ACKNOWLED]
								,[Freelook]
					)
,Temp1 AS (
   SELECT VP.[Area Code], VP.[Policy No],VP.[Product Code], VP.[Collected Date], VP.[Issued Date], VP.[Proposal Receive Date], VP.[Policy Status], VP.[Issuing Agent], VP.[Servicing Agent],VP.[SFC], VP.FYP, VP.RYP, VP.Topup, VP.AFYP, VP.[POLICY ACKNOWLED],VP.[Freelook]
		, A.Agent_Name AS SA_Name
		, A.Date_Appointed AS SA_Date_Appointed
		, A.Terminated_date AS SA_Terminated_date
		, A.ID_Card AS SA_ID
		, P.PO_IDNUMBER AS PO_ID
		, B.Date_Appointed AS PO_Date_Appointed
		, B.Terminated_date AS PO_Terminated_date
		, 
		IIF(A.ID_Card = P.PO_IDNUMBER, 'SELF_OWNER'
			,IIF(P.PO_IDNUMBER IN (SELECT ID_Card FROM [PowerBI].[DPO].[Main_AGENT_INFO_DA] )
			AND B.Terminated_date IS NULL
			AND	(EOMONTH(VP.[Collected Date]) >= IIF(B.Date_Appointed IS NOT NULL, B.Date_Appointed, '2000-01-01') OR EOMONTH(VP.[Issued Date]) >= IIF(B.Date_Appointed IS NOT NULL, B.Date_Appointed, '2000-01-01'))
			AND (EOMONTH(VP.[Collected Date]) <= IIF(B.Terminated_date IS NOT NULL, B.Terminated_date, '2099-01-01') OR EOMONTH(VP.[Issued Date])<= IIF(B.Terminated_date IS NOT NULL, B.Terminated_date, '2099-01-01'))
			AND A.Agent_Name NOT LIKE 'DUMMY%'
			AND VP.[Area Code] <> 'SEP','CROSS_SALES', 'CUSTOMER' )) AS Cross_Sales



		, A.Sales_Unit_Code AS AD_Code
		, A.Sales_Unit_Code + REPLACE(CAST(VP.[Collected Date] AS date), '-', '') AS ID
   FROM    VP 
   LEFT OUTER JOIN [PowerBI].[DPO].[Main_AGENT_INFO_DA] AS A ON VP.[Servicing Agent] = A.[Agent_Number]
				--(A.Agent_Name NOT LIKE '%BHNT%') AND (A.Sales_Unit_Code NOT LIKE 'ADM00')
   LEFT OUTER JOIN [PowerBI].[DPO].[Main_POLICY_INFO] AS P
   ON VP.[Policy No] = P.POLICY_NUMBER

   LEFT OUTER JOIN [PowerBI].[DPO].[Main_AGENT_INFO_DA] AS B
   ON P.PO_IDNUMBER = B.ID_Card
   --WHERE VP.[Servicing Agent] IS NOT NULL

)
SELECT
	Temp1.*

FROM Temp1
--WHERE --Cross_Sales = 'CROSS_SALES' 
----AND 
--Temp1.[Policy No] = '80082585'

GO


