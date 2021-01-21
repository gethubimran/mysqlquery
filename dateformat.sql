SELECT SUM(B.count_all) AS count_all, SUM(B.count_waiting) AS count_waiting, SUM(B.count_invalid) AS count_invalid, 
					SUM(B.count_confirms) AS count_confirms, SUM(B.count_reject) AS count_reject, SUM(B.count_duplicate) AS count_duplicate
				FROM(
				SELECT pu.potent_id, pu.potent_build_id, b.build_manage_by,
						pu.potent_name, pu.potent_email, pu.potent_phone,
						DATE_FORMAT(pu.potent_create_date, '%d %b %Y') AS potent_create_date,
						DATE_FORMAT(pu.potent_visit_date, '%d %b %Y %h:%i %p') AS potent_visit_date,
						pu.potent_sv_status_id, vt.sv_status_name, pu.potent_update_by AS pickup_by
				FROM potential_user AS pu
					inner JOIN building AS b ON (b.build_id = pu.potent_build_id)
					LEFT JOIN m_visit_status AS vt ON (vt.sv_status_id = pu.potent_sv_status_id)
				WHERE potent_del_status='0' AND potent_type='sv'
				) AS A
				LEFT JOIN (
					SELECT  pu.potent_sv_status_id,
							SUM(CASE WHEN pu.potent_sv_status_id IN (1, 2, 3, 4, 5) THEN 1 ELSE 0 END) AS count_all,
							SUM(CASE WHEN pu.potent_sv_status_id = 1 THEN 1 ELSE 0 END) AS count_waiting,
							SUM(CASE WHEN pu.potent_sv_status_id = 2 THEN 1 ELSE 0 END) AS count_invalid,
							SUM(CASE WHEN pu.potent_sv_status_id = 3 THEN 1 ELSE 0 END) AS count_confirms,
							SUM(CASE WHEN pu.potent_sv_status_id = 4 THEN 1 ELSE 0 END) AS count_reject,
							SUM(CASE WHEN pu.potent_sv_status_id = 5 THEN 1 ELSE 0 END) AS count_duplicate,
                            SUM(CASE WHEN pu.potent_sv_status_id is null THEN 1 ELSE 0 END) AS count_isnull
					FROM potential_user AS pu
					WHERE potent_del_status='0' AND potent_type='sv'
					GROUP BY pu.potent_sv_status_id
				) AS B ON A.potent_sv_status_id = B.potent_sv_status_id