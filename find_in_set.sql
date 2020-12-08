/**a.article_tags_id = '1,2,3,4'*/

select b.tags_name, a.article from roommego2.article a
inner join roommego2.m_tags b on find_in_set(b.tags_id, a.article_tags_id);