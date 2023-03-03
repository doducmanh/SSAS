--CREATE OR ALTER  VIEW [DPO].[AGENCY_Last_Issued_Policy] AS

/*** INFORCE POLICIES****/
WITH Temp1 AS (
SELECT MAX(A.[Policy No]) AS Last_Issued_Policy
      ,A.[Issuing Agent]
	  --,A.[Servicing Agent]
	  --,A.[Policy Status]
	  --C.Date_Appointed AS IA_Appointed
	  ,A.[Issued Date]
	  --,LEAD(A.[Issued Date]) OVER (PARTITION BY A.[Issuing Agent] ORDER BY A.[Issued Date]) AS Next_Issued_Date
  FROM [PowerBI].[DPO].[DP_TAGENTPREMIUM_TEST] AS A
  WHERE A.[Policy Status] = 'IF'
  GROUP BY --A.[Policy No]
     -- ,
	  A.[Issued Date]
      ,A.[Issuing Agent]
	  ,A.[Policy Status]
	  --,A.[Servicing Agent]
	  --,C.Date_Appointed
)
--,Temp2 AS (
SELECT Temp1.[Issued Date], Temp1.[Issuing Agent], Temp1.Last_Issued_Policy
	,LEAD(Temp1.[Issued Date]) OVER (PARTITION BY Temp1.[Issuing Agent] ORDER BY Temp1.[Issued Date]) AS Next_Issued_Date
FROM Temp1
--WHERE Temp1.[Issuing Agent] = '60015683'
--ORDER BY Temp1.[Issued Date]