USE [PowerBI]
GO

/****** Object:  View [DPO].[DW_AD_Office_Code]    Script Date: 7/26/2021 8:00:50 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Script for SelectTopNRows command from SSMS  ******/
CREATE OR ALTER  VIEW [DPO].[DW_AD_Office_Code] AS
SELECT DISTINCT [Sales_Unit_Code]
      ,[Sales_Unit]
	  ,[Area_Name]
FROM [PowerBI].[DPO].[Main_AGENT_INFO_DA]
--ORDER BY Sales_Unit_Code
GO


