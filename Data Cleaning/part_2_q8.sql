DELETE FROM
table_youtube_final;

insert into table_youtube_final
select *
from table_youtube_duplicates;