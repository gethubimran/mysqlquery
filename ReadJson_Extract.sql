set @jsn_test_string = '[23, 55, 67, 89, {"name":"Evelina Angelica Setiawan", "age":30, "marks":[223, 334, 567]}]';
select json_extract(@jsn_test_string, '$') as 'Whole Json String';
set @ownid = json_extract(@jsn_test_string, '$[1]');
select json_extract(@jsn_test_string, '$[2]') as 'Value AT Index 2';
select json_extract(@jsn_test_string, '$[4].name', '$[0]') as 'Value AT Index 2 and 0';

set @vl = replace(json_extract(@jsn_test_string, '$[4].name'), '"', '');


select * from roommego2.owner a where owner_name = @vl and owner_id = @ownid limit 0,5;