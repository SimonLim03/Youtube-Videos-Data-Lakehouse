# Sales Revenue Prediction Application (Predictive and Forecasting)

## Author
Name: Simon Lim

## Description
This application involves two machine learning models that were established for business purposes.
One model is a predictive model using a Machine Learning algorithm to accurately predict the sales revenue for a given item in a specific store at a given date.
The other is a forecasting model using a time-series analysis that can forecast the total sales revenue across all stores and items for the next 7 days.
The models have been deployed using Fastapi, Docker and Heroku, which enable modle's access to users online anytime. 

The American retailer that has 10 stores across 3 different states (California (CA), Texas (TX), 
Wisconsin (WI)) sells a variety of items from 3 different categories, including hobbies, foods and 
household. The retailer has a large of amount of data for each item’s selling price, sales revenue 
and quantity of sales records across stores and dates. In this regard, machine learning and timeseries models can be potentially helpful in a variety of ways by predicting the sales revenue for a 
specific item and forecasting the total revenues for next few days

![image](https://github.com/SimonLim03/Sales-Revenue-Prediction-App/assets/150989115/02d39b0d-4080-41c4-afea-ac6e15b2998e)


## How to Run the Program
The application was available online via Heroku, but currently it has been shut down due to monthly costs.
However, there is the other way to run the application. Docker and Fastapi were used to run the application.

Execute the following steps to run the app:
- Clone the master branch from the github repo or download a zip folder:  https://github.com/SimonLim03/Sales-Revenue-Prediction-App.git
- Navigate to the root directory of the project in your terminal
- Run the following commands:
    - `docker build -t my_fast_api .`
    - `docker run -p 8000:80 my_fast_api`
    
- There are two API endpoints for descriptions of the app and running the app.
- http://localhost:8000/ : Description of the application, including what to expect for input parameters.
- http://localhost:8000/docs/ : Runnining the application
- /sales/stores/items/ : Predictive Model (predict the sales revenue for a given item in a specific store at a given date)
  ![image](https://github.com/SimonLim03/Sales-Revenue-Prediction-App/assets/150989115/4c3d058b-e697-465e-9d27-7c49ecc8abc1)
  ![image](https://github.com/SimonLim03/Sales-Revenue-Prediction-App/assets/150989115/f57fcd2f-71e3-4850-9a85-0db2f35b4290)

- /sales/national/ : Forecasting Model (forecast the total sales revenue across all stores and items for the next 7 days)
  ![image](https://github.com/SimonLim03/Sales-Revenue-Prediction-App/assets/150989115/0372871a-b4b9-4739-affb-e98c105b1595)
  ![image](https://github.com/SimonLim03/Sales-Revenue-Prediction-App/assets/150989115/6127decd-f02a-4636-995e-dd515e0d3bbd)





## Project Structure
<p>
/models: This folder contains model artefacts that were used to predict travel fares.
</p>

<p>
/notebooks: All the notebooks containing codes, preparation, EDA and precedures. 
</p>

<p>
/report: Experimental report
</p>

<p>
/src: Storage of functions used in experiments
</p>

## Input Parameters (Predictive Model, /sales/stores/items/)

| Input | Description | 
|:------------:|:------------:|
| idem_id | item id of the specific item (e.g., HOBBIES_1_001) | 
| store_id | store id of the item (e.g., CA_1 , WI_3) | 
| Day | Day of Month (i.e., bewteen 1 and 31) |
| Month | Month of Year in string format (e.g., January, December) | 
| Year | Year in yyyy format |

## Input Parameters (Forecasting Model, /sales/national/)

| Input | Description | 
|:------------:|:------------:|
| specific date | specific date in format yyyy-mm-dd (e.g., 2023-01-01) | 
| days | forecasting next days (e.g., 7 if forecasting next 7 days, 10 if foreacsting next 10 days) | 

