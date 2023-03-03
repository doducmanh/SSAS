/****** Script for SelectTopNRows command from SSMS  ******/
CREATE OR ALTER VIEW [Agency_Structure] AS

--DECLARE @cte INT = 0;

WITH A AS (
SELECT  
--[Area_Name]
--      ,[Sales_Unit_Code]
      [Supervisor_Code]
      ,[Agent_Number]
      ,[Agent_Name]
--      ,[Grade]
--      ,[Agent_Status]
  FROM [PowerBI].[dbo].[Main_AGENT_INFO_DA]
 -- WHERE Agent_Number = '60031961'
),
B AS (
SELECT A.Agent_Number
	, IIF(A.Supervisor_Code <> '', A.Supervisor_Code, NULL) AS L1
	, IIF(A1.Supervisor_Code <> '', A1.Supervisor_Code, NULL) AS L2
	, IIF(A2.Supervisor_Code <> '', A2.Supervisor_Code, NULL) AS L3
	, IIF(A3.Supervisor_Code <> '', A3.Supervisor_Code, NULL) AS L4
	, IIF(A4.Supervisor_Code <> '', A4.Supervisor_Code, NULL) AS L5
	, IIF(A5.Supervisor_Code <> '', A5.Supervisor_Code, NULL) AS L6
	, IIF(A6.Supervisor_Code <> '', A6.Supervisor_Code, NULL) AS L7
	, IIF(A7.Supervisor_Code <> '', A7.Supervisor_Code, NULL) AS L8
	, IIF(A8.Supervisor_Code <> '', A8.Supervisor_Code, NULL) AS L9
	, IIF(A9.Supervisor_Code <> '', A9.Supervisor_Code, NULL) AS L10
--	, A10.Supervisor_Code AS L11
FROM A
LEFT JOIN A AS A1 ON A.Supervisor_Code = A1.Agent_Number
LEFT JOIN A AS A2 ON A1.Supervisor_Code = A2.Agent_Number
LEFT JOIN A AS A3 ON A2.Supervisor_Code = A3.Agent_Number
LEFT JOIN A AS A4 ON A3.Supervisor_Code = A4.Agent_Number
LEFT JOIN A AS A5 ON A4.Supervisor_Code = A5.Agent_Number
LEFT JOIN A AS A6 ON A5.Supervisor_Code = A6.Agent_Number
LEFT JOIN A AS A7 ON A6.Supervisor_Code = A7.Agent_Number
LEFT JOIN A AS A8 ON A7.Supervisor_Code = A8.Agent_Number
LEFT JOIN A AS A9 ON A8.Supervisor_Code = A9.Agent_Number
--LEFT JOIN A AS A10 ON A9.Supervisor_Code = A10.Agent_Number
),
C AS (
SELECT B.*
	   , COALESCE(B.L10, B.L9, B.L8, B.L7, B.L6, B.L5, B.L4, B.L3, B.L2, B.L1, B.Agent_Number) AS L0R
FROM B
)
SELECT C.*
	,CASE
		WHEN L0R = Agent_Number THEN 0
		WHEN L0R = L1 THEN 1
		WHEN L0R = L2 THEN 2
		WHEN L0R = L3 THEN 3
		WHEN L0R = L4 THEN 4
		WHEN L0R = L5 THEN 5
		WHEN L0R = L6 THEN 6
		WHEN L0R = L7 THEN 7
		WHEN L0R = L8 THEN 8
		WHEN L0R = L9 THEN 9
		WHEN L0R = L10 THEN 10
	END AS INDEX_LEADER
FROM C