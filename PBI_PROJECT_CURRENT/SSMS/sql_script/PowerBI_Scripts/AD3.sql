CREATE OR ALTER VIEW [DPO].[AD3]
AS
SELECT DISTINCT 
             AD_Code, glevel, structure, Territory_Code, ExplodedDate, CASE WHEN (LEFT(structure, 3) = 'CDO' AND LEFT(structure, 4) != 'CDO0') THEN SUBSTRING(structure, 1, 3) WHEN LEFT(structure, 4) = 'CDO0' THEN SUBSTRING(structure, 1, 4) END AS L0, 
             CASE WHEN LEFT(structure, 4) = 'CDO|' THEN SUBSTRING(structure, 5, 5) WHEN LEFT(structure, 4) = 'CDO0' THEN SUBSTRING(structure, 6, 5) END AS L1, CASE WHEN LEFT(structure, 4) = 'CDO|' THEN SUBSTRING(structure, 11, 5) WHEN LEFT(structure, 4) 
             = 'CDO0' THEN SUBSTRING(structure, 12, 5) END AS L2, CASE WHEN LEFT(structure, 4) = 'CDO|' THEN SUBSTRING(structure, 17, 5) WHEN LEFT(structure, 4) = 'CDO0' THEN SUBSTRING(structure, 18, 5) END AS L3, CASE WHEN LEFT(structure, 4) 
             = 'CDO|' THEN SUBSTRING(structure, 23, 5) WHEN LEFT(structure, 4) = 'CDO0' THEN SUBSTRING(structure, 24, 5) END AS L4
FROM   DPO.AD2