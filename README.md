# SSAS
<b>Summary:</b>
<p></p>
- Our company have many data sources from excel (almost), outlook, CORE system,...
- With data from excel, outlook,... we conduct ETL by VBA(macro), Power Query, then insert tables to database.
- IT provide 11 main tables for my deparment, they will run job insert/delete to refresh table everyday.
- From all above data sources, our team build DW, Star Schema, Snowflake Schema model for my deparment based on business rules.
- We create Views, Stored procedure, Functions, Table,....Store procedure run job to add data to tables daily.
- Between Tabular and Multidimensional Model, we choose build Tabular Model with database from SQL Server and deploy to SSAS server.
- using Row Level Security (RLS) to manage AD's role to access, view reports on Power Bi. 
<p></p>
<b>Tool:</b>
<p></p>
- Data Processing, ETL: VBA(macro), Power Query, SSIS.
- Database: SQL Server
- Analysis service: SSAS, Visual Studio (Tabular Model)
- Visualization: Power BI Desktop Report Server
<p></p>
<b>Model:</b>
<p></p>
*Due to the company's privacy policy, I cannot share the data details.
<p></p>

![image](https://user-images.githubusercontent.com/59658937/222782480-526b46cf-19b2-440b-85b4-3ac47b3f90a2.png)

<p></p>
![image](https://user-images.githubusercontent.com/59658937/222780108-dd24270a-f38f-4f40-aeae-8f965f0c1284.png)
<p></p>
<b>Model & Measures:</b>
<p></p>
![image](https://user-images.githubusercontent.com/59658937/222781186-4f1f9e6d-544a-42e6-8ae8-83d27298c4c6.png)
![image](https://user-images.githubusercontent.com/59658937/222781209-67fcd75d-07c1-4832-bb47-34085c40e0e1.png)
![image](https://user-images.githubusercontent.com/59658937/222781244-511560a7-4a7c-4d40-ac91-2b972e9c803d.png)
<p></p>
<b>Manage Roles and Security:</b>
<p></p>
![image](https://user-images.githubusercontent.com/59658937/222781289-555ac562-1f5a-44ce-b009-8d19066d97d0.png)
- add/delete member to role:
![image](https://user-images.githubusercontent.com/59658937/222781362-a324f6b8-1de5-43b2-8d00-2723a4b8660a.png)
- manage role's user by Row Level Security:
![image](https://user-images.githubusercontent.com/59658937/222781438-99b059ff-312d-4a88-bb69-3dfbb0ce1414.png)
