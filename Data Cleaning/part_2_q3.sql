SELECT DISTINCT categoryid
FROM table_youtube_final
WHERE category_title is null;

-- Categoryids, which have missing values in category_title, are '29'.