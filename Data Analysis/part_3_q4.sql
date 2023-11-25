WITH total_category_count AS (
  SELECT
    country,
    category_title,
    COUNT(DISTINCT video_id) AS total_category_video
  FROM
    table_youtube_final
  GROUP BY
    country,
    category_title
),
total_country_count AS (
  SELECT
    country,
    COUNT(DISTINCT video_id) AS total_country_video
  FROM
    table_youtube_final
  GROUP BY
    country
),
most_videos AS (
  SELECT
    ca.country,
    ca.category_title,
    ca.total_category_video,
    co.total_country_video,
    ROW_NUMBER() OVER (PARTITION BY ca.country ORDER BY ca.total_category_video DESC) AS rank
  FROM
    total_category_count ca
  JOIN
    total_country_count co ON ca.country = co.country
)
SELECT
  mv.country,
  mv.category_title,
  mv.total_category_video,
  mv.total_country_video,
  ROUND((mv.total_category_video * 100.0) / mv.total_country_video, 2) AS percentage
FROM
  most_videos mv
WHERE
  mv.rank = 1
ORDER BY
  mv.category_title,
  mv.country;