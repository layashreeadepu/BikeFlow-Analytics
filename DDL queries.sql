-- Drop tables in reverse order to avoid foreign key constraint issues
DROP TABLE IF EXISTS FACT_RENTAL;
DROP TABLE IF EXISTS FACT_PAYMENTS;
DROP TABLE IF EXISTS FACT_MAINTENANCE;
DROP TABLE IF EXISTS FACT_BIKE_TRACKING;
DROP TABLE IF EXISTS FACT_STATION_STATUS;

-- Drop all fact tables before dimension tables.
DROP TABLE IF EXISTS DIM_USER;
DROP TABLE IF EXISTS DIM_SUBSCRIPTION_PLAN;
DROP TABLE IF EXISTS DIM_DATE;
DROP TABLE IF EXISTS DIM_TIME;
DROP TABLE IF EXISTS DIM_BIKE;
DROP TABLE IF EXISTS DIM_STATION;
DROP TABLE IF EXISTS DIM_MAINTENANCE;

---------------DIM_DATE-------------------
CREATE TABLE DIM_DATE (
    date_key INT PRIMARY KEY,
    full_date DATE NOT NULL UNIQUE,
    day_number INT,
    day_of_week VARCHAR(10),
    weekend_flag BOOLEAN,
    month_number INT,
    month_name VARCHAR(10),
    quarter VARCHAR (2),
    month_year VARCHAR(7),
    year INT,
    major_event VARCHAR(50),
    holiday VARCHAR(50)
);

---------------DIM_TIME---------------
CREATE TABLE DIM_TIME (
    time_sk INT PRIMARY KEY IDENTITY(1,1),
    time_of_day TIME NOT NULL UNIQUE,
    hour INT CHECK (hour >= 0 AND hour <= 23),
    minute INT CHECK (minute >= 0 AND minute <= 59),
    time_of_day_name VARCHAR(20),
    
);

---------------DIM_USER---------------
CREATE TABLE DIM_USER (
    user_sk INT PRIMARY KEY IDENTITY(1,1),
    user_id VARCHAR(50) UNIQUE DEFault 'Kiosk',
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email_id VARCHAR(100),
    phone_number INT UNIQUE,
    gender VARCHAR(10) CHECK (gender IN ('Male', 'Female', 'Non-binary')),
    acc_created_date_sk INT NOT NULL,
    date_of_birth_sk INT NOT NULL,
    plan_sk INT,
    plan_start_sk INT,
    plan_end_sk INT,
    FOREIGN KEY (acc_created_date_sk) REFERENCES DIM_DATE(date_key),
    FOREIGN KEY (date_of_birth_sk) REFERENCES DIM_DATE(date_key),
    FOREIGN KEY (plan_start_sk) REFERENCES DIM_DATE(date_key),
    FOREIGN KEY (plan_end_sk) REFERENCES DIM_DATE(date_key)
);

---------------DIM_SUBSCRIPTION_PLAN---------------
CREATE TABLE DIM_SUBSCRIPTION_PLAN (
    plan_sk INT PRIMARY KEY IDENTITY(1,1),
    plan_name VARCHAR(50) NOT NULL UNIQUE,
    price DECIMAL(10, 2) NOT NULL,
    plan_description VARCHAR(255)
);

---------------DIM_STATION---------------
CREATE TABLE DIM_STATION (
    station_sk INT PRIMARY KEY IDENTITY(1,1),
    station_id VARCHAR(50) NOT NULL UNIQUE,
    station_name VARCHAR(100) NOT NULL,
    station_latitude DECIMAL(9, 6) NOT NULL,
    station_longitude DECIMAL(9, 6) NOT NULL,
    station_address VARCHAR(255),
    station_city VARCHAR(50),
    station_postcode VARCHAR(10),
    total_docks INT
);

---------------DIM_BIKE---------------
CREATE TABLE DIM_BIKE (
    bike_sk INT PRIMARY KEY IDENTITY(1,1),
    bike_id VARCHAR(50) NOT NULL UNIQUE,
    bike_model VARCHAR(50) NOT NULL,
    bike_propulsion_type VARCHAR(50) NOT NULL 
    CHECK (bike_propulsion_type IN ('Manual', 'Electric')),
    default_reserve_time INT,
    return_constraint VARCHAR(50)
);

