

select json_arrayagg(json_object('nik', Employee_NIK, 'name', Employee_Name, 'email', Employee_Email,
								'data', (select json_arrayagg(json_object('comp_name', CMP.Company_Name, 'comp_id', CMP.Company_ID)) as dt
										from M_Company CMP  where CMP.Company_ID = a.Employee_CompanyID)
								)
					)as jsn
from M_Employee a;

