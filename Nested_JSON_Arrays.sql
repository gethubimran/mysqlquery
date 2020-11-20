/*reff : https://www.holistics.io/blog/how-to-extract-nested-json-data-in-mysql-8-0/*/

select
  n.book_id,
  h.*
from
  roommego2.booking n,
  JSON_TABLE(n.book_pay_log, 
							'$' COLUMNS(NESTED PATH '$.paymentCycle[*]' COLUMNS (title varchar(50) PATH '$.title',
																					price varchar(50) PATH '$.price'))
                            ) as h
where n.book_id = 100932;