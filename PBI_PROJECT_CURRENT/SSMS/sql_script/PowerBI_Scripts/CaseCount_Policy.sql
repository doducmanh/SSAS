-- Count case MTD Gross 
-- [Issued Date] Month=01 ; Year=2021

SELECT 	[Area Code], AD_CODE, AD_NAME,
		COUNT (DISTINCT [Policy No]) AS COUNT_CASE_GROSS
FROM [DPO].[view_Detail_2021_01]
WHERE ([Policy Status] IN ('IF','PS'))
		AND	(YEAR([Issued Date]) = 2021 AND MONTH([Issued Date])=1)	
GROUP BY ALL [Area Code], AD_CODE, AD_NAME;


-- Count case MTD Cancel 

SELECT 	[Area Code], AD_CODE, AD_NAME,
		COUNT (DISTINCT [Policy No]) AS COUNT_CASE_CANCEL
FROM [DPO].[view_Detail_2021_01]
WHERE ([Policy Status] IN ('DC','FL','PO'))
--		AND	(YEAR([Issued Date]) = 2021 AND MONTH([Issued Date])=1)	
GROUP BY ALL [Area Code], AD_CODE, AD_NAME;




SELECT * FROM [DPO].[view_Detail_2021_01]
WHERE [Policy No] ='80071652'

-- GROSS:	[Policy Status] IN ('IF','PS')
-- CANCEL:	[Policy Status] IN ('DC','FL','PO')




