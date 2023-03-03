USE [PowerBI]
GO

/****** Object:  View [DPO].[view_premium]    Script Date: 5/6/2022 4:08:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [DPO].[view_premium] AS
	  SELECT [Policy No]
			,[Product Code]
			,[Collected Date]
			,[Policy Status]
			,[Issuing Agent]
			,[Issued Date]
			,[Proposal Receive Date]
			,[Servicing Agent]
			,[SFC]
			,[FYP]
			,[RYP]
			,[Topup Premium]
			,[AFYP_new] AS AFYP
			,[Area Code]
			,[POLICY ACKNOWLED]
			,[Freelook]
  FROM [PowerBI].[DPO].[view_DP_TAGENTPREMIUM_TEST_AFYP]
  --WHERE [Collected Date] > '2020-01-01'
GO


