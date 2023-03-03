CREATE OR ALTER VIEW view_Detail_1 AS

	SELECT a.[Servicing Agent]	AS 'Mã ??i lý ph?c v?'
	  ,c.[Agent_Name]		AS 'Tên ??i lý ph?c v?'
	  ,c.[Grade]			AS 'Ch?c v?'
	  ,c.[Date_Appointed]	AS 'Ngày gia nh?p'
	  ,c.[Agent_Status]		AS 'Trình tr?ng ho?t ??ng'
	  ,a.[Policy No]		AS 'S? h?p ??ng'
      ,a.[Issued Date]		AS 'Ngày phát hành'
	  ,a.[Policy Status]	AS 'Trình tr?ng h?p ??ng'
	  ,SUM(IIF(a.[Policy Status]='IF', a.[AFYP] , 0)) AS Gross_AFYP
	  ,SUM(IIF(a.[Policy Status]='IF', a.[FYP]  , 0)) AS Gross_FYP
	  ,SUM(IIF(a.[Policy Status]='DC' OR a.[Policy Status] = 'FL' , -a.[AFYP] , 0)) AS Cancel_AFYP	  
	  ,SUM(IIF(a.[Policy Status]='DC' OR a.[Policy Status] = 'FL' , -a.[FYP]  , 0)) AS Cancel_FYP
	  ,a.[Issuing Agent]
	  ,b.[Agent_Name]	  
FROM [PowerBI].[dbo].[DP_TAGENTPREMIUM_TEST] a 
		JOIN [dbo].[Main_AGENT_INFO_DA] b 
			ON a.[Issuing Agent] = b.[Agent_Number]
				JOIN [dbo].[Main_AGENT_INFO_DA] c		
					ON a.[Servicing Agent] = c.[Agent_Number]
GROUP BY a.[Policy No] ,c.[Agent_Name],c.[Grade],c.[Date_Appointed],c.[Agent_Status],,a.[Policy No],a.[Issued Date],a.[Policy Status],a.[Issuing Agent],b.[Agent_Name]