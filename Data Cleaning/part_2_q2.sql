SELECT category_title
FROM table_youtube_category
GROUP BY category_title
HAVING COUNT(DISTINCT country) = 1;

-- Category title 'Nonprofits & Activism' only appears in one country