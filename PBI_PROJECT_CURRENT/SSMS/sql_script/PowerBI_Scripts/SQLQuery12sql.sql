SELECT *
FROM [dbo].[DP_TAGENTPREMIUM_TEST] a
		JOIN (SELECT DISTINCT [Policy_Number],[Contract Type]
				FROM  [dbo].[DP_TDAILYSALES_DA]) b
		ON a.[Policy No] = b.Policy_Number

WHERE [Contract Type]  LIKE 'UL%'

SELECT * FROM view_Detail
SELECT * FROM view_Detail WHERE [Policy No] = '80018406'

SELECT * FROM[DPO].[view_DP_TAGENTPREMIUM_TEST_AFYP]
WHERE [Policy No] = '80018406'


SELECT * FROM [dbo].[DP_TAGENTPREMIUM_TEST]
WHERE [Policy No] = '80069761'

SELECT * FROM [dbo].[DP_TDAILYSALES_DA] 
WHERE [Policy_Number] = '80070521'

SELECT * FROM view_DP_TAGENTPREMIUM_TEST_AFYP
WHERE [Policy No] = '80070521'

SELECT  CONVERT(INT, [Collected Date] - [Issued Date])
FROM view_Detail
