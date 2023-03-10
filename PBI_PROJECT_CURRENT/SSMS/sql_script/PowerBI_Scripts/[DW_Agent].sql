USE [PowerBI]
GO

/****** Object:  View [DPO].[DW_Agent]    Script Date: 7/26/2021 7:58:29 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER VIEW [DPO].[DW_Agent]
AS
SELECT	Agent_Number AS Code,
		Agent_Name AS Name,
		Grade,
		Agent_Status AS Status,
		Date_Appointed,
		Terminated_date, 
		Sales_Unit_Code AS AD_Code, 
		Sales_Unit AS AD_Name, 
		Area_Name AS Office, 
		Sales_Unit_Code + Area_Name AS ID
FROM   [DPO].Main_AGENT_INFO_DA
WHERE (Agent_Name NOT LIKE '%BHNT%') AND (Sales_Unit_Code NOT LIKE 'ADM00')
GO


