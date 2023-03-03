SELECT  [Agent_Status], COUNT(*)
FROM [dbo].[Main_AGENT_INFO_DA]
WHERE YEAR([Date_Appointed]) = 2021
GROUP BY ALL [Agent_Status]
ORDER BY [Date_Appointed] DESC


SELECT [Product Code], [Frequency of Payment], [Frequency], COUNT([Frequency]) AS 'COUNT'
FROM [DPO].[view_DP_TAGENTPREMIUM_TEST_AFYP]
GROUP BY ALL
	[Product Code], [Frequency of Payment], [Frequency]
ORDER BY [Product Code]

SELECT * FROM [dbo].[DP_TAGENTPREMIUM_TEST]
WHERE [Product Code] LIKE 'UL%' AND [Frequency of Payment] = 'Monthly'

SELECT DISTINCT [Grade] FROM [Main_AGENT_INFO_DA]



