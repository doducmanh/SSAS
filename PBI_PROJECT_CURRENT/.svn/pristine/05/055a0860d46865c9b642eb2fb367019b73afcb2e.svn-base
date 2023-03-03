USE [PowerBI]
GO

/****** Object:  View [DPO].[AGENCY_STRUCTURE_Monthly]    Script Date: 9/9/2021 9:28:50 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER  VIEW [DPO].[AGENCY_STRUCTURE_Monthly] AS
WITH Temp1 AS (
SELECT [AGENT CODE]
      --,[STATUS]
      ----,[OLD GRADE]
      --,[GRADE]
	  
      ,(DATEADD(DAY,-DAY([CURRFROM])+1, [CURRFROM]))AS [new CURRFROM]
	  ,IIF(CURRTO IS NULL, '2099-12-31',IIF(CURRTO IS NULL, '2099-12-30',CURRTO)) AS [new CURRTO]
      ,[CURRFROM]
	  ,[CURRTO]
      ,[New Leader Code]
	  ,[GRADE]
      --,[Old Leader Code]
      --,[NOTE]
      --,[CLUB CLASS]
      --,[EFFECTIVE DATE CLUB CLASS]
      --,[Reason mark club class]
      --,[EXPIRED_LICENSE_DATE]
        ,MAX([RN]) AS [RN]
  FROM [PowerBI].[DPO].[Main_AGENT_HISTORY]
  WHERE --[AGENT CODE] = '60020543'
  --AND 
  CURRFROM <> IIF(CURRTO IS NULL, '2099-12-31',CURRTO)
  GROUP BY [AGENT CODE]
      --,[STATUS]
      ----,[OLD GRADE]
      ,[GRADE]
	  
      ,(DATEADD(DAY,-DAY([CURRFROM])+1, [CURRFROM]))
	  ,(DATEADD(DAY,-DAY([CURRTO]), [CURRTO]))
      ,[CURRFROM]
	  ,[CURRTO]
      ,[New Leader Code]
-- ORDER BY MAX([RN])

)
,Temp2 AS (

SELECT A.[AGENT CODE]
	  ,A.[new CURRFROM]
	  ,MAX(A.[RN]) AS RN
FROM Temp1 AS A
--WHERE [AGENT CODE] = '60020543'
GROUP BY A.[AGENT CODE]
	  ,A.[new CURRFROM]
)
,Temp3 AS (
SELECT Temp1.*
	, LEAD(Temp1.[new CURRFROM]) OVER (PARTITION BY Temp1.[AGENT CODE] ORDER BY Temp1.RN) AS [LEAD CURRTO]

FROM Temp1
JOIN Temp2
ON Temp1.[AGENT CODE] = Temp2.[AGENT CODE]
AND Temp1.RN = Temp2.RN
--WHERE Temp1.[AGENT CODE] = '60020543'
)
,Temp4 AS (
SELECT  
	   A.[Agent_Number]
      ,A.[ExplodedDate]
	  ,B.[GRADE]
      --,A.[Date_Appointed]
      --,A.[Terminated_date]
	  ,B.[New Leader Code] AS Supervisor_Code
FROM [PowerBI].[DPO].[AGENCY_STRUCTURE_Exploded] AS A
--WHERE A.[Agent_Number] = '60020543'
LEFT JOIN Temp3 AS B
ON A.[Agent_Number] = B.[AGENT CODE]
AND B.[new CURRFROM] <= A.[ExplodedDate]
AND IIF(B.[LEAD CURRTO] IS NULL, GetDate(),B.[LEAD CURRTO]) > A.[ExplodedDate]
--WHERE A.[Agent_Number] = '60015807'
)

--,A AS (
SELECT  
--[Area_Name]
--      ,[Sales_Unit_Code]
       K.[Agent_Number]
	  ,K.[Supervisor_Code]
      --,[Agent_Name]
      ,K.[Grade]
	  ,K.[ExplodedDate]
	  ,CONCAT(K.[Agent_Number], FORMAT( K.ExplodedDate, 'yyyyMM') ) AS ID
	  ,CONCAT(K.[Supervisor_Code], FORMAT( K.ExplodedDate, 'yyyyMM') ) AS IDSup
--      ,[Agent_Status]
  FROM Temp4 AS K
  --WHERE K.[ExplodedDate] >= '2021-01-01'
-- )
--, B AS (
--SELECT A.Agent_Number
--	, A.ExplodedDate
--	, A.GRADE
--	, A.ID
--	, A.Supervisor_Code AS L1, A1.GRADE AS L1G
--	, A1.Supervisor_Code AS L2, A2.GRADE AS L2G
--	, A2.Supervisor_Code AS L3, A3.GRADE AS L3G
--	, A3.Supervisor_Code AS L4, A4.GRADE AS L4G
--	, A4.Supervisor_Code AS L5, A5.GRADE AS L5G
--	, A5.Supervisor_Code AS L6, A6.GRADE AS L6G
--	, A6.Supervisor_Code AS L7, A7.GRADE AS L7G
--	, A7.Supervisor_Code AS L8, A8.GRADE AS L8G
--	, A8.Supervisor_Code AS L9, A9.GRADE AS L9G
--	, A9.Supervisor_Code AS L10, A10.GRADE AS L10G
--	--, A10.Supervisor_Code AS L11, A11.GRADE AS L11G 
	
	
--	--IIF(A.Supervisor_Code <> '', A1.GRADE, NULL) AS L1G
--	--, IIF(A1.Supervisor_Code <> '', A1.Supervisor_Code, NULL) AS L2--, IIF(A1.Supervisor_Code <> '', A2.GRADE, NULL) AS L2G
--	--, IIF(A2.Supervisor_Code <> '', A2.Supervisor_Code, NULL) AS L3--, IIF(A2.Supervisor_Code <> '', A3.GRADE, NULL) AS L3G
--	--, IIF(A3.Supervisor_Code <> '', A3.Supervisor_Code, NULL) AS L4--, IIF(A3.Supervisor_Code <> '', A4.GRADE, NULL) AS L4G
--	--, IIF(A4.Supervisor_Code <> '', A4.Supervisor_Code, NULL) AS L5--, IIF(A4.Supervisor_Code <> '', A5.GRADE, NULL) AS L5G
--	--, IIF(A5.Supervisor_Code <> '', A5.Supervisor_Code, NULL) AS L6--, IIF(A5.Supervisor_Code <> '', A6.GRADE, NULL) AS L6G
--	--, IIF(A6.Supervisor_Code <> '', A6.Supervisor_Code, NULL) AS L7--, IIF(A6.Supervisor_Code <> '', A7.GRADE, NULL) AS L7G
--	--, IIF(A7.Supervisor_Code <> '', A7.Supervisor_Code, NULL) AS L8--, IIF(A7.Supervisor_Code <> '', A8.GRADE, NULL) AS L8G
--	--, IIF(A8.Supervisor_Code <> '', A8.Supervisor_Code, NULL) AS L9--, IIF(A8.Supervisor_Code <> '', A9.GRADE, NULL) AS L9G
--	--, IIF(A9.Supervisor_Code <> '', A9.Supervisor_Code, NULL) AS L10--, IIF(A9.Supervisor_Code <> '', A10.GRADE, NULL) AS L10G
--	--, IIF(A10.Supervisor_Code <> '', A10.Supervisor_Code, NULL) AS L11--, IIF(A10.Supervisor_Code <> '', A11.GRADE, NULL) AS L11G
--FROM A
--LEFT JOIN A AS A1 ON A.Supervisor_Code <>''  AND A.[IDSup] = A1.ID 
--LEFT JOIN A AS A2 ON A1.Supervisor_Code <>''   AND A1.[IDSup] = A2.ID 
--LEFT JOIN A AS A3 ON A2.Supervisor_Code <>''   AND A2.[IDSup] = A3.ID 
--LEFT JOIN A AS A4 ON A3.Supervisor_Code <>''   AND A3.[IDSup] = A4.ID 
--LEFT JOIN A AS A5 ON A4.Supervisor_Code <>''   AND A4.[IDSup] = A5.ID 
--LEFT JOIN A AS A6 ON A5.Supervisor_Code <>''   AND A5.[IDSup] = A6.ID 
--LEFT JOIN A AS A7 ON A6.Supervisor_Code <>''   AND A6.[IDSup] = A7.ID 
--LEFT JOIN A AS A8 ON A7.Supervisor_Code <>''   AND A7.[IDSup] = A8.ID 
--LEFT JOIN A AS A9 ON A8.Supervisor_Code <>''   AND A8.[IDSup] = A9.ID 
--LEFT JOIN A AS A10 ON A9.Supervisor_Code <>''   AND A9.[IDSup] = A10.ID 



---- AND A.ExplodedDate = A1.ExplodedDate
----LEFT JOIN A AS A2 ON A1.Supervisor_Code = A2.Agent_Number AND A1.ExplodedDate = A2.ExplodedDate
----LEFT JOIN A AS A3 ON A2.Supervisor_Code = A3.Agent_Number AND A2.ExplodedDate = A3.ExplodedDate
----LEFT JOIN A AS A4 ON A3.Supervisor_Code = A4.Agent_Number AND A3.ExplodedDate = A4.ExplodedDate
----LEFT JOIN A AS A5 ON A4.Supervisor_Code = A5.Agent_Number AND A4.ExplodedDate = A5.ExplodedDate
----LEFT JOIN A AS A6 ON A5.Supervisor_Code = A6.Agent_Number AND A5.ExplodedDate = A6.ExplodedDate
----LEFT JOIN A AS A7 ON A6.Supervisor_Code = A7.Agent_Number AND A6.ExplodedDate = A7.ExplodedDate
----LEFT JOIN A AS A8 ON A7.Supervisor_Code = A8.Agent_Number AND A7.ExplodedDate = A8.ExplodedDate
----LEFT JOIN A AS A9 ON A8.Supervisor_Code = A9.Agent_Number AND A8.ExplodedDate = A9.ExplodedDate
----LEFT JOIN A AS A10 ON A9.Supervisor_Code = A10.Agent_Number AND A9.ExplodedDate = A10.ExplodedDate
--)
--,B1 AS (
--SELECT B.Agent_Number
--	, B.ExplodedDate
--	, B.GRADE
--	, B.ID
--	, IIF(B.L1 <> '', B.L1, NULL) AS L1, B.L1G
--	, IIF(B.L2 <> '', B.L2, NULL) AS L2, B.L2G
--	, IIF(B.L3 <> '', B.L3, NULL) AS L3, B.L3G
--	, IIF(B.L4 <> '', B.L4, NULL) AS L4, B.L4G
--	, IIF(B.L5 <> '', B.L5, NULL) AS L5, B.L5G
--	, IIF(B.L6 <> '', B.L6, NULL) AS L6, B.L6G
--	, IIF(B.L7 <> '', B.L7, NULL) AS L7, B.L7G
--	, IIF(B.L8 <> '', B.L8, NULL) AS L8, B.L8G
--	, IIF(B.L9 <> '', B.L9, NULL) AS L9, B.L9G
--	, IIF(B.L10 <> '', B.L10, NULL) AS L10, B.L10G
--FROM B
--)
--,C AS (
--SELECT B1.*
--	   , COALESCE(B1.L10, B1.L9, B1.L8, B1.L7, B1.L6, B1.L5, B1.L4, B1.L3, B1.L2, B1.L1, B1.Agent_Number) AS L0R
--FROM B1
--)
--, D AS (
--SELECT C.*
--	,CASE
--		WHEN L0R = Agent_Number THEN 0
--		WHEN L0R = L1 THEN 1
--		WHEN L0R = L2 THEN 2
--		WHEN L0R = L3 THEN 3
--		WHEN L0R = L4 THEN 4
--		WHEN L0R = L5 THEN 5
--		WHEN L0R = L6 THEN 6
--		WHEN L0R = L7 THEN 7
--		WHEN L0R = L8 THEN 8
--		WHEN L0R = L9 THEN 9
--		WHEN L0R = L10 THEN 10
--		--WHEN L0R = L11 THEN 11
--	END AS INDEX_LEADER
--FROM C
--)

--SELECT D.*
--	, IIF(D.GRADE <> D.L1G OR L1G = 'IC', 1, 0) AS [L1 Direct]
--	, IIF(D.L1G <> D.L2G OR L2G = 'IC', 1, 0) AS [L2 Direct]
--	, IIF(D.L2G <> D.L3G OR L3G = 'IC', 1, 0) AS [L3 Direct]
--	, IIF(D.L3G <> D.L4G OR L4G = 'IC', 1, 0) AS [L4 Direct]
--	, IIF(D.L4G <> D.L5G OR L5G = 'IC', 1, 0) AS [L5 Direct]
--	, IIF(D.L5G <> D.L6G OR L6G = 'IC', 1, 0) AS [L6 Direct]
--	, IIF(D.L6G <> D.L7G OR L7G = 'IC', 1, 0) AS [L7 Direct]
--	, IIF(D.L7G <> D.L8G OR L8G = 'IC', 1, 0) AS [L8 Direct]
--	, IIF(D.L8G <> D.L9G OR L9G = 'IC', 1, 0) AS [L9 Direct]
--	, IIF(D.L9G <> D.L10G OR L10G = 'IC', 1, 0) AS [L10 Direct]
--	--, CONCAT(D.[Agent_Number], FORMAT( D.ExplodedDate, 'yyyyMM') ) AS ID
--FROM D

----WHERE L9 IS NOT NULL
--GO
GO


