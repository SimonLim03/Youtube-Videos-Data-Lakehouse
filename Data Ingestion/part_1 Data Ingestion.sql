-- Creating a Stage
CREATE OR REPLACE STAGE stage_bde_at1
STORAGE_INTEGRATION = azure_bde_at1
URL='azure://simon1234.blob.core.windows.net/bde-at1'
;

-- Creating CSV file format
CREATE OR REPLACE FILE FORMAT file_format_csv
TYPE = 'CSV'
FIELD_DELIMITER = ','
SKIP_HEADER = 1
NULL_IF = ('\\N', 'NULL', 'NUL', '')
FIELD_OPTIONALLY_ENCLOSED_BY = '"'
;

-- Creating a BR external table and youtube trending table
CREATE OR REPLACE EXTERNAL TABLE ex_br_trending
(
VIDEO_ID VARCHAR as (value:c1::VARCHAR),
TITLE VARCHAR as (value:c2::VARCHAR),
PUBLISHEDAT DATE as (value:c3::DATE),
CHANNELID VARCHAR as (value:c4::VARCHAR),
CHANNELTITLE VARCHAR as (value:c5::VARCHAR),
CATEGORYID INT as (value:c6::INT),
TRENDING_DATE DATE as (value:c7::DATE),
VIEW_COUNT int as (value:c8::int),
LIKES INT as (value:c9::INT),
DISLIKES INT as (value:c10::INT),
COMMENT_COUNT INT as (value:c11::INT),
COMMENTS_DISABLED BOOLEAN as (value:c12::BOOLEAN),
COUNTRY VARCHAR AS (value:c13::VARCHAR)
)
WITH LOCATION = @stage_bde_at1
FILE_FORMAT = file_format_csv
PATTERN = 'BR_youtube_trending_data.csv'
;

CREATE or replace TABLE table_youtube_trending as
SELECT *
FROM ex_br_trending
;

UPDATE table_youtube_trending
SET COUNTRY = 'BR'
WHERE COUNTRY is null
;

-- Creating a CA external table and inserting values into youtube trending table
CREATE OR REPLACE EXTERNAL TABLE ex_ca_trending
(
VIDEO_ID VARCHAR as (value:c1::VARCHAR),
TITLE VARCHAR as (value:c2::VARCHAR),
PUBLISHEDAT DATE as (value:c3::DATE),
CHANNELID VARCHAR as (value:c4::VARCHAR),
CHANNELTITLE VARCHAR as (value:c5::VARCHAR),
CATEGORYID INT as (value:c6::INT),
TRENDING_DATE DATE as (value:c7::DATE),
VIEW_COUNT int as (value:c8::int),
LIKES INT as (value:c9::INT),
DISLIKES INT as (value:c10::INT),
COMMENT_COUNT INT as (value:c11::INT),
COMMENTS_DISABLED BOOLEAN as (value:c12::BOOLEAN),
COUNTRY VARCHAR AS (value:c13::VARCHAR)
)
WITH LOCATION = @stage_bde_at1
FILE_FORMAT = file_format_csv
PATTERN = 'CA_youtube_trending_data.csv'
;

INSERT INTO table_youtube_trending
select * 
from ex_ca_trending 
;

UPDATE table_youtube_trending
SET COUNTRY = 'CA'
WHERE COUNTRY is null
;

-- Creating a DE external table and inserting values into youtube trending table
CREATE OR REPLACE EXTERNAL TABLE ex_de_trending
(
VIDEO_ID VARCHAR as (value:c1::VARCHAR),
TITLE VARCHAR as (value:c2::VARCHAR),
PUBLISHEDAT DATE as (value:c3::DATE),
CHANNELID VARCHAR as (value:c4::VARCHAR),
CHANNELTITLE VARCHAR as (value:c5::VARCHAR),
CATEGORYID INT as (value:c6::INT),
TRENDING_DATE DATE as (value:c7::DATE),
VIEW_COUNT int as (value:c8::int),
LIKES INT as (value:c9::INT),
DISLIKES INT as (value:c10::INT),
COMMENT_COUNT INT as (value:c11::INT),
COMMENTS_DISABLED BOOLEAN as (value:c12::BOOLEAN),
COUNTRY VARCHAR AS (value:c13::VARCHAR)
)
WITH LOCATION = @stage_bde_at1
FILE_FORMAT = file_format_csv
PATTERN = 'DE_youtube_trending_data.csv'
;

