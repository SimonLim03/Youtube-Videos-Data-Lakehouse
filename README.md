# Youtube Trending Videos Data Lakehouse with Snowflake 

## Author
Name: Simon Lim

## Description
YouTube is the worldwide video sharing platform, which share various categories and top trending videos on the platform. Top trending videos are evaluated based on video’s number of views, shares, likes and comments etc. A dataset with a daily record of the top popular and trending videos has been extracted through YouTube API. 

In this regard, the objective of the project is to analyse the dataset, which consists of CSVs and Jsons files, by using a Data Lakehouse with Snowflake. The procedure of the project includes data ingestion, data cleaning, data analysis and answering business questions. Snowflake is a main data warehouse and SQL platform used in this project, in order to load and analyse data. 


## Presentation of Dataset
There are two types of dataset files, one with CSV file and the other with Json file. For CSV file, dataset includes several months of daily trending YouTube video records for 11 different countries, including India, USA, Great Britain, Germany, Canada, France, Russia, Brazil, Mexico, South Korea and Japan. Hence, there are 11 CSVs files representing top trending videos of each country. Various data of daily video records are included in dataset, such as video_id, title, published date, category id, number of views, likes, dislikes, channel id, comment counts and trending date etc. 
For Json file, dataset also include category id, title and channel id for each country. 


## PIPELINE OF THE PROJECT 
- 0.	Before ingesting data, there are two necessary processes to be set up. The first step was to set up a cloud storage account on Microsoft Azure and snowflake account was a necessary process. Subsequently, it was also necessary to set up a Storage Integration between Azure and Snowflake. 

- 1.	Data Ingestion 
- 1.1.	Stage, named ‘stage_bde_at1’, was created to store, load and unload data files. 
- 1.2.	For CSVs files, external tables for each country were created, adding the new column ‘country ’.  (11 External Tables). Columns in external tables include video_id, title, publish date, channel id, channel title, category id, trending date, view count, likes, dislikes, comment count, comment disabled and country.
