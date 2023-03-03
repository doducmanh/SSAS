USE [PowerBI]
GO

/****** Object:  View [DPO].[AD_STRUCTURE_Exploded]    Script Date: 7/26/2021 9:18:29 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER  VIEW [DPO].[AD_STRUCTURE_Exploded] AS
WITH E00(N) AS (SELECT 1 UNION ALL SELECT 1)
    ,E02(N) AS (SELECT 1 FROM E00 a, E00 b)
    ,E04(N) AS (SELECT 1 FROM E02 a, E02 b)
    ,E08(N) AS (SELECT 1 FROM E04 a, E04 b)
    ,E16(N) AS (SELECT 1 FROM E08 a, E08 b)
    ,E32(N) AS (SELECT 1 FROM E16 a, E16 b)
    ,cteTally(N) AS (SELECT ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) FROM E32)
    ,DateRange AS
(
    SELECT ExplodedDate = DATEADD(DAY,N - 1,'2013-01-01')
    FROM cteTally
    WHERE N <= 3660
)


     SELECT TOP 100 PERCENT eh.[AD_Code], eh.[Grade], IIF(eh.[AD_Parent_Code] IS NULL,'',eh.[AD_Parent_Code]) AS [AD_Parent_Code],IIF(eh.[Territory_Code] IS NULL,'PHL',eh.[Territory_Code]) AS [Territory_Code]
	 , eh.[Start_date]
	 , eh.[End_Date]
	 , eh.[Status]
	 , d.[ExplodedDate]
   FROM    [DPO].[AD_STRUCTURE_Start_End] eh LEFT JOIN
                DateRange d ON d.ExplodedDate >= eh.[Start_Date] AND d.ExplodedDate < IIF(eh.[End_Date] IS NULL, GetDate(),eh.[End_Date])
	  ORDER BY [AD_Code], [Start_date], [ExplodedDate]
GO
