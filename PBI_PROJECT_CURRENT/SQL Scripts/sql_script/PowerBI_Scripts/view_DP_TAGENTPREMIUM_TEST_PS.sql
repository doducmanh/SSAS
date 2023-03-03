CREATE OR ALTER VIEW view_DP_TAGENTPREMIUM_TEST_PS AS

SELECT [Policy No], [Product Code], [Premium transaction], [PREM TRAN NAME], [Premium Collected], [Collected Date], [Applied Premium Date], [FYP Before Discount], [FYP Discount], [FYP], [RYP], [Topup Premium], [Premium Term], [Premium Year], [Policy Status], [Policy Year], [Policy Term], 
             [Frequency of Payment], [Issued Date], [Effected Date], [Terminated Date], [Lapse Date], [Due date], [Next Due Date], [Transfer Date], [POLICY ACKNOWLED], [Sum Assure], [Area Code], [Servicing Agent], [Freelook], [Proposal Receive Date], [RISK_COMMENCE_DATE], 
             [Age_Customer], [Issuing Agent], [AFYP]/*,[SA_Next_Issued_Date]*/ , [SFC]
/*,[SA_Grade]*/ 
FROM [PowerBI].[DPO].[SFC Dynamic]

UNION ALL

SELECT *, '' AS SFC
FROM   [DPO].[view_PS_in_DP_POSubmitDA]