---------------DIM_MAINTENANCE---------------
CREATE TABLE DIM_MAINTENANCE (
    maintenance_sk INT PRIMARY KEY IDENTITY(1,1),
    maintenance_category VARCHAR(50) NOT NULL,
    maintenance_subtype VARCHAR(50) NOT NULL,
    maintenance_desc VARCHAR(255)
);

---------------FACT_RENTAL---------------
CREATE TABLE FACT_RENTAL (
    rental_sk INT PRIMARY KEY IDENTITY(1,1),
    rental_id VARCHAR(50) NOT NULL UNIQUE,
    user_sk INT,
    bike_sk INT NOT NULL,
    start_station_sk INT NOT NULL,
    end_station_sk INT,
    subscription_plan_sk INT,
    rental_date_sk INT NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME,
    duration INT,
    rental_cost DECIMAL(10, 2),
    FOREIGN KEY (user_sk) REFERENCES DIM_USER(user_sk),
    FOREIGN KEY (bike_sk) REFERENCES DIM_BIKE(bike_sk),
    FOREIGN KEY (start_station_sk) REFERENCES DIM_STATION(station_sk),
    FOREIGN KEY (end_station_sk) REFERENCES DIM_STATION(station_sk),
    FOREIGN KEY (subscription_plan_sk) REFERENCES DIM_USER(plan_sk),
    FOREIGN KEY (rental_date_sk) REFERENCES DIM_DATE(date_key),
    FOREIGN KEY (start_time_sk) REFERENCES DIM_TIME(time_sk),
    FOREIGN KEY (end_time_sk) REFERENCES DIM_TIME(time_sk)
);

---------------FACT_PAYMENTS---------------
CREATE TABLE FACT_PAYMENTS (
    payment_sk INT PRIMARY KEY IDENTITY(1,1),
    user_sk INT,
    rental_sk INT NOT NULL,
    payment_date_sk INT NOT NULL,
    payment_amount DECIMAL(10, 2) NOT NULL,
    payment_method VARCHAR(50),
    payment_status VARCHAR(50),
    FOREIGN KEY (user_sk) REFERENCES DIM_USER(user_sk),
    FOREIGN KEY (rental_sk) REFERENCES FACT_RENTAL(rental_sk),
    FOREIGN KEY (payment_date_sk) REFERENCES DIM_DATE(date_key)
);

---------------FACT_MAINTENANCE---------------
CREATE TABLE FACT_MAINTENANCE (
    maintenance_sk INT PRIMARY KEY IDENTITY(1,1),
    maintenance_event_id VARCHAR(50) NOT NULL UNIQUE,
    maintenance_type_sk INT NOT NULL,
    bike_sk INT NOT NULL,
    maintenance_date_sk INT NOT NULL,
    downtime_in_hours DECIMAL(6, 2),
    FOREIGN KEY (maintenance_type_sk) REFERENCES DIM_MAINTENANCE(maintenance_sk),
    FOREIGN KEY (bike_sk) REFERENCES DIM_BIKE(bike_sk),
    FOREIGN KEY (maintenance_date_sk) REFERENCES DIM_DATE(date_key)
);

---------------FACT_BIKE_TRACKING---------------
CREATE TABLE FACT_BIKE_TRACKING (
    tracking_sk INT PRIMARY KEY IDENTITY(1,1),
    bike_sk INT NOT NULL,
    station_sk INT,
    date_sk INT NOT NULL,
    time_sk INT NOT NULL,
    bike_status VARCHAR(50),
    latitude DECIMAL(9, 6),
    longitude DECIMAL(9, 6),
    FOREIGN KEY (bike_sk) REFERENCES DIM_BIKE(bike_sk),
    FOREIGN KEY (station_sk) REFERENCES DIM_STATION(station_sk),
    FOREIGN KEY (date_sk) REFERENCES DIM_DATE(date_key),
    FOREIGN KEY (time_sk) REFERENCES DIM_TIME(time_sk)
);

---------------FACT_STATION_STATUS---------------
CREATE TABLE FACT_STATION_STATUS (
    station_status_sk INT PRIMARY KEY IDENTITY(1,1),
    end_station_sk INT NOT NULL,
    date_sk INT NOT NULL,
    time_sk INT NOT NULL,
    bikes_count INT,
    empty_docks_count INT,
    FOREIGN KEY (end_station_sk) REFERENCES DIM_STATION(station_sk),
    FOREIGN KEY (date_sk) REFERENCES DIM_DATE(date_key),
    FOREIGN KEY (time_sk) REFERENCES DIM_TIME(time_sk)
);
