# Youtube Trending Videos Data Lakehouse with Snowflake 

## Author
Name: Simon Lim

## Description
YouTube is the worldwide video sharing platform, which share various categories and top trending videos on the platform. Top trending videos are evaluated based on video’s number of views, shares, likes and comments etc. A dataset with a daily record of the top popular and trending videos has been extracted through YouTube API. 

In this regard, the objective of the project is to analyse the dataset, which consists of CSVs and Jsons files, by using a Data Lakehouse with Snowflake. The procedure of the project includes data ingestion, data cleaning, data analysis and answering business questions. Snowflake is a main data warehouse and SQL platform used in this project, in order to load and analyse data. 

![image](https://github.com/SimonLim03/Youtube-Videos-Data-Lakehouse/assets/150989115/ab2ef781-0fca-4e95-a44b-620e53c3f115)


## Presentation of Dataset
There are two types of dataset files, one with CSV file and the other with Json file. For CSV file, dataset includes several months of daily trending YouTube video records for 11 different countries, including India, USA, Great Britain, Germany, Canada, France, Russia, Brazil, Mexico, South Korea and Japan. Hence, there are 11 CSVs files representing top trending videos of each country. Various data of daily video records are included in dataset, such as video_id, title, published date, category id, number of views, likes, dislikes, channel id, comment counts and trending date etc. 
For Json file, dataset also include category id, title and channel id for each country. 


## PIPELINE OF THE PROJECT 
- 0.	Before ingesting data, there are two necessary processes to be set up. The first step was to set up a cloud storage account on Microsoft Azure and snowflake account was a necessary process. Subsequently, it was also necessary to set up a Storage Integration between Azure and Snowflake. 

### 1.	Data Ingestion 
- 1.1.	Stage, named ‘stage_bde_at1’, was created to store, load and unload data files. 
- 1.2.	For CSVs files, external tables for each country were created, adding the new column ‘country ’.  (11 External Tables). Columns in external tables include video_id, title, publish date, channel id, channel title, category id, trending date, view count, likes, dislikes, comment count, comment disabled and country.
- Then, a new table, ‘table_youtube_trending’ was created to store all data received from external tables. Subsequently, null values in the new column ‘country’ were updated after data for each country were inserted. External tables with same columns for other countries were all inserted into the table ‘table_youtube_trending’, in conjunction with updates of ‘country’ column. 
- 1.3.	For Json files, I manually added a country column and each corresponding country value. The rationale behind it was that it was possible to load 11 Json files as each row in an external table, helping to simplify code. Hence, an external table for 11 countries was created. Then, a new table ‘table_youtube_category’ was created to store data from the external table, including three columns, ‘country’, ‘category id’ and ‘category title’. 
- 1.4.	The last stage in data ingestion was to create a final table by combining two tables. Before combining them, it was necessary to set up primary keys and foreign keys (category id, country) for tables, as those two columns are common columns two tables included. 
- 1.5.	Finally, two tables were combined using left join on country and category id and created a final youtube table, “table_youtube_final”. 

### 2. Data Cleaning
- 2.1.	In “table_youtube_category”, only “Comedy” has duplicates if we do not take into account the categoryid.
- 2.2.	In “table_youtube_category”, only “Nonprofit & Activism” appears in one country.
- 2.3.	Categoryid, which has missing values in category_title, is ‘29’.
- 2.4.	Null values (3161 rows) in category_title were filled with category id ‘29’. 
- 2.5.	There is one video, which has a null value for channeltitle.
- 2.6.	All records, containing ‘video_id’ of “#NAME?” were all deleted (15831 rows were deleted). 
- 2.7.	A duplicate table, “table_youtube_duplicates”, containing duplicates of a combination of video_id, trending_date and country, was created.
- 2.8.	Finally, the duplicates in “table_youtube_final” were deleted using “table_youtube_duplicates”. 
- 2.9.	Final number of rows in table_youtube_final were 1123017.
### 3. Data Analysis
- 3.1.	In “table_youtube_final”, three most viewed videos in the “Sports” category and for the trending_date = “2021-10-17” for each country were analyzed and displayed.
  ![image](https://github.com/SimonLim03/Youtube-Videos-Data-Lakehouse/assets/150989115/4cd1d575-f697-4360-b32e-6b23ef284773)
- 3.2.	The number of distinct video with a title containing the word “BTS” for each county was displayed.
  ![image](https://github.com/SimonLim03/Youtube-Videos-Data-Lakehouse/assets/150989115/ccb163ea-e14e-46c7-8405-d6bf3e08e91d)
- 3.3.	The most viewed videos and their like_ratio were displayed with their year and month and for each country.
  ![image](https://github.com/SimonLim03/Youtube-Videos-Data-Lakehouse/assets/150989115/8967f1e7-33fe-49fb-922c-89f32ce52c73)
- 3.4.	For each cointry, videos with a category_title, that has the most distinct videos and their percentage out of the total distinct number of videos of that country was displayed.
  ![image](https://github.com/SimonLim03/Youtube-Videos-Data-Lakehouse/assets/150989115/50ca48a0-19d7-4886-bd8d-900685335e2f)
- 3.5.	Channeltitle, that has the most distinct videos and its number were displayed.
  ![image](https://github.com/SimonLim03/Youtube-Videos-Data-Lakehouse/assets/150989115/9141409a-b01f-4f01-a539-be087c61deb8)

### 4. Business Questions
- Q1. If I was to launch a new YouTube channel, which category (excluding “Music” and “Entertainment”) of video would I be trying to create to have them appear in the top trend of YouTube?
-	I would create ‘Gaming’ category, as it has the highest total_view_count (195569682751) out of all categories. 
![image](https://github.com/SimonLim03/Youtube-Videos-Data-Lakehouse/assets/150989115/24baefa5-a57b-4273-a7db-fb5d6cd30021)
- Q2. Will this strategy work in every country?
-	No, unfortunately it does not work in every country. There are many countries, in which “People & Blog” have higher total_view_count than “Gaming” category, including Japan, Korea, India, Russia, Brazil etc. Therefore, it is important to create a category of video, depending on country and other potential variables, such as age and gender.
  ![image](https://github.com/SimonLim03/Youtube-Videos-Data-Lakehouse/assets/150989115/dbf69742-413e-41bf-9256-dfb7d006055a)








