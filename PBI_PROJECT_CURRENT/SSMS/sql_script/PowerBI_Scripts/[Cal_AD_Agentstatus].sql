USE [PowerBI]
GO

/****** Object:  View [DPO].[Cal_AD_Agentstatus]    Script Date: 6/29/2021 1:09:54 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER VIEW [DPO].[Cal_AD_Agentstatus] AS
SELECT [Area_Name]
, [Sales_Unit_Code]
, Agent_Number
, [Agent_Name]
, [Grade]
, [License_No]
, DateType
, DateActive
, Sales_Unit_Code + REPLACE(CAST(DateActive AS date), '-', '') AS ID
FROM   [PowerBI].[DPO].[Main_AGENT_INFO_DA]
UNPIVOT (DateActive FOR DateType IN ([Date_Appointed], [Terminated_date])) AS UnPVT
GO

