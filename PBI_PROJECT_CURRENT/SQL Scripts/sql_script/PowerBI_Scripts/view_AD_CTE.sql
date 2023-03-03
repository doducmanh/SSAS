WITH orderedTree(AD_Code, glevel, structure, ExplodedDate) AS 
(SELECT AD_Code, 0 AS glevel, CAST(AD_Code AS NVARCHAR(MAX)) AS structure, ExplodedDate
FROM    [PowerBI].[DPO].[AD1]
WHERE  (AD_Code = 'CDO')
UNION ALL
SELECT child.AD_Code, parent.glevel + 1 AS Expr1,  CONCAT(parent.structure, '|', child.AD_Code)  AS structure, child.ExplodedDate
FROM  [PowerBI].[DPO].[AD1] AS child INNER JOIN
       orderedTree AS parent ON child.AD_Parent_Code = parent.AD_Code AND child.ExplodedDate = parent.ExplodedDate)
    SELECT AD_Code, glevel, structure, ExplodedDate
   FROM    orderedTree AS orderedTree_1
   OPTION (MAXRECURSION 6)