SELECT category_title, COUNT(category_title) as duplicates
FROM table_youtube_category
GROUP BY category_title
HAVING COUNT(category_title) > 1;

