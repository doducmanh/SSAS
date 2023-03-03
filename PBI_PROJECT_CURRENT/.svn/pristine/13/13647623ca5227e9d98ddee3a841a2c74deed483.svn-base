/*row possible childs in a column*/
WITH Hierarchy(ChildId, ChildName, ParentId, Childs)
AS
(
    SELECT Agent_Number AS Id
		, Agent_Name AS Name
		, Supervisor_Code AS ParentId
		, CAST('' AS VARCHAR(MAX))
        FROM [dbo].[Main_AGENT_INFO_DA] AS LastGeneration
        WHERE Agent_Number NOT IN (SELECT COALESCE(A.Supervisor_Code, 0) FROM [dbo].[Main_AGENT_INFO_DA] AS A)     
    UNION ALL
    SELECT PrevGeneration.Agent_Number AS Id, PrevGeneration.Agent_Name AS Name, PrevGeneration.Supervisor_Code AS ParentId,
    CAST(	CASE WHEN Child.Childs = ''
				THEN(CAST(Child.ChildId AS VARCHAR(MAX)))
				ELSE(Child.Childs + '.' + CAST(Child.ChildId AS VARCHAR(MAX)))
			END AS VARCHAR(MAX))
        FROM [dbo].[Main_AGENT_INFO_DA] AS PrevGeneration
        INNER JOIN Hierarchy AS Child ON PrevGeneration.Agent_Number = Child.ParentId    
)
SELECT *
    FROM Hierarchy
--WHERE ChildId = '60044741'
OPTION(MAXRECURSION 32767)
