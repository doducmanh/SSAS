-- view danh sách Agent_Number of Sales_Unit thu?c MK3

CREATE OR ALTER VIEW view_Area_AD_Agent_MK3 AS
	SELECT [Area_Name]
		,[Sales_Unit]
		,[Sales_Unit_Code]
		,[Agent_Number]
	FROM [PowerBI].[dbo].[Main_AGENT_INFO_DA]
	WHERE [Area_Name] LIKE 'A%'