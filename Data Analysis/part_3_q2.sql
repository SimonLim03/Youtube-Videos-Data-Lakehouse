SELECT 
COUNTRY,
count(distinct VIDEO_ID) as CT
FROM table_youtube_final
WHERE TITLE LIKE '%BTS%'
group by country
order by CT DESC;