UPDATE table_youtube_final 
SET category_title = (
SELECT distinct categoryid
FROM table_youtube_final
WHERE category_title is null
)
WHERE CATEGORY_TITLE is null;


-- null values (3161 rows) in category_title have been filled with '29' value