-- VIEW L?Y DATA ?? T?I B?NG DETAIL T??NG ?NG V?I SHEET DETAIL_SUM T? SALE DAILY REPORT (EXCEL)

CREATE OR ALTER VIEW view_Detail_v2 AS
SELECT 
		 [Servicing_Agent_Code]
		,[Servicing_Agent_Name]
		,[Grade]
		,[Date_Appointed]
		,[Agent_Status]
		,[Policy No]	
		,[Issued Date]
		,[Effected Date]
		,[Policy Status]
--		,MAX([Effected Date]) AS [Effected Date]
--		,IIF(a.[Policy Status]='IF', a.[AFYP] , 0) AS Gross_AFYP
		,(IIF([Policy Status]='IF' AND SUM_RYP = 0, SUM(SUM_FYP) + SUM(TOPUP) , 0)) AS Gross_FYP
--		,IIF(a.[Policy Status]='DC' OR a.[Policy Status] = 'FL' , -a.[AFYP] , 0) AS Cancel_AFYP	  
--		,IIF(a.[Policy Status]='DC' OR a.[Policy Status] = 'FL' , -a.[FYP]  , 0) AS Cancel_FYP
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
					,a.[Collected Date]
					,a.[Effected Date]
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
				WHERE YEAR([Issued Date]) = 2021
						AND MONTH([Effected Date]) = 1 
						AND a.[Servicing Agent] NOT LIKE '69%' 
						AND a.[Area Code] NOT LIKE 'A%'
						AND a.[Topup Premium] IS NOT NULL
		GROUP BY 	a.[Servicing Agent]
					,c.[Agent_Name]
					,c.[Grade]			
					,c.[Date_Appointed]	
					,c.[Agent_Status]		
					,a.[Policy No]		
					,a.[Issued Date]		
					,a.[Policy Status]	
					,a.[Collected Date]
					,a.[Effected Date]
					,a.[Issuing Agent]
					,b.[Agent_Name]
			) q
WHERE SUM_RYP = 0 
GROUP BY -- [Policy No], [Issued Date], [Policy Status],[Collected Date], [Issuing_Agent_Code], [Issuing_Agent_Name], [Servicing_Agent_Code], [Servicing_Agent_Name], [Grade], [Date_Appointed], [Agent_Status], FYP, RYP
		[Servicing_Agent_Code]
		,[Servicing_Agent_Name]
		,[Grade]
		,[Date_Appointed]
		,[Agent_Status]
		,[Policy No]	
		,[Issued Date]
		,[Effected Date]
		,[Policy Status]
--		,SUM_FYP
		,SUM_RYP
--		,TOPUP
		,[Issuing_Agent_Code]
		,[Issuing_Agent_Name]
--	HAVING (IIF([Policy Status]='IF' AND SUM_RYP = 0, SUM(SUM_FYP) + SUM(TOPUP) , 0)) != 0
