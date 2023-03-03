SELECT DISTINCT a.Area_Name AS Office_Code, b.Office AS Office_Name
FROM   dbo.Main_AGENT_INFO_DA AS a LEFT OUTER JOIN
             dbo.Main_AD_STRUCTURE AS b ON a.Area_Name = b.Office_Code

UNION

SELECT DISTINCT Office_Code AS Code, Office
FROM   dbo.Main_AD_STRUCTURE