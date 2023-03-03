CREATE OR ALTER VIEW view_DailySales_policies AS
	SELECT dbo.DP_TDAILYSALES_DA.[Policy_Number], 
			dbo.DP_TDAILYSALES_DA.[Agent Code], 
			dbo.DP_TDAILYSALES_DA.[Issuing_Agent], 
			dbo.DP_TDAILYSALES_DA.[Policy_Issue_Date],
			dbo.DP_TAGENTPREMIUM_TEST.[Collected Date], 
			dbo.DP_TDAILYSALES_DA.[Sum_Assured], 
			dbo.DP_TDAILYSALES_DA.[Before_Discount_Premium], 
			dbo.DP_TDAILYSALES_DA.[Discount_Premium], 
			dbo.DP_TDAILYSALES_DA.[After_Discount_Premium], 
			dbo.DP_TDAILYSALES_DA.[Policy_Status], 
			dbo.DP_TDAILYSALES_DA.[Modal_Factor], 
			dbo.DP_TDAILYSALES_DA.[Bill_Frequency]	
	FROM dbo.DP_TDAILYSALES_DA JOIN dbo.DP_TAGENTPREMIUM_TEST
		 ON dbo.DP_TDAILYSALES_DA.[Policy_Number] = dbo.DP_TAGENTPREMIUM_TEST.[Policy No]