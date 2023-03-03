SELECT [Policy No],max([FYP]),
		  [Product Code]AS Main_Product
FROM [dbo].[DP_TAGENTPREMIUM_TEST]
group by [Policy No],[Product Code]


SELECT *
from
	dbo.DP_TAGENTPREMIUM_TEST 
			JOIN (SELECT [Policy No], max([FYP]) as Max_FYP,
					 [Product Code] AS Main_Product
					FROM [dbo].[DP_TAGENTPREMIUM_TEST]
					group by [Policy No],[Product Code]) a
				ON dbo.DP_TAGENTPREMIUM_TEST.[Policy No] = a.[Policy No]
				--where dbo.DP_TAGENTPREMIUM_TEST.[Policy No] = '80063079'