-- Road Accident Analysis SQL Script
-- Database: road_accident
-- Purpose: Basic SQL analysis for road accident severity and safety risk analysis

create database road_accident;

use road_accident;



--Creating table for road accident data import

DROP TABLE IF EXISTS road_accident_stage;

CREATE TABLE road_accident_stage (
    accident_index VARCHAR(50),
    accident_date VARCHAR(30),
    day_of_week VARCHAR(20),
    junction_control VARCHAR(100),
    junction_detail VARCHAR(100),
    accident_severity VARCHAR(20),
    latitude VARCHAR(30),
    light_conditions VARCHAR(100),
    local_authority_district VARCHAR(100),
    carriageway_hazards VARCHAR(100),
    longitude VARCHAR(30),
    number_of_casualties VARCHAR(20),
    number_of_vehicles VARCHAR(20),
    police_force VARCHAR(100),
    road_surface_conditions VARCHAR(100),
    road_type VARCHAR(100),
    speed_limit VARCHAR(20),
    accident_time VARCHAR(30),
    urban_or_rural_area VARCHAR(50),
    weather_conditions VARCHAR(100),
    vehicle_type VARCHAR(100),
    year VARCHAR(10),
    month VARCHAR(20),
    month_number VARCHAR(10),
    hour VARCHAR(10),
    severity_score VARCHAR(10),
    serious_fatal_flag VARCHAR(10)
);




--Loading the data from file path

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/road_accident.csv'
INTO TABLE road_accident_stage
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(
    accident_index,
    accident_date,
    day_of_week,
    junction_control,
    junction_detail,
    accident_severity,
    latitude,
    light_conditions,
    local_authority_district,
    carriageway_hazards,
    longitude,
    number_of_casualties,
    number_of_vehicles,
    police_force,
    road_surface_conditions,
    road_type,
    speed_limit,
    accident_time,
    urban_or_rural_area,
    weather_conditions,
    vehicle_type,
    year,
    month,
    month_number,
    hour,
    severity_score,
    serious_fatal_flag
);



--Creating table and insert facts about the accidents

DROP TABLE IF EXISTS accident_fact;

CREATE TABLE accident_fact (
    accident_index VARCHAR(50) PRIMARY KEY,
    accident_date DATE,
    accident_time TIME NULL,
    day_of_week VARCHAR(20),
    accident_severity VARCHAR(20),
    number_of_casualties INT,
    number_of_vehicles INT,
    speed_limit INT,
    year INT,
    month VARCHAR(20),
    month_number INT,
    hour INT,
    severity_score INT,
    serious_fatal_flag INT
);


INSERT INTO accident_fact (
    accident_index,
    accident_date,
    accident_time,
    day_of_week,
    accident_severity,
    number_of_casualties,
    number_of_vehicles,
    speed_limit,
    year,
    month,
    month_number,
    hour,
    severity_score,
    serious_fatal_flag
)
SELECT DISTINCT
    accident_index,
    STR_TO_DATE(accident_date, '%d-%m-%Y'),
    CASE 
        WHEN accident_time = '' THEN NULL
        ELSE STR_TO_DATE(accident_time, '%H:%i')
    END,
    day_of_week,
    accident_severity,
    CAST(number_of_casualties AS UNSIGNED),
    CAST(number_of_vehicles AS UNSIGNED),
    CAST(speed_limit AS UNSIGNED),
    CAST(year AS UNSIGNED),
    month,
    CAST(month_number AS UNSIGNED),
    CAST(hour AS UNSIGNED),
    CAST(severity_score AS UNSIGNED),
    CAST(serious_fatal_flag AS UNSIGNED)
FROM road_accident_stage;



--Creating table and insert location of the accidents

DROP TABLE IF EXISTS accident_location;

CREATE TABLE accident_location (
    accident_index VARCHAR(50) PRIMARY KEY,
    latitude DECIMAL(10,6),
    longitude DECIMAL(10,6),
    local_authority_district VARCHAR(100),
    police_force VARCHAR(100),
    urban_or_rural_area VARCHAR(50),
    FOREIGN KEY (accident_index) REFERENCES accident_fact(accident_index)
);


INSERT INTO accident_location (
    accident_index,
    latitude,
    longitude,
    local_authority_district,
    police_force,
    urban_or_rural_area
)
SELECT
    accident_index,
    CAST(NULLIF(MAX(latitude), '') AS DECIMAL(10,6)),
    CAST(NULLIF(MAX(longitude), '') AS DECIMAL(10,6)),
    MAX(local_authority_district),
    MAX(police_force),
    MAX(urban_or_rural_area)
FROM road_accident_stage
GROUP BY accident_index;


--Creating table and insert conditions when the accidents took place

DROP TABLE IF EXISTS accident_conditions;

CREATE TABLE accident_conditions (
    accident_index VARCHAR(50) PRIMARY KEY,
    junction_control VARCHAR(100),
    junction_detail VARCHAR(100),
    light_conditions VARCHAR(100),
    carriageway_hazards VARCHAR(100),
    road_surface_conditions VARCHAR(100),
    road_type VARCHAR(100),
    weather_conditions VARCHAR(100),
    vehicle_type VARCHAR(100),
    FOREIGN KEY (accident_index) REFERENCES accident_fact(accident_index)
);


INSERT INTO accident_conditions (
    accident_index,
    junction_control,
    junction_detail,
    light_conditions,
    carriageway_hazards,
    road_surface_conditions,
    road_type,
    weather_conditions,
    vehicle_type
)
SELECT
    accident_index,
    MAX(junction_control),
    MAX(junction_detail),
    MAX(light_conditions),
    MAX(carriageway_hazards),
    MAX(road_surface_conditions),
    MAX(road_type),
    MAX(weather_conditions),
    MAX(vehicle_type)
FROM road_accident_stage
GROUP BY accident_index;


--View serious accidents
	
SELECT 
    accident_index,
    accident_date,
    accident_severity,
    number_of_casualties,
    speed_limit
FROM accident_fact
WHERE accident_severity = 'Serious'
LIMIT 20;



--View fatal accidents

SELECT 
    accident_index,
    accident_date,
    accident_severity,
    number_of_casualties,
    number_of_vehicles
FROM accident_fact
WHERE accident_severity = 'Fatal'
LIMIT 20;



-- View accidents on high-speed roads

SELECT 
    accident_index,
    accident_date,
    accident_severity,
    number_of_casualties,
    speed_limit
FROM accident_fact
WHERE speed_limit >= 60
LIMIT 20;



--Accidents by severity

SELECT 
    accident_severity,
    COUNT(*) AS total_accidents,
    SUM(number_of_casualties) AS total_casualties
FROM accident_fact
GROUP BY accident_severity
ORDER BY total_accidents DESC;



--Accidents by year

SELECT 
    year,
    COUNT(*) AS total_accidents,
    SUM(number_of_casualties) AS total_casualties,
    AVG(number_of_casualties) AS avg_casualties_per_accident
FROM accident_fact
GROUP BY year
ORDER BY year;



--Serious/fatal accident rate by speed limit

SELECT 
    speed_limit,
    COUNT(*) AS total_accidents,
    SUM(serious_fatal_flag) AS serious_fatal_accidents,
    ROUND((SUM(serious_fatal_flag) / COUNT(*)) * 100, 2) AS serious_fatal_rate_percent
FROM accident_fact
GROUP BY speed_limit
ORDER BY speed_limit;





--Accidents by road type

SELECT 
    c.road_type,
    COUNT(*) AS total_accidents,
    SUM(f.number_of_casualties) AS total_casualties
FROM accident_fact f
JOIN accident_conditions c
    ON f.accident_index = c.accident_index
GROUP BY c.road_type
ORDER BY total_accidents DESC;



--Top 10 accident districts

SELECT 
    l.local_authority_district,
    COUNT(*) AS total_accidents,
    SUM(f.number_of_casualties) AS total_casualties
FROM accident_fact f
JOIN accident_location l
    ON f.accident_index = l.accident_index
GROUP BY l.local_authority_district
ORDER BY total_accidents DESC
LIMIT 10;



--Weather condition and serious/fatal accident rate

SELECT 
    c.weather_conditions,
    COUNT(*) AS total_accidents,
    SUM(f.serious_fatal_flag) AS serious_fatal_accidents,
    ROUND((SUM(f.serious_fatal_flag) / COUNT(*)) * 100, 2) AS serious_fatal_rate_percent
FROM accident_fact f
JOIN accident_conditions c
    ON f.accident_index = c.accident_index
GROUP BY c.weather_conditions
ORDER BY serious_fatal_rate_percent DESC;



