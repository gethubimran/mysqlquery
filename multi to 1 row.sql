/* multi record to 1 row */
select group_concat(distinct article_category_id) art_category from roommego2.article limit 0,5;