CREATE VIEW [DPO].[AD2]
AS
WITH orderedTree(AD_Code, glevel, structure, Territory_Code, ExplodedDate) AS 
(SELECT AD_Code, 
		0 AS glevel, 
		CAST(AD_Code AS NVARCHAR(MAX)) AS structure,  
		Territory_Code, 
		ExplodedDate
FROM   [DPO].[AD_STRUCTURE_Exploded]
WHERE	AD_Code = 'CDO'	
	UNION ALL
SELECT	child.AD_Code,
		parent.glevel + 1 AS Expr1,
		CAST({ fn CONCAT(parent.structure + '|', child.AD_Code) } AS NVARCHAR(MAX)) AS structure,
		child.Territory_Code, 
		child.ExplodedDate
FROM   [DPO].[AD_STRUCTURE_Exploded] AS child 
INNER JOIN
orderedTree AS parent 
ON child.AD_Parent_Code = parent.AD_Code 
AND child.ExplodedDate = parent.ExplodedDate
)

,orderedTree2(AD_Code, glevel, structure, Territory_Code, ExplodedDate) AS 
(SELECT AD_Code, 
		0 AS glevel, 
		CAST(AD_Code AS NVARCHAR(MAX)) AS structure, 
		Territory_Code, 
		ExplodedDate
FROM   [DPO].[AD_STRUCTURE_Exploded]
WHERE	AD_Code = 'CDO0'	
	UNION ALL
SELECT	child.AD_Code,
		parent.glevel + 1 AS Expr1,
		CAST({ fn CONCAT(parent.structure + '|', child.AD_Code) } AS NVARCHAR(MAX)) AS structure,
		child.Territory_Code, 
		child.ExplodedDate
FROM   [DPO].[AD_STRUCTURE_Exploded] AS child 
INNER JOIN
orderedTree2 AS parent 
ON child.AD_Parent_Code = parent.AD_Code 
AND child.ExplodedDate = parent.ExplodedDate
)


SELECT *
FROM orderedTree
UNION ALL
SELECT *
FROM orderedTree2 