INSERT INTO table_youtube_trending
select * 
from ex_de_trending 
;

UPDATE table_youtube_trending
SET COUNTRY = 'DE'
WHERE COUNTRY is null
;

-- Creating a FR external table and inserting values into youtube trending table
CREATE OR REPLACE EXTERNAL TABLE ex_fr_trending
(
VIDEO_ID VARCHAR as (value:c1::VARCHAR),
TITLE VARCHAR as (value:c2::VARCHAR),
PUBLISHEDAT DATE as (value:c3::DATE),
CHANNELID VARCHAR as (value:c4::VARCHAR),
CHANNELTITLE VARCHAR as (value:c5::VARCHAR),
CATEGORYID INT as (value:c6::INT),
TRENDING_DATE DATE as (value:c7::DATE),
VIEW_COUNT int as (value:c8::int),
LIKES INT as (value:c9::INT),
DISLIKES INT as (value:c10::INT),
COMMENT_COUNT INT as (value:c11::INT),
COMMENTS_DISABLED BOOLEAN as (value:c12::BOOLEAN),
COUNTRY VARCHAR AS (value:c13::VARCHAR)
)
WITH LOCATION = @stage_bde_at1
FILE_FORMAT = file_format_csv
PATTERN = 'FR_youtube_trending_data.csv'
;

INSERT INTO table_youtube_trending
select * 
from ex_fr_trending
;

UPDATE table_youtube_trending
SET COUNTRY = 'FR'
WHERE COUNTRY is null
;

CREATE OR REPLACE EXTERNAL TABLE ex_gb_trending
(
VIDEO_ID VARCHAR as (value:c1::VARCHAR),
TITLE VARCHAR as (value:c2::VARCHAR),
PUBLISHEDAT DATE as (value:c3::DATE),
CHANNELID VARCHAR as (value:c4::VARCHAR),
CHANNELTITLE VARCHAR as (value:c5::VARCHAR),
CATEGORYID INT as (value:c6::INT),
TRENDING_DATE DATE as (value:c7::DATE),
VIEW_COUNT int as (value:c8::int),
LIKES INT as (value:c9::INT),
DISLIKES INT as (value:c10::INT),
COMMENT_COUNT INT as (value:c11::INT),
COMMENTS_DISABLED BOOLEAN as (value:c12::BOOLEAN),
COUNTRY VARCHAR AS (value:c13::VARCHAR)
)
WITH LOCATION = @stage_bde_at1
FILE_FORMAT = file_format_csv
PATTERN = 'GB_youtube_trending_data.csv'
;

INSERT INTO table_youtube_trending
select * 
from ex_gb_trending
;

UPDATE table_youtube_trending
SET COUNTRY = 'GB'
WHERE COUNTRY is null
;

CREATE OR REPLACE EXTERNAL TABLE ex_in_trending
(
VIDEO_ID VARCHAR as (value:c1::VARCHAR),
TITLE VARCHAR as (value:c2::VARCHAR),
PUBLISHEDAT DATE as (value:c3::DATE),
CHANNELID VARCHAR as (value:c4::VARCHAR),
CHANNELTITLE VARCHAR as (value:c5::VARCHAR),
CATEGORYID INT as (value:c6::INT),
TRENDING_DATE DATE as (value:c7::DATE),
VIEW_COUNT int as (value:c8::int),
LIKES INT as (value:c9::INT),
DISLIKES INT as (value:c10::INT),
COMMENT_COUNT INT as (value:c11::INT),
COMMENTS_DISABLED BOOLEAN as (value:c12::BOOLEAN),
COUNTRY VARCHAR AS (value:c13::VARCHAR)
)
WITH LOCATION = @stage_bde_at1
FILE_FORMAT = file_format_csv
PATTERN = 'IN_youtube_trending_data.csv'
;

