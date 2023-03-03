CREATE OR ALTER VIEW [view_PS_in_DP_TDAILYSALES_DA] AS
SELECT Policy_Number AS [Policy No], [Contract Type] AS [Product Code], '' AS [Premium transaction], '' AS [PREM TRAN NAME], NULL AS [Premium Collected], NULL AS [Collected Date], NULL AS [Applied Premium Date], Before_Discount_Premium AS [FYP Before Discount], 
             Discount_Premium AS [FYP Discount], After_Discount_Premium AS FYP, NULL AS RYP, NULL AS [Topup Premium], NULL AS [Premium Term], NULL AS [Premium Year], Policy_Status AS [Policy Status], NULL AS [Policy Year], NULL AS [Policy Term], '' AS [Frequency of Payment], 
             Policy_Issue_Date AS [Issued Date], NULL AS [Effected Date], NULL AS [Terminated Date], Lapsed_date AS [Lapse Date], NULL AS [Due date], NULL AS [Next Due Date], NULL AS [Transfer Date], NULL AS [POLICY ACKNOWLED], Sum_Assured AS [Sum Assure], '' AS [Area Code], 
             [Agent Code] AS [Servicing Agent], NULL AS Freelook, Proposal_Receive_Date AS [Proposal Receive Date], RISK_COMMENCE_DATE, NULL AS Age_Customer, Issuing_Agent AS [Issuing Agent], AFYP
FROM   DPO.DP_TDAILYSALES_DA
WHERE (Policy_Status = 'PS')