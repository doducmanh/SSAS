CREATE VIEW view_AD_info_NotNull AS
	SELECT
		a.Sales_Unit_Code as CODE_AD, 
		a.Sales_Unit as CODE_NAME, 
		s.GRADE,
		s.[STATUS],
		s.CREATED_DATE, 
		s.APPOINTED_DATE,
		s.CODE_RD as parent_code,
		s.NAME_RD as parent_name
	FROM dbo.Main_AD_STRUCTURE s RIGHT JOIN dbo.Main_AGENT_INFO_DA a ON s.CODE_AD = a.Sales_Unit_Code
	WHERE s.CODE_RD <>'' AND s.APPOINTED_DATE IS NOT NULL
UNION
	SELECT
		a.Sales_Unit_Code as CODE_AD, 
		a.Sales_Unit as CODE_NAME, 
		s.GRADE,
		s.[STATUS],
		s.CREATED_DATE, 
		s.APPOINTED_DATE,
		s.CODE_RD as parent_code,
		s.NAME_RD as parent_name
	FROM dbo.Main_AD_STRUCTURE s RIGHT JOIN dbo.Main_AGENT_INFO_DA a ON s.CODE_AD = a.Sales_Unit_Code
	WHERE s.CODE_RD ='' AND s.APPOINTED_DATE IS NOT NULL;