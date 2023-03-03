-- VIEW DETAIL FROM : [dbo].[DP_TAGENTPREMIUM_TEST]
--					[dbo].[Main_AGENT_INFO_DA]
----------------------------------------------------

CREATE OR ALTER VIEW view_Detail_2020 AS
SELECT 
		 [Servicing_Agent_Code]
		,[Servicing_Agent_Name]
		,[Grade]
		,[Date_Appointed]
		,[Agent_Status]
		,[Policy No]	
		,[Issued Date]
--		,[Effected Date]
		,[Policy Status]
		,MIN([Collected Date]) AS [Collected Date]
		,[Area Code]
--		,IIF(a.[Policy Status]='IF', a.[AFYP] , 0) AS Gross_AFYP
		,IIF( ([Policy Status]='IF' OR [Policy Status]='PS'),   SUM(SUM_FYP)+ SUM(TOPUP) , 0) AS Gross_FYP
--		,IIF(a.[Policy Status]='DC' OR a.[Policy Status] = 'FL' , -a.[AFYP] , 0) AS Cancel_AFYP
--		,IIF( ([Policy Status]='DC' OR [Policy Status] = 'FL') AND SUM_RYP = 0, SUM(SUM_FYP) + SUM(TOPUP)  , 0) AS Cancel_FYP
--		,MAX([Gross_AFYP])						AS GROSS_AFYP
	--	,SUM([Gross_FYP])						AS GROSS_FYP
	--	,MAX([Cancel_AFYP])						AS CANCEL_AFYP
	--	,SUM([Cancel_FYP])						AS CANCEL_FYP
	--	,MAX([Gross_AFYP]) - MAX([Cancel_AFYP])	AS NET_AFYP
	--	,SUM([Gross_FYP]) - SUM([Cancel_FYP])	AS NET_FYP
		,[Issuing_Agent_Code]
		,[Issuing_Agent_Name]
FROM 
(
	SELECT a.[Servicing Agent] AS	'Servicing_Agent_Code'
		,c.[Agent_Name]	AS	'Servicing_Agent_Name'
		,c.[Grade]			
		,c.[Date_Appointed]	
		,c.[Agent_Status]		
		,a.[Policy No]		
		,a.[Issued Date]		
		,a.[Policy Status]	
		,MIN(a.[Collected Date]) AS [Collected Date]
		,a.[Area Code]
--		,a.[Effected Date]
		,SUM(a.[FYP]) AS SUM_FYP
		,SUM(a.[RYP]) AS SUM_RYP
		,SUM(a.[Topup Premium])*0.1 AS TOPUP			
		,a.[Issuing Agent] AS 'Issuing_Agent_Code'
		,b.[Agent_Name]	 AS 'Issuing_Agent_Name'
	FROM [PowerBI].[dbo].[DP_TAGENTPREMIUM_TEST] a 
			JOIN [dbo].[Main_AGENT_INFO_DA] b 
				ON a.[Issuing Agent] = b.[Agent_Number]
					JOIN [dbo].[Main_AGENT_INFO_DA] c		
						ON a.[Servicing Agent] = c.[Agent_Number]
	WHERE YEAR([Collected Date]) = 2020 
			AND a.[Servicing Agent] NOT LIKE '69%' 
			AND (b.[Area_Name] NOT LIKE 'A%')		-- L?c b? MK3
			AND a.[Topup Premium] IS NOT NULL
	GROUP BY 	a.[Servicing Agent]
				,c.[Agent_Name]
				,c.[Grade]			
				,c.[Date_Appointed]	
				,c.[Agent_Status]		
				,a.[Policy No]		
				,a.[Issued Date]		
				,a.[Policy Status]	
--				,a.[Collected Date]
				,a.[Area Code]
--					,a.[Effected Date]
				,a.[Issuing Agent]
				,b.[Agent_Name]
) q
-- WHERE SUM_RYP = 0 
GROUP BY -- [Policy No], [Issued Date], [Policy Status],[Collected Date], [Issuing_Agent_Code], [Issuing_Agent_Name], [Servicing_Agent_Code], [Servicing_Agent_Name], [Grade], [Date_Appointed], [Agent_Status], FYP, RYP
		[Servicing_Agent_Code]
		,[Servicing_Agent_Name]
		,[Grade]
		,[Date_Appointed]
		,[Agent_Status]
		,[Policy No]	
		,[Issued Date]
--		,[Effected Date]
		,[Area Code]
		,[Policy Status]
--		,SUM_FYP
		,SUM_RYP
--		,TOPUP
		,[Issuing_Agent_Code]
		,[Issuing_Agent_Name]
	HAVING (SUM(SUM_FYP) + SUM(TOPUP)) != 0
