SELECT
  CATEGORY_TITLE,
  SUM(VIEW_COUNT) AS TOTAL_VIEW_COUNT
FROM table_youtube_final
WHERE CATEGORY_TITLE NOT IN ('Entertainment', 'Music')
GROUP BY CATEGORY_TITLE
ORDER BY total_view_count DESC
LIMIT 1;

-- 'Gaming' category has the highest total_view_count (195569682751).




SELECT
  COUNTRY,
  CATEGORY_TITLE,
  TOTAL_VIEW_COUNT
FROM (
  SELECT
    COUNTRY,
    CATEGORY_TITLE,
    SUM(VIEW_COUNT) AS total_view_count,
    ROW_NUMBER() OVER (PARTITION BY COUNTRY ORDER BY SUM(VIEW_COUNT) DESC) AS category_rank
  FROM table_youtube_final
  WHERE CATEGORY_TITLE NOT IN ('Entertainment', 'Music')
  GROUP BY COUNTRY, CATEGORY_TITLE
) 
WHERE category_rank = 1;

-- 