CREATE VIEW view_agent_info AS
	SELECT
		Agent_Number,
		Agent_Name,
		Agent_Status,
		Grade,
		Date_Appointed,
		Terminated_date,
		Supervisor_Code as parent_code,
		RIGHT(Supervisor_name, len(Supervisor_name)-5) as parent_name,
		Sales_Unit_Code,
		Sales_Unit
	FROM dbo.Main_AGENT_INFO_DA
	WHERE Supervisor_Code <>''
UNION
	SELECT
		Agent_Number,
		Agent_Name,
		Agent_Status,
		Grade,
		Date_Appointed,
		Terminated_date,
		Parent_Supervisor_Code as parent_code,
		RIGHT(Parent_Supervisor_Name, len(Parent_Supervisor_Name)-5) as parent_name,
		Sales_Unit_Code,
		Sales_Unit
	FROM dbo.Main_AGENT_INFO_DA
	WHERE Supervisor_Code ='';