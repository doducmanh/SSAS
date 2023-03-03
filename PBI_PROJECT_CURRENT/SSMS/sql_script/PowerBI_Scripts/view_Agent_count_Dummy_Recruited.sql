-- Count all case agent_name with value Dummy or Recruited (#Dummy) every Grade

-- Check [Agent_Name] NULL 
-- SELECT * FROM [dbo].[Main_AGENT_INFO_DA] WHERE [Agent_Name] IS NULL

CREATE OR ALTER VIEW view_Agent_count_Recruited AS
	SELECT [Grade], 
			TYPE_AGENT = 'Recruited', 
			COUNT(*) AS COUNT_AGENT_NAME
	FROM [dbo].[Main_AGENT_INFO_DA]
	WHERE [Agent_Name] NOT LIKE 'DUMMY%'
		AND YEAR([Date_Appointed]) = 2021
	GROUP BY ALL [Grade]
UNION
	SELECT [Grade],
			TYPE_AGENT = 'Dummy',
			COUNT(*) AS COUNT_AGENT_NAME
	FROM [dbo].[Main_AGENT_INFO_DA]
	WHERE [Agent_Name] LIKE 'DUMMY%'
		AND YEAR([Date_Appointed]) = 2021
	GROUP BY ALL [Grade];



