/****** Script for SelectTopNRows command from SSMS  ******/
WITH Temp AS (
SELECT [ID_AD_Current]
      ,[AD_Code_Current]
      ,[AD_Office_Current]
      ,[ID_AD]
      ,[AD_Code]
      ,[AD_Office]
      ,[ExplodedDate]
      ,[ID]
      ,[RM]
      ,[DM]
      ,[FM]
      ,[Agent_Number]
      ,[GRADE]
      ,[L1]
      ,[L1G]
      ,[L2]
      ,[L2G]
      ,[L3]
      ,[L3G]
      ,[L4]
      ,[L4G]
      ,[L5]
      ,[L5G]
      ,[L6]
      ,[L6G]
      ,[L7]
      ,[L7G]
      ,[L8]
      ,[L8G]
      ,[L9]
      ,[L9G]
      ,[L10]
      ,[L10G]
      ,[L0R]
      ,[INDEX_LEADER]
      ,[L1 Direct]
      ,[L2 Direct]
      ,[L3 Direct]
      ,[L4 Direct]
      ,[L5 Direct]
      ,[L6 Direct]
      ,[L7 Direct]
      ,[L8 Direct]
      ,[L9 Direct]
      ,[L10 Direct]
      ,[SFC]
      ,[SFC_MARK_IT]
      ,[Date_Appointed]
      ,[Terminated_date]
      ,[RM_Date_Appointed]
      ,[DM_Date_Appointed]
      ,[FM_Date_Appointed]
  FROM [PowerBI].[DPO].[Main_AGENCY_STRUCTURE]

  WHERE [ExplodedDate] = '202112'
  )
--, Temp2  AS (
  SELECT B.*
  ,CASE
    WHEN L10G = B.GRADE THEN 10
    WHEN L9G = B.GRADE THEN 9
    WHEN L8G = B.GRADE THEN 8
    WHEN L7G = B.GRADE THEN 7
	WHEN L6G = B.GRADE THEN 6
    WHEN L5G = B.GRADE THEN 5
    WHEN L4G = B.GRADE THEN 4
    WHEN L3G = B.GRADE THEN 3
	WHEN L2G = B.GRADE THEN 2
    WHEN L1G = B.GRADE THEN 1
    ELSE 0
END AS SAME_LEVEL
  , A.Agent_Status

  FROM Temp AS B

    LEFT JOIN [DPO].[Main_AGENT_INFO_DA] AS A
  ON A.Agent_Number = B.Agent_Number