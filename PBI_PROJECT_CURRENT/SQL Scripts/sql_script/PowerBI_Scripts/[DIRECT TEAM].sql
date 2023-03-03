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
,A AS (
SELECT  
	   A0.[Agent_Number]
	  ,A0.AD_Code AS AD_Code
	  ,A0.AD_Office AS AD_Office
	  ,
	  A0.ID_AGENT AS ID
	  ,A0.ID_AD AS ID_AD
      ,A0.[ExplodedDate]
	  ,B.[GRADE]
      ,A0.[Date_Appointed]
      ,A0.[Terminated_date]
	  ,B.[New Leader Code] AS Supervisor_Code
	  ,CONCAT(B.[New Leader Code], FORMAT( A0.ExplodedDate, 'yyyyMM') ) AS IDSup
FROM [PowerBI].[DPO].[AGENCY_STRUCTURE_Exploded] AS A0
--WHERE A.[Agent_Number] = '60020543'
LEFT JOIN Temp3 AS B
ON A0.[Agent_Number] = B.[AGENT CODE]
AND B.[new CURRFROM] <= A0.[ExplodedDate]
AND IIF(B.[LEAD CURRTO] IS NULL, GetDate(),B.[LEAD CURRTO]) > A0.[ExplodedDate]
--WHERE A.[Agent_Number] = '60015807'
--WHERE A0.[ExplodedDate] >= '2020-01-01'
)



----WITH 
AGT_INFO AS (
SELECT A.AD_Office
, Sales_Unit_Code
, Agent_Number
, Agent_Name
, Grade
, Agent_Status
, Parent_Supervisor_Code
, Supervisor_Code
, Date_Appointed
FROM A
)

--SELECT AGT_INFO.Area_Name
--, AGT_INFO.Sales_Unit_Code
--, AGT_INFO.Agent_Number AS DM_CODE
----, AGT_INFO.Agent_Name AS DM_NAME
--, AGT_INFO.Grade
----, AGT_INFO.Agent_Status
--, AGT_INFO_1.Agent_Number
----, AGT_INFO_1.Agent_Name
--, AGT_INFO_1.Grade
--, AGT_INFO_1.Date_Appointed
----, AGT_INFO_1.Agent_Status
--FROM [DPO].[Main_AGENT_INFO_DA] AS AGT_INFO 
--INNER JOIN [DPO].[Main_AGENT_INFO_DA] AS AGT_INFO_1 
--ON AGT_INFO.Agent_Number = AGT_INFO_1.Supervisor_Code
--WHERE (((AGT_INFO.Grade)='DM') AND ((AGT_INFO_1.Grade)<>'DM'))

--UNION 

--SELECT AGT_INFO.Area_Name
--, AGT_INFO.Sales_Unit_Code
--, AGT_INFO.Agent_Number
----, AGT_INFO.Agent_Name
--, AGT_INFO.Grade
----, AGT_INFO.Agent_Status
--, AGT_INFO.Agent_Number AS NUMBER_SELF
----, AGT_INFO.Agent_Name AS NAME_SELF
--, AGT_INFO.Grade AS GRADE_SELF
--, AGT_INFO.Date_Appointed
----, AGT_INFO.Agent_Status

--FROM [DPO].[Main_AGENT_INFO_DA] AS AGT_INFO 
----INNER JOIN [DPO].[Main_AGENT_INFO_DA] AS AGT_INFO_1 
----ON AGT_INFO.Agent_Number = AGT_INFO_1.Agent_Number
--WHERE (((AGT_INFO.Grade)='DM'))

--UNION
--SELECT AGT_INFO_2.Area_Name
--, AGT_INFO_2.Sales_Unit_Code
--, AGT_INFO_2.Agent_Number
----, AGT_INFO_2.Agent_Name
--, AGT_INFO_2.Grade
----, AGT_INFO_2.Agent_Status
--, AGT_INFO.Agent_Number
----, AGT_INFO.Agent_Name
--, AGT_INFO.Grade
--, AGT_INFO.Date_Appointed
----, AGT_INFO.Agent_Status
--FROM (AGT_INFO INNER JOIN AGT_INFO AS AGT_INFO_2 
--ON AGT_INFO.Parent_Supervisor_Code = AGT_INFO_2.Agent_Number) 
--INNER JOIN AGT_INFO AS AGT_INFO_1 
--ON AGT_INFO.Supervisor_Code = AGT_INFO_1.Agent_Number
--WHERE (((AGT_INFO_2.Grade)='DM') AND ((AGT_INFO.Grade)<>'DM') AND ((AGT_INFO_1.Grade)<>'DM'))