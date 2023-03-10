/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW view_Detail_2 AS
	SELECT [Mã đại lý phục vụ]
		  ,[Tên đại lý phục vụ]
		  ,[Chức vụ]
		  ,[Ngày gia nhập]
		  ,[Trình trạng hoạt động]
		  ,[Số hợp đồng]
		  ,[Ngày phát hành]
		  ,[Trình trạng hợp đồng]
		  ,[Gross_AFYP]
		  ,[Gross_FYP]
		  ,[Cancel_AFYP]
		  ,[Cancel_FYP]
		  ,[Gross_AFYP] + [Cancel_AFYP] AS Net_AFYP
		  ,[Gross_FYP] + [Cancel_FYP] AS Net_FYP
		  ,[Issuing Agent]
		  ,[Agent_Name]
	  FROM [PowerBI].[DPO].[view_Detail_1]