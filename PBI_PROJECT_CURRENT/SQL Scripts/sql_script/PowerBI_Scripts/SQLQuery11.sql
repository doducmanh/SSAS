SELECT 
			 a.[Servicing Agent] AS	'Servicing_Agent_Code'
			,c.[Agent_Name]	AS	'Servicing_Agent_Name'
			,c.[Grade]			
			,c.[Date_Appointed]	
			,c.[Agent_Status]		
			,a.[Policy No]
			,a.[Product Code]
			,a.[Issued Date]		
			,a.[Policy Status]	
			,MIN(a.[Collected Date]) AS [Collected Date]
			,a.[Area Code]
	--		,a.[Effected Date]
			,SUM(a.[FYP]) AS SUM_FYP
			,SUM(a.[AFYP_new]) AS SUM_AFYP
			,SUM(a.[RYP]) AS SUM_RYP
			,SUM(a.[Topup Premium])*0.1 AS TOPUP			
			,a.[Issuing Agent] AS 'Issuing_Agent_Code'
			,b.[Agent_Name]	 AS 'Issuing_Agent_Name'
			
		FROM [DPO].[view_DP_TAGENTPREMIUM_TEST_AFYP] a 
			JOIN [dbo].[Main_AGENT_INFO_DA] b 
				ON a.[Issuing Agent] = b.[Agent_Number]
					JOIN [dbo].[Main_AGENT_INFO_DA] c		
						ON a.[Servicing Agent] = c.[Agent_Number]

		WHERE 
		YEAR([Collected Date]) = 2021
			AND MONTH([Collected Date]) = 1 
			AND a.[Servicing Agent] NOT LIKE '69%' 
			AND (b.[Area_Name] NOT LIKE 'A%')		-- NOT MK3
--			AND a.[Topup Premium] IS NOT NULL

		GROUP BY 	a.[Servicing Agent]
			,c.[Agent_Name]
			,c.[Grade]			
			,c.[Date_Appointed]	
			,c.[Agent_Status]		
			,a.[Policy No]
			,a.[Product Code]
			,a.[Issued Date]		
			,a.[Policy Status]	
--			,a.[Collected Date]
			,a.[Area Code]
--			,a.[Effected Date]
			,a.[Issuing Agent]
			,b.[Agent_Name]