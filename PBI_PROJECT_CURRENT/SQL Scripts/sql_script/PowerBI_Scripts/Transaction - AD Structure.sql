SELECT DPO.view_DP_TAGENTPREMIUM_TEST_AFYP.[Policy No], DPO.view_DP_TAGENTPREMIUM_TEST_AFYP.[Collected Date], DPO.view_DP_TAGENTPREMIUM_TEST_AFYP.[Policy Status], DPO.view_DP_TAGENTPREMIUM_TEST_AFYP.[Issuing Agent], 
             DPO.view_DP_TAGENTPREMIUM_TEST_AFYP.[Issued Date], DPO.view_DP_TAGENTPREMIUM_TEST_AFYP.[Servicing Agent], DPO.view_DP_TAGENTPREMIUM_TEST_AFYP.FYP, DPO.view_DP_TAGENTPREMIUM_TEST_AFYP.RYP, 
             DPO.view_DP_TAGENTPREMIUM_TEST_AFYP.[Topup Premium], DPO.view_DP_TAGENTPREMIUM_TEST_AFYP.AFYP_new, a.Sales_Unit_Code AS AD_Code, a.Sales_Unit AS AD_Name, a.Sales_Unit_Code + a.Area_Name AS KeyAD
FROM   DPO.view_DP_TAGENTPREMIUM_TEST_AFYP LEFT OUTER JOIN
             dbo.Main_AGENT_INFO_DA AS a ON DPO.view_DP_TAGENTPREMIUM_TEST_AFYP.[Servicing Agent] = a.Agent_Number

WHERE (a.Agent_Name NOT LIKE '%BHNT%') AND (a.Sales_Unit_Code NOT LIKE 'ADM00')