INSERT INTO table_youtube_trending
select * 
from ex_in_trending
;

UPDATE table_youtube_trending
SET COUNTRY = 'IN'
WHERE COUNTRY is null
;

CREATE OR REPLACE EXTERNAL TABLE ex_jp_trending
(
VIDEO_ID VARCHAR as (value:c1::VARCHAR),
TITLE VARCHAR as (value:c2::VARCHAR),
PUBLISHEDAT DATE as (value:c3::DATE),
CHANNELID VARCHAR as (value:c4::VARCHAR),
CHANNELTITLE VARCHAR as (value:c5::VARCHAR),
CATEGORYID INT as (value:c6::INT),
TRENDING_DATE DATE as (value:c7::DATE),
VIEW_COUNT int as (value:c8::int),
LIKES INT as (value:c9::INT),
DISLIKES INT as (value:c10::INT),
COMMENT_COUNT INT as (value:c11::INT),
COMMENTS_DISABLED BOOLEAN as (value:c12::BOOLEAN),
COUNTRY VARCHAR AS (value:c13::VARCHAR)
)
WITH LOCATION = @stage_bde_at1
FILE_FORMAT = file_format_csv
PATTERN = 'JP_youtube_trending_data.csv'
;

INSERT INTO table_youtube_trending
select * 
from ex_jp_trending
;

UPDATE table_youtube_trending
SET COUNTRY = 'JP'
WHERE COUNTRY is null
;

CREATE OR REPLACE EXTERNAL TABLE ex_kr_trending
(
VIDEO_ID VARCHAR as (value:c1::VARCHAR),
TITLE VARCHAR as (value:c2::VARCHAR),
PUBLISHEDAT DATE as (value:c3::DATE),
CHANNELID VARCHAR as (value:c4::VARCHAR),
CHANNELTITLE VARCHAR as (value:c5::VARCHAR),
CATEGORYID INT as (value:c6::INT),
TRENDING_DATE DATE as (value:c7::DATE),
VIEW_COUNT int as (value:c8::int),
LIKES INT as (value:c9::INT),
DISLIKES INT as (value:c10::INT),
COMMENT_COUNT INT as (value:c11::INT),
COMMENTS_DISABLED BOOLEAN as (value:c12::BOOLEAN),
COUNTRY VARCHAR AS (value:c13::VARCHAR)
)
WITH LOCATION = @stage_bde_at1
FILE_FORMAT = file_format_csv
PATTERN = 'KR_youtube_trending_data.csv'
;

INSERT INTO table_youtube_trending
select * 
from ex_kr_trending
;

UPDATE table_youtube_trending
SET COUNTRY = 'KR'
WHERE COUNTRY is null
;

CREATE OR REPLACE EXTERNAL TABLE ex_mx_trending
(
VIDEO_ID VARCHAR as (value:c1::VARCHAR),
TITLE VARCHAR as (value:c2::VARCHAR),
PUBLISHEDAT DATE as (value:c3::DATE),
CHANNELID VARCHAR as (value:c4::VARCHAR),
CHANNELTITLE VARCHAR as (value:c5::VARCHAR),
CATEGORYID INT as (value:c6::INT),
TRENDING_DATE DATE as (value:c7::DATE),
VIEW_COUNT int as (value:c8::int),
LIKES INT as (value:c9::INT),
DISLIKES INT as (value:c10::INT),
COMMENT_COUNT INT as (value:c11::INT),
COMMENTS_DISABLED BOOLEAN as (value:c12::BOOLEAN),
COUNTRY VARCHAR AS (value:c13::VARCHAR)
)
WITH LOCATION = @stage_bde_at1
FILE_FORMAT = file_format_csv
PATTERN = 'MX_youtube_trending_data.csv'
;

INSERT INTO table_youtube_trending
select * 
from ex_mx_trending
;

UPDATE table_youtube_trending
SET COUNTRY = 'MX'
WHERE COUNTRY is null
;

