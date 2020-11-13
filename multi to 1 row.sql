/* multi record to 1 row */
select group_concat('field') as field from 'table_name' limit 0,5;