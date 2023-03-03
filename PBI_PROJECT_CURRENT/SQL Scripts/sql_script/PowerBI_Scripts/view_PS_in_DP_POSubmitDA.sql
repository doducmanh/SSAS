-- Note: from a. Phú IT
--View này lấy data toàn bộ phí đóng của khách hàng, nếu khách hàng đã đóng phí nhưng trạng thái hợp đồng là PS thì cũng sẽ có data.
--Chỉ trường hợp PS nhưng chưa đóng phí thì ko có thôi.
--View này dành cho bên DA tính thưởng cho đại lý nên ko chỉnh sửa gì trên view này nha 

CREATE OR ALTER VIEW view_PS_in_DP_POSubmitDA
AS
SELECT IIF ([APPLICATION_NUMBER] <>'' AND [CONTRACT_NUMBER] ='', 'PS_NNB',[CONTRACT_NUMBER]) as [Policy No]
		--[CONTRACT_NUMBER] as [Policy No]
      ,[MAIN_PRODUCT_CODE] as [Product Code]
      ,'' as [Premium transaction] 
      ,'' as [PREM TRAN NAME]
      ,NULL as [Premium Collected]
      ,[TRANSACTION_DATE] as [Collected Date]
      ,NULL as [Applied Premium Date]
      ,NULL as [FYP Before Discount]
      ,NULL as [FYP Discount]
      ,[SUBMIT_AMT] as [FYP]
      ,NULL as [RYP] 
      ,NULL as [Topup Premium]
      ,NULL as [Premium Term]
      ,NULL as [Premium Year]

	  ,-- Với những hợp đồng chưa có [CONTRACT_NUMBER] nhưng có [APPLICATION_NUMBER]: gán [CONTRACT_STATUS] = 'PS_NNB' ĐỂ LỌC RA NHỮNG HỢP ĐỒNG POs submitted (not in NB)
		IIF ([APPLICATION_NUMBER] <>'' AND [CONTRACT_NUMBER] ='', 'PS_NNB',[CONTRACT_STATUS]) as [Policy Status]

      ,NULL as [Policy Year]
      ,NULL as [Policy Term]
      ,'' as [Frequency of Payment]
      ,[ISSUED_DATE] as [Issued Date]
      ,[EFFECTIVE_DATE] as [Effected Date]
      ,NULL as [Terminated Date]
      ,NULL as [Lapse Date]
      ,NULL as [Due date]
      ,NULL as [Next Due Date]
      ,NULL as [Transfer Date]
      ,NULL as [POLICY ACKNOWLED]
      ,NULL	as [Sum Assure]
      ,[SALEOFFICE] as [Area Code]
      ,NULL as [Servicing Agent]
      ,NULL as [Freelook]
      ,NULL as [Proposal Receive Date]
      ,NULL as [RISK_COMMENCE_DATE]
      ,NULL as [Age_Customer]
      ,[AGNTNUM] as [Issuing Agent]
      ,NULL AS [AFYP]

  FROM [PowerBI].[DPO].[DP_POSubmitDA]
    where [CONTRACT_STATUS] IN ('PS', '')
