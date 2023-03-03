/****** Script for SelectTopNRows command from SSMS  ******/
CREATE OR ALTER VIEW view_detail_AFYP AS
	SELECT *,
		[FYP] / Frequency AS AFYP_new
	FROM(
	SELECT *,
			CASE 
			WHEN ([Product Code] NOT LIKE 'UL%' AND [Frequency of Payment] = 'Yearly')		THEN 1
			WHEN ([Product Code] NOT LIKE 'UL%' AND [Frequency of Payment] = 'Half-year')	THEN 0.53
			WHEN ([Product Code] NOT LIKE 'UL%' AND [Frequency of Payment] = 'Quarterly')	THEN 0.27
			WHEN ([Product Code] NOT LIKE 'UL%' AND [Frequency of Payment] = 'Monthly'	)	THEN 0.09
			WHEN ([Product Code] LIKE 'UL%' AND [Frequency of Payment] = 'Yearly')			THEN 1
			WHEN ([Product Code] LIKE 'UL%' AND [Frequency of Payment] = 'Half-year')		THEN 0.5
			WHEN ([Product Code] LIKE 'UL%' AND [Frequency of Payment] = 'Quarterly')		THEN 0.25
			END AS Frequency
	  FROM [PowerBI].[dbo].[DP_TAGENTPREMIUM_TEST]
	  ) q