	SELECT
		a.Sales_Unit_Code as CODE_AD, 
		a.Sales_Unit as CODE_NAME, 
		s.GRADE,
		s.[STATUS],
		s.CREATED_DATE, 
		s.APPOINTED_DATE,
		IIF (s.GRADE = 'RD', s.CODE_TD, s.CODE_RD)  as parent_code,
		IIF (s.GRADE = 'RD', s.NAME_TD, s.NAME_RD)  as parent_name
	FROM dbo.AD_STRUCTURE s RIGHT JOIN dbo.Main_AGENT_INFO_DA a ON s.CODE_AD = a.Sales_Unit_Code
	WHERE s.APPOINTED_DATE IS NOT NULL
UNION
	SELECT
		a.Sales_Unit_Code as CODE_AD, 
		a.Sales_Unit as CODE_NAME, 
		s.GRADE,
		s.[STATUS],
		s.CREATED_DATE, 
		s.APPOINTED_DATE,
		s.CODE_TD  as parent_code,
		s.NAME_TD as parent_name
	FROM dbo.AD_STRUCTURE s RIGHT JOIN dbo.Main_AGENT_INFO_DA a ON s.CODE_AD = a.Sales_Unit_Code
	WHERE s.CODE_RD =''AND s.APPOINTED_DATE IS NOT NULL;