USE [PowerBI]
GO

/****** Object:  View [DPO].[DW_AD]    Script Date: 9/3/2021 8:33:39 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER VIEW [DPO].[DW_AD] AS
WITH AllAD AS (
SELECT DISTINCT Sales_Unit_Code AS AD_Code, Sales_Unit AS AD_Name
FROM   [DPO].Main_AGENT_INFO_DA

UNION

SELECT DISTINCT a.AD_Code
--,b.Sales_Unit
, IIF(b.Sales_Unit IS NULL, a.AD_Name, b.Sales_Unit) AS AD_Name
FROM [DPO].[Main_AD_STRUCTURE] AS a

LEFT JOIN [DPO].Main_AGENT_INFO_DA AS b ON b.Sales_Unit_Code = a.AD_Code
)
, A AS (
SELECT [AD_Code]
      ,MAX([ID]) AS Last_Status_Date
  FROM [PowerBI].[DPO].[Main_AD_STRUCTURE]
  GROUP BY
		[AD_Code]
 -- ORDER BY [AD_Code]
)
, B AS (
SELECT DISTINCT K.[AD_Code]
	  ,K.AD_Name
	  ,K.Grade
      ,K.[Status] AS Last_Status
	  ,K.Status_date AS Last_Status_Date
  FROM [PowerBI].[DPO].[Main_AD_STRUCTURE] AS K
  RIGHT JOIN A
  ON K.AD_Code = A.AD_Code AND K.ID = A.Last_Status_Date
  --ORDER BY K.[AD_Code]
)
, Q AS (SELECT AD_Code, MAX(ID) AS Last_ID
                   FROM   [DPO].Main_AD_STRUCTURE
                   WHERE Status = 'Rejoined' OR Status = 'Appointed'
				   GROUP BY AD_Code
				   )
, K AS
    (SELECT Q1.ID, Q1.AD_Code, Q1.AD_Name, Q1.Grade, Q1.AD_Parent_Code, Q1.AD_Parent, Q1.Territory, Q1.Territory_Code, Q1.Office, Q1.Office_Code, Q1.Status_date, Q1.Status, Q1.Update_Time
    FROM    [DPO].Main_AD_STRUCTURE AS Q1 INNER JOIN
                 Q AS Q_1 ON Q_1.AD_Code = Q1.AD_Code AND Q_1.Last_ID = Q1.ID)
, C AS (
    SELECT DISTINCT AD_Code, AD_Name, Grade, AD_Parent, AD_Parent_Code, Territory, Territory_Code, Status, Status_date
   FROM    K AS K_1

)
, L AS (SELECT AD_Code, MAX(ID) AS Last_ID
                   FROM   [DPO].Main_AD_STRUCTURE
                   WHERE Status = 'Demoted' OR Status = 'Promoted'
				   GROUP BY AD_Code
				   )
, M AS
    (SELECT Q1.ID, Q1.AD_Code, Q1.Status_date, Q1.Status, Q1.Update_Time
    FROM    [DPO].Main_AD_STRUCTURE AS Q1 INNER JOIN
                 L AS Q_1 ON Q_1.AD_Code = Q1.AD_Code AND Q_1.Last_ID = Q1.ID)
, D AS (
    SELECT DISTINCT AD_Code, Status AS Demote_Promote_Date, Status_date
   FROM    M AS K_1

)

SELECT AllAD.AD_Code
	,AllAD.AD_Name
	,B.Grade
	,B.Last_Status
	,B.Last_Status_Date
	,C.Status_date AS Appointed_Date
	,IIF (B.Last_Status = 'Terminated', B.Last_Status_Date,NULL) AS Terminated_Date
	,D.Status_date AS DemotePromote_Date
FROM AllAD
LEFT JOIN B
ON AllAD.AD_Code = B.AD_Code

LEFT JOIN C
ON AllAD.AD_Code = C.AD_Code

LEFT JOIN D
ON AllAD.AD_Code = D.AD_Code

GO
