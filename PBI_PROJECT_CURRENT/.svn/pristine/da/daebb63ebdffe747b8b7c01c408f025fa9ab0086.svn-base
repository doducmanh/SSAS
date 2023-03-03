-- COUNT RECRUITED: Agent/Dummy with every Grade - 2021
SELECT a.*, b.AGENT 
FROM (
		SELECT [Grade], COUNT(*) AS 'DUMMY'		
		FROM [dbo].[Main_AGENT_INFO_DA]
				WHERE [Agent_Name] LIKE 'DUMMY%'
						AND YEAR([Date_Appointed]) = 2021
		GROUP BY ALL [Grade]) a

JOIN (
		SELECT [Grade], COUNT(*) AS 'AGENT'	
		FROM [dbo].[Main_AGENT_INFO_DA]
				WHERE [Agent_Name] NOT LIKE 'DUMMY%'
						AND YEAR([Date_Appointed]) = 2021
		GROUP BY ALL [Grade]) b
ON a.Grade = b.Grade

-----------------------------------------------------------------------------------------------



-----------------------------------------------------------------------------------------------

-- MONTHLY COUNT ALL
SELECT	FORMAT([Date_Appointed], 'yyyy-MM') AS MONTHLY, 
		COUNT(*) AS COUNT
FROM [dbo].[Main_AGENT_INFO_DA]
GROUP BY FORMAT([Date_Appointed], 'yyyy-MM')
ORDER BY MONTHLY

-----------------------------------------------------------------------------------------------
-- MONTHLY COUNT WITH Area_Name
SELECT	[Area_Name],
		FORMAT([Date_Appointed], 'yyyy-MM') AS MONTHLY, 
		COUNT(*) AS COUNT
FROM [dbo].[Main_AGENT_INFO_DA]
WHERE YEAR([Date_Appointed]) = 2021
GROUP BY [Area_Name], FORMAT([Date_Appointed], 'yyyy-MM')
ORDER BY MONTHLY

-----------------------------------------------------------------------------------------------
-- COUNT
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
	GROUP BY ALL [Grade]

-----------------------------------------------------------
