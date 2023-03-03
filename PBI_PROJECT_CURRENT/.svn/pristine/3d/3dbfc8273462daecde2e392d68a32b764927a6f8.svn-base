USE [PowerBI]
GO

/****** Object:  View [DPO].[DW_Office]    Script Date: 7/26/2021 7:49:54 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER VIEW [DPO].[DW_Office]
AS
SELECT DISTINCT a.Area_Name AS Office_Code, MIN(b.Office) AS Office_Name
FROM   [DPO].Main_AGENT_INFO_DA AS a LEFT OUTER JOIN
             [DPO].Main_AD_STRUCTURE AS b ON a.Area_Name = b.Office_Code
WHERE a.Area_Name IS NOT NULL
GROUP BY a.Area_Name
UNION
SELECT DISTINCT Office_Code AS Code, MIN(Office)
FROM   [DPO].Main_AD_STRUCTURE
WHERE Office_Code IS NOT NULL
GROUP BY Office_Code
GO