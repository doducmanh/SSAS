/****** Script for SelectTopNRows command from SSMS  ******/
SELECT  [ID_AD_Current]
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
	  ,CASE 
			WHEN L1G <> 'IC' THEN L1
			WHEN L2G <> 'IC' THEN L2
			WHEN L3G <> 'IC' THEN L3
			WHEN L4G <> 'IC' THEN L4
			WHEN L5G <> 'IC' THEN L5
			WHEN L6G <> 'IC' THEN L6
			WHEN L7G <> 'IC' THEN L7
			WHEN L8G <> 'IC' THEN L8
			WHEN L9G <> 'IC' THEN L9
			WHEN L10G <> 'IC' THEN L10

	  END AS [FPL LEADER]
	  ,CASE 
			WHEN L1G <> 'IC' THEN L1G
			WHEN L2G <> 'IC' THEN L2G
			WHEN L3G <> 'IC' THEN L3G
			WHEN L4G <> 'IC' THEN L4G
			WHEN L5G <> 'IC' THEN L5G
			WHEN L6G <> 'IC' THEN L6G
			WHEN L7G <> 'IC' THEN L7G
			WHEN L8G <> 'IC' THEN L8G
			WHEN L9G <> 'IC' THEN L9G
			WHEN L10G <> 'IC' THEN L10G

	  END AS [FPL LEADER GRADE]
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
  WHERE [GRADE] = 'IC' AND [ExplodedDate] = '202112'