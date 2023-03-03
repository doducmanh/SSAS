/****** Script for SelectTopNRows command from SSMS  ******/
WITH Max_RN AS (
SELECT  [Agent_Number]
      ,[Agent_Name]
     ,[Sales_Unit_Code]
     ,[Sales_Unit_Name]
     ,[Area_Name]
     ,[Curr_From]
	 ,[RN]
	 ,COUNT(*) OVER (PARTITION BY [Agent_Number]) AS MAXRN
      --,MAX([RN]) AS RN
  FROM [PowerBI].[DPO].[Main_AGENT_AD_HISTORY]
)

,Current_AD AS (
SELECT 
	 A.[Agent_Number]
     ,A.[Agent_Name]
     ,A.[Sales_Unit_Code]
     ,A.[Sales_Unit_Name]
     ,A.[Area_Name]
     ,A.[Curr_From]
	 ,A.[RN]

FROM Max_RN AS A
WHERE A.[RN] = MAXRN
)
, Temp1 AS (
SELECT 
	 B.[Agent_Number]
     ,B.[Agent_Name]
     ,B.[Sales_Unit_Code]
     ,B.[Sales_Unit_Name]
	, C.Sales_Unit_Code AS AD_CODE_AGENT_INFO_TABLE, C.Sales_Unit AS AD_NAME_AGENT_INFO_TABLE
	,IIF(B.Sales_Unit_Code <> C.Sales_Unit_Code, 1,0) AS CHECK_AD

FROM Current_AD AS B
LEFT JOIN [DPO].Main_AGENT_INFO_DA AS C
ON B.Agent_Number = C.Agent_Number
WHERE B.Sales_Unit_Code = C.Sales_Unit_Code
)
SELECT *

FROM Temp1
WHERE Temp1.CHECK_AD = 1
--HAVING IIF(B.Sales_Unit_Code <> C.Sales_Unit_Code, 1,0) = 1