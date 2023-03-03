/****** Script for SelectTopNRows command from SSMS  ******/
With Temp AS
(SELECT  [Area_Name]
      ,[Sales_Unit]
      ,[Sales_Unit_Code]
      ,[Parent_Supervisor_Code]
      ,[Parent_Supervisor_Name]
      ,[Supervisor_Code]
      ,[Supervisor_Name]
      ,[Agent_Number]
      ,[Agent_Name]
      ,[Gender]
      ,A.[Grade]
      ,[Club_Class]
      ,[Agent_Status]
      ,[Birthday]
      ,[BirthPlace]
      ,[ID_Card]
      ,[Issued Date]
      ,[Issued Place]
      ,[Marriage]
      ,[Age]
      ,[Client_Code]
      ,[Client_Name]
      ,[Email]
      ,[Telephone]
      ,[Hand_Phone]
      ,[Contact Address]
      ,[Contact2]
      ,[Contact3]
      ,[Contact4]
      ,[Contact5]
      ,[Alternate_Address]
      ,[Alternate2]
      ,[Alternate3]
      ,[Alternate4]
      ,[Alternate5]
      --,[Date_Appointed]
      ,[Terminated_date]
      ,[Reason Terminated]
      ,[Recovered Date]
      ,[Client Number of Introducer]
      ,[Client Name of Introducer]
      ,[Client ID number of]
      ,[Client Email of Introducer]
      ,[Agent_Bank_Account]
      ,[Bank_Code]
      ,[Bank Name]
      ,[Bank_Address]
      ,[Bank_Address2]
      ,[Bank_Address3]
      ,[Bank_Address4]
      ,[License_No]
      ,[Tax Code]
      ,[Tax Office]
      ,[Previous Insurance]
      ,[Experience in the insurance]
      ,[Agent Classification]
      ,[Promote_Date]
      ,[Demote_Date]
      ,[Effective_Date_Club_Class]
      ,[Bank_Number]
      ,[Leader]
      ,[SFC]
      ,[Leader_count]
      ,[Appointed_TAPSU]AS [Date_Appointed]
	  --, B.CURRFROM AS [Date_Appointed]
  FROM [PowerBI].[DPO].[Main_AGENT_INFO_DA] AS A
  --LEFT JOIN [DPO].[Main_AGENT_HISTORY] AS B
  --ON A.Agent_Number = B.[AGENT CODE]
  --AND B.STATUS = 'A'
  )


,Agent AS (
SELECT P.[Policy No]
      --,P.[Policy Status]
      --,P.[Issued Date]
	  ,P.[Servicing Agent]
	  ,a.[Date_Appointed]
	  ,MONTH(P.[Collected Date]) AS MonthCo
	  ,YEAR(P.[Collected Date]) AS YearCo
	  ,IIF(DATEDIFF(MONTH, a.[Date_Appointed], P.[Collected Date]) <= 3,1,0) AS Check3
	  , P.FYP + P.[Topup Premium] * 0.1 AS FYP
	  
	  --,IIF(DATEDIFF(day, a.[Date_Appointed], P.[Issued Date]) <= 30,1,0) AS Day30
	  --,IIF(DATEDIFF(day, a.[Date_Appointed], P.[Issued Date]) <= 60,1,0) AS Day60
	  --,IIF(DATEDIFF(day, a.[Date_Appointed], P.[Issued Date]) <= 90,1,0) AS Day90
FROM [PowerBI].[DPO].[view_premium] AS P
LEFT JOIN Temp AS a
ON a.Agent_Number = P.[Servicing Agent]
WHERE P.SFC <> 'S'

)
SELECT 
	Agent.YearCo, Agent.MonthCo
	,Agent.Check3
	,SUM(FYP) AS FYP


FROM Agent
GROUP BY
Agent.MonthCo
	,Agent.YearCo
	,Agent.Check3
ORDER BY Agent.YearCo desc, Agent.MonthCo desc
