/****** Script for SelectTopNRows command from SSMS  ******/
WITH pol_trans AS (
SELECT  [CHDRNUM] AS [POLICY_NUMBER]
      ,[Old Agent]
      ,[Old Agent Effect From ]
      ,[Current Agent]
      ,MAX([Current Agent Effect From]) AS [Current Agent Effect From]
      --,[User]
      --,[Old Agent Name]
      --,[Current Agent Name]
FROM [PowerBI].[DPO].[DP_AGPOLTRANSFER]
GROUP BY [CHDRNUM] 
      ,[Old Agent]
      ,[Old Agent Effect From ]
      ,[Current Agent]

)
,trans_latest AS (
SELECT T.POLICY_NUMBER
	--,T.[Old Agent]
	--,T.[Old Agent Effect From ]
	--,T.[Current Agent]
	,MAX(T.[Current Agent Effect From]) AS [Current Agent Effect From]

FROM pol_trans AS T
GROUP BY T.POLICY_NUMBER
	--,T.[Old Agent]
	--,T.[Old Agent Effect From ]
	--,T.[Current Agent]
)
,trans_ealiest AS (
SELECT T.POLICY_NUMBER
	--,T.[Old Agent]
	--,T.[Old Agent Effect From ]
	--,T.[Current Agent]
	,MIN(T.[Current Agent Effect From]) AS [Current Agent Effect From]

FROM pol_trans AS T
GROUP BY T.POLICY_NUMBER
	--,T.[Old Agent]
	--,T.[Old Agent Effect From ]
	--,T.[Current Agent]
)

, trans_latest_2 AS (
SELECT
A.POLICY_NUMBER
,A.[Old Agent Effect From ]
,A.[Old Agent]
,EOMONTH(A.[Current Agent Effect From],0) AS [Current Agent Effect From]
FROM trans_latest AS B
LEFT JOIN pol_trans AS A
ON B.POLICY_NUMBER = A.POLICY_NUMBER
AND B.[Current Agent Effect From] = A.[Current Agent Effect From]
GROUP BY A.POLICY_NUMBER
,A.[Old Agent Effect From ]
,A.[Old Agent]
,EOMONTH(A.[Current Agent Effect From],0) 
)
,pol_info AS (
SELECT A.[POLICY_NUMBER], A.[AGENT_NUMBER], A.[RISK_COMMENCEMENT_DATE]
FROM [PowerBI].[DPO].[Main_POLICY_INFO] AS A)


, no_ag AS (
SELECT * FROM trans_ealiest
LEFT JOIN pol_info ON trans_ealiest.POLICY_NUMBER = pol_info.POLICY_NUMBER

= pd.merge(trans_ealiest, pol_info, on='POLICY_NUMBER')