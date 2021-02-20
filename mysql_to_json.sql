
select json_arrayagg(json_object('kk_id', a.kk_id,
					'kk_name', a.kk_name,
                    'kk_number', a.kk_number,
					'data', (select json_arrayagg(json_object('member_id', b.member_id,
																'member_name', b.member_name,
																'member_kk_id', b.member_kk_id,
                                                                'member_birth_date', b.member_birth_date)
										)
								from m_member b where b.member_kk_id = a.kk_id
							 )  
					))as result
from m_kk a ;