CREATE OR REPLACE EXTERNAL TABLE ex_ru_trending
(
VIDEO_ID VARCHAR as (value:c1::VARCHAR),
TITLE VARCHAR as (value:c2::VARCHAR),
PUBLISHEDAT DATE as (value:c3::DATE),
CHANNELID VARCHAR as (value:c4::VARCHAR),
CHANNELTITLE VARCHAR as (value:c5::VARCHAR),
CATEGORYID INT as (value:c6::INT),
TRENDING_DATE DATE as (value:c7::DATE),
VIEW_COUNT int as (value:c8::int),
LIKES INT as (value:c9::INT),
DISLIKES INT as (value:c10::INT),
COMMENT_COUNT INT as (value:c11::INT),
COMMENTS_DISABLED BOOLEAN as (value:c12::BOOLEAN),
COUNTRY VARCHAR AS (value:c13::VARCHAR)
)
WITH LOCATION = @stage_bde_at1
FILE_FORMAT = file_format_csv
PATTERN = 'RU_youtube_trending_data.csv'
;

INSERT INTO table_youtube_trending
select * 
from ex_ru_trending
;

UPDATE table_youtube_trending
SET COUNTRY = 'RU'
WHERE COUNTRY is null
;

CREATE OR REPLACE EXTERNAL TABLE ex_us_trending
(
VIDEO_ID VARCHAR as (value:c1::VARCHAR),
TITLE VARCHAR as (value:c2::VARCHAR),
PUBLISHEDAT DATE as (value:c3::DATE),
CHANNELID VARCHAR as (value:c4::VARCHAR),
CHANNELTITLE VARCHAR as (value:c5::VARCHAR),
CATEGORYID INT as (value:c6::INT),
TRENDING_DATE DATE as (value:c7::DATE),
VIEW_COUNT int as (value:c8::int),
LIKES INT as (value:c9::INT),
DISLIKES INT as (value:c10::INT),
COMMENT_COUNT INT as (value:c11::INT),
COMMENTS_DISABLED BOOLEAN as (value:c12::BOOLEAN),
COUNTRY VARCHAR AS (value:c13::VARCHAR)
)
WITH LOCATION = @stage_bde_at1
FILE_FORMAT = file_format_csv
PATTERN = 'US_youtube_trending_data.csv'
;

INSERT INTO table_youtube_trending
select * 
from ex_us_trending
;

UPDATE table_youtube_trending
SET COUNTRY = 'US'
WHERE COUNTRY is null
;


ALTER TABLE table_youtube_trending
DROP COLUMN VALUE
;



-- For Json files, I manually added a country column and each corresponding country.
CREATE OR REPLACE EXTERNAL TABLE ex_table_youtube_category
WITH LOCATION = @stage_bde_at1
FILE_FORMAT = (TYPE=JSON)
PATTERN = '.*[.]json'
;


CREATE OR REPLACE TABLE table_youtube_category as
select 
ex_table_youtube_category.VALUE:country::varchar as country,
item.value:id::int as categoryid,
item.value:snippet:title::varchar as category_title
from ex_table_youtube_category
    , lateral FLATTEN(input => parse_json(ex_table_youtube_category.value):items) AS item
;



ALTER TABLE table_youtube_category
ADD CONSTRAINT table_youtube_category_fk_trending PRIMARY KEY (categoryid, country)
;

ALTER TABLE table_youtube_trending
ADD CONSTRAINT table_youtube_category_fk_trending
FOREIGN KEY (categoryid, country)
REFERENCES table_youtube_category (categoryid, country)
;


CREATE OR REPLACE TABLE table_youtube_final as
SELECT
    UUID_STRING() AS id, 
    VIDEO_ID,
    TITLE,
    PUBLISHEDAT,
    CHANNELID,
    CHANNELTITLE,
    T.CATEGORYID,
    CATEGORY_TITLE,
    TRENDING_DATE,
    VIEW_COUNT,
    LIKES,
    DISLIKES,
    COMMENT_COUNT,
    COMMENTS_DISABLED,
    T.COUNTRY
FROM
    table_youtube_trending t
left join
    table_youtube_category c
ON
    t.country = c.country
    AND t.categoryid = c.categoryid
;

