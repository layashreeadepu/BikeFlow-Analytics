# 🚲 BikeShare Data Warehouse Project

## 📖 Overview
Welcome to the **BikeShare Data Warehouse Project**! This is an ongoing project for the **Fall 2024 semester**, where we aim to build a comprehensive, fully-functional data warehouse for a bike-sharing service. The project will initially be implemented on-premise, integrating and processing data using **Talend**. Later, we will migrate the entire system to **Azure Cloud** to leverage cloud-based tools and scale our data operations.

## 🎯 Project Objectives
Our primary goals are:
- 🏗️ **Designing and implementing** a detailed data warehouse to manage and analyze bike-sharing data.
- 🔄 **Integrating multiple data sources** on-premise, using Talend for ETL (Extract, Transform, Load) processes.
- ☁️ **Migrating the data warehouse to Azure Cloud**, leveraging cloud services for better scalability and advanced analytics.
- 📊 **Developing interactive dashboards** to provide insights into user behavior, bike usage, station performance, and financial metrics.
<table><tr><td><img src="https://github.com/layashreeadepu/BikeFlow-Analytics/blob/483a874582e4b9814b0f52eabed9d4065ea99061/bike_share_v1-3.jpg"></td><td><img src="https://github.com/layashreeadepu/BikeFlow-Analytics/blob/60dcb3240bd805dda9f8b53a9f1a92b00f008b6a/bike_share_v2.jpg"></td></tr></table>
## 🧩 Project Components
### 1. **Data Warehouse Design**
   - We’ve created a complex **Entity Relationship Diagram (ERD)** featuring key entities like Users, Trips, Bikes, Stations, and Weather. Additional tables for Subscriptions, Feedback, and Maintenance make the schema comprehensive.
   - 📐 Dimensions, hierarchies, and measures are defined for multi-perspective analysis.

### 2. **On-Premise Integration with Talend**
   - **ETL Processes**: Talend is used to extract data from source systems, transform it according to business rules, and load it into the data warehouse.
   - **Data Sources**: We are integrating data related to bike usage, weather, payments, maintenance, and user feedback to create a centralized data source.
   - 🛠️ Talend jobs handle the data integration workflow on-premise.

### 3. **Cloud Migration to Azure**
   - Following on-premise integration, the system will be migrated to **Azure**.
   - **Azure Services**: We’ll use tools like **Azure Data Factory**, **Azure Synapse Analytics**, and **Azure SQL Database** to replicate the data warehouse and handle large data volumes.
   - 🚀 **Scalability & Analytics**: Migration to Azure allows for better scalability and real-time insights through cloud-based dashboards.

## 📈 Dimensions, Hierarchies, and Measures
To enable a rich analytical framework, our data warehouse includes:
- **Dimensions**: Date/Time, User, Station, Bike, Trip, Weather, etc.
- **Hierarchies**: User Type → Age Group → Gender, Year → Quarter → Month → Day, City → Station Name, etc.
- **Measures**: Trip Count, Total Revenue, Bike Utilization Rate, Average Trip Duration, Subscription Revenue, and more.

## 📊 Dashboards
We’ll develop dashboards that provide insights on:
- **User Demographics** and **Behavioral Analysis** 🧍‍♀️🧍‍♂️
- **Bike Usage and Maintenance Performance** 🚴‍♂️🔧
- **Station Utilization and Capacity** 🚏📍
- **Revenue and Financial Metrics** 💰📈
- **Weather Impact on Bike Usage** ☀️🌧️

## 🛠️ Technologies
- **On-Premise**: Talend for ETL, PostgreSQL for initial data storage.
- **Cloud**: Azure Data Factory, Azure Synapse Analytics, Azure SQL Database, and Power BI for analytics.

## 📅 Project Timeline
1. **Phase 1**: Data Warehouse Design & On-Premise Integration with Talend *(Current Phase)*.
2. **Phase 2**: Migration to Azure Cloud.
3. **Phase 3**: Dashboard Development & Project Wrap-up.
