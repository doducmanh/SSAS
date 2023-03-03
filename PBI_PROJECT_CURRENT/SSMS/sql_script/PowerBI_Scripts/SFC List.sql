CREATE OR ALTER VIEW [SFC LIST] AS
WITH Temp1 AS (
SELECT A.[Policy No]
      ,A.[Issuing Agent]
	  ,A.[Policy Status]
	  ,C.Date_Appointed AS IA_Appointed
	  ,A.[Issued Date]
	  --,LEAD(A.[Issued Date]) OVER (PARTITION BY A.[Issuing Agent] ORDER BY A.[Issued Date]) AS Next_Issued_Date
  FROM [PowerBI].[DPO].[DP_TAGENTPREMIUM_TEST] AS A
  LEFT JOIN [DPO].[Main_AGENT_INFO_DA] AS C
  ON A.[Issuing Agent] = C.Agent_Number
  WHERE A.[Policy Status] = 'IF'
  GROUP BY A.[Policy No]
      ,A.[Issued Date]
      ,A.[Issuing Agent]
	  ,A.[Policy Status]
	  ,C.Date_Appointed
)
,Temp2 AS (
SELECT Temp1.*
	,LEAD(Temp1.[Issued Date]) OVER (PARTITION BY Temp1.[Issuing Agent] ORDER BY Temp1.[Issued Date]) AS Next_Issued_Date

FROM Temp1
--WHERE Temp1.[Issuing Agent] = '60015683'
--ORDER BY Temp1.[Issued Date]

)
SELECT A.[Issuing Agent], A.[Issued Date], A.Next_Issued_Date
	 ,DATEADD(MONTH, 6,IIF(A.[Issued Date] > A.IA_Appointed, A.[Issued Date], A.IA_Appointed)) AS SFC_Month
FROM Temp2 AS A
WHERE A.Next_Issued_Date IS NULL
--GROUP BY A.[Issuing Agent], A.[Issued Date], A.Next_Issued_Date
--ORDER BY A.[Issuing Agent],SFC_Month


--LEFT JOIN [dbo].[Main_AGENT_HISTORY] AS C
--ON A.[Issuing Agent] = C.[AGENT CODE]
--AND A.[Issued Date] >= C.CURRFROM
--AND A.[Issued Date] < IIF(C.CURRTO IS NULL, '2099-12-31',C.CURRTO)
