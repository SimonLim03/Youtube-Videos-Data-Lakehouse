SELECT
  channelTitle,
  COUNT(DISTINCT video_id) AS num_distinct_videos
FROM
  TABLE_YOUTUBE_FINAL
GROUP BY
  channelTitle
ORDER BY
  num_distinct_videos DESC
LIMIT 1;


-- Color TV,   805