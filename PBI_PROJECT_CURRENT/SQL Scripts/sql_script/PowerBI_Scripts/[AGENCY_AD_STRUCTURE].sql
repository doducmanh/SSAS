/****** Script for SelectTopNRows command from SSMS  ******/
--CREATE OR ALTER VIEW [AGENCY_AD_STRUCTURE] AS
WITH A AS (
SELECT  [ExplodedDate]
      ,[ID]
      ,[ID_AD]
      ,[AD_Office]
      ,[AD_Code]
      ,[RM]
      ,[DM]
      ,[FM]
      ,[Agent_Number]
      ,[GRADE]
      ,[SFC]
      ,[Date_Appointed]
      ,[Terminated_date]
  FROM [PowerBI].[DPO].[Agency_Structure]
  WHERE [AD_Code] = 'AD138' AND [ExplodedDate] >= '2021-06-01'
  --WHERE [ExplodedDate] >='2021-08-01'
  )

  , B AS (
  /****** Script for SelectTopNRows command from SSMS  ******/
SELECT  [ID]
      ,[ExplodedDate]
      --,[Structure]
      ,[Territory_Code]
      ,[TD]
      ,[TDName]
      ,[SRD]
      ,[SRDName]
      ,[RD]
      ,[RDName]
      ,[SZD]
      ,[SZDName]
      --,[ZDSZD]
      --,[ZDSZDName]
      ,[AD_Code]
      ,[ADName]
      ,[AD_Grade]
      ,[Appointed_Date]
      ,[Terminated_Date]
      ,[Last_Status]
      ,[Last_Status_Date]
      ,[DemotePromote_Date]
  FROM [PowerBI].[DPO].[AD00]
  WHERE [AD_Code] = 'AD088' AND [ExplodedDate] >= '2021-06-01'
  )
  SELECT  B.[ID] AS ID_AD
      ,B.[ExplodedDate]
      --,B.[Structure]
      ,B.[Territory_Code]
      ,B.[TD]
      ,B.[TDName]
      ,B.[SRD]
      ,B.[SRDName]
      ,B.[RD]
      ,B.[RDName]
      ,B.[SZD]
      ,B.[SZDName]
      --,[ZDSZD]
      --,[ZDSZDName]
      ,B.[AD_Code]
      ,B.[ADName]
      ,B.[AD_Grade]
      ,B.[Appointed_Date]
      ,B.[Terminated_Date]
      ,B.[Last_Status]
      ,B.[Last_Status_Date]
      ,B.[DemotePromote_Date]
	  --, A.[ExplodedDate]
      ,A.[ID] AS ID_AGENT
      --,[ID_AD]
      ,A.[AD_Office]
      --,A.[AD_Code]
      ,A.[RM]
      ,A.[DM]
      ,A.[FM]
      ,A.[Agent_Number]
      ,A.[GRADE]
      ,A.[SFC]
      ,A.[Date_Appointed] AS AGENCY_Date_Appointed
      ,A.[Terminated_date] AS AGENCY_Terminated_Date

  FROM A
  LEFT JOIN B
  ON A.ID_AD = B.ID
