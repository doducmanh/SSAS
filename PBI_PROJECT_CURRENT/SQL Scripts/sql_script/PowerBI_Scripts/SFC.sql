WITH CountMonth AS 
(SELECT SQ.Code
		, SQ.Name
		, SQ.Grade
		, SQ.Status
		, SQ.Date_Appointed
		, SQ.Date_LastIssue
		, MAX(VP2.[Collected Date]) AS Date_LastService
 FROM   (
		 SELECT A.Code
				 , A.Name
				 , A.Grade
				 , A.Status
				 , AA.Date_Appointed
				 , MAX(VP.[Issued Date]) AS Date_LastIssue
		FROM    DPO.DW_Agent AS A 
				LEFT OUTER JOIN DPO.DW_Agent_Appoint AS AA ON A.Code = AA.Code 
				LEFT OUTER JOIN DPO.view_premium AS VP ON A.Code = VP.[Issuing Agent]
		WHERE  (A.Name NOT LIKE 'DUMMY%')
		GROUP BY A.Code, A.Name, A.Grade, A.Status, AA.Date_Appointed) AS SQ 
		LEFT OUTER JOIN (SELECT [Policy No]
								, [Collected Date]
								, [Policy Status]
								, [Issuing Agent]
								, [Issued Date]
								, [Servicing Agent]
								, FYP
								, RYP
								, [Topup Premium]
								, AFYP
								FROM    DPO.view_premium
								WHERE ([Policy Status] = 'IF')) AS VP2 ON SQ.Code = VP2.[Servicing Agent]
								GROUP BY SQ.Code, SQ.Name, SQ.Grade, SQ.Status, SQ.Date_Appointed, SQ.Date_LastIssue
)

SELECT Code, Name, Grade, Status, Date_Appointed, Date_LastIssue, Date_LastService, ABS(DATEDIFF(MONTH, GETDATE(), Date_LastIssue)) AS Month_Issued, ABS(DATEDIFF(MONTH, GETDATE(), Date_LastService)) AS Month_Serviced
, IIF(ABS(DATEDIFF(MONTH, GETDATE(), Date_Appointed)) > 6 AND ABS(DATEDIFF(MONTH, GETDATE(), Date_LastIssue)) > 6, 1, 0)  AS SFC
FROM    CountMonth