# 🚲 BikeShare Data Warehouse Project

## 📖 Overview
Welcome to the **BikeShare Data Warehouse Project**! to build a data warehouse for a bike-sharing service company. The project will be implemented on-premise, integrating and processing data using **Talend**.

## 🎯 Project Objectives
Our primary goals are:
- 🏗️ **Designing and implementing** a detailed data warehouse to manage and analyze bike-sharing data.
- 🔄 **Integrating multiple data sources** on-premise, using Talend for ETL (Extract, Transform, Load) processes.
- 📊 **Developing interactive dashboards** to provide insights into user behavior, bike usage, station performance, and financial metrics.

## 🧩 Project Components
### 1. **Data Warehouse Design**
   - We’ve created a complex **Entity Relationship Diagram (ERD)** featuring key entities like Users, Trips, Bikes, Stations, and Weather. Additional tables for Subscriptions, Feedback, and Maintenance make the schema comprehensive.
   - 📐 Dimensions, hierarchies, and measures are defined for multi-perspective analysis.

MultiDim diagram
<table><tr><td><img src="https://github.com/layashreeadepu/BikeFlow-Analytics/blob/c67daadcb96a834c2594a33eafd7b802333c268d/bike_share_final_model.jpg">

### 2. **On-Premise Integration with Talend**
   - **ETL Processes**: Talend is used to extract data from source systems, transform it according to business rules, and load it into the data warehouse.
   - **Data Sources**: We are integrating data related to bike usage, weather, payments, maintenance, and user feedback to create a centralized data source.
   - 🛠️ Talend jobs handle the data integration workflow on-premise.

## 📈 Dimensions, Hierarchies, and Measures
To enable a rich analytical framework, our data warehouse includes:
- **Dimensions**: Date/Time, User, Station, Bike, Trip, Weather, etc.
- **Hierarchies**: User Type → Subscription, Year → Quarter → Month → Day, City → Station Name.
- **Measures**: Trip Count, Total Revenue, Bike Utilization Rate, Average Trip Duration, Subscription Revenue, and more.

## 📊 Dashboards
We’ll develop dashboards that provide insights on:
- **User Demographics** and **Behavioral Analysis** 🧍‍♀️🧍‍♂️
- **Bike Usage and Maintenance Performance** 🚴‍♂️🔧
- **Station Utilization and Capacity** 🚏📍
- **Revenue and Financial Metrics** 💰📈

## 🛠️ Technologies
- **On-Premise**: Talend for ETL, PostgreSQL for initial data storage.
