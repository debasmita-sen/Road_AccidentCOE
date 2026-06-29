Road Accident Analysis Dashboard

Excel, SQL and Power BI Milestone Project

Project Overview

This project analyzes road accident data to identify patterns in accident severity, casualty count, road conditions, weather conditions, vehicle types, and location-based accident risk. The main objective is to build an interactive analytics dashboard that helps decision-makers understand where and under what conditions accidents are more likely to become serious or fatal.

The project follows an end-to-end analytics workflow using Microsoft Excel, MySQL, and Power BI. Excel was used for cleaning, preparation, and initial analysis. MySQL was used to store the cleaned data in structured relational tables and perform SQL-based analysis. Power BI was used to create an interactive dashboard with KPIs, slicers, charts, and business insights.

---

Business Problem Statement

Road safety authorities and transport decision-makers need clear visibility into accident patterns across severity levels, road types, weather conditions, vehicle types, and local authority districts. Without proper analysis, it becomes difficult to identify high-risk accident conditions and take targeted safety actions.

This project aims to answer questions such as:

- Which accident severity level occurs most frequently?
- Which road types and vehicle types are linked with higher casualties?
- Do weather and road surface conditions affect accident severity?
- Which districts report higher accident counts?
- Are serious or fatal accidents more common under certain speed limits or lighting conditions?
- What actions can road safety authorities take to reduce accident risk?

---

Dataset Information

The dataset used in this project is a cleaned road accident dataset.

Dataset Summary

Item| Description
Dataset Name| Road Accident Data
File Format| CSV / Excel
Total Cleaned Records| Approximately 302,536 records
Total Columns| 27 columns
Main Identifier| accident_index
Time Period| 2021–2022
Main Focus Area| Accident Severity and Road Safety Risk Analysis

Key Columns Used

Column Name| Description
accident_index| Unique accident record ID
accident_date| Date of accident
day_of_week| Day on which accident occurred
accident_severity| Severity of accident: Slight, Serious, Fatal
number_of_casualties| Number of casualties in the accident
number_of_vehicles| Number of vehicles involved
speed_limit| Speed limit of the road
road_type| Type of road where accident occurred
road_surface_conditions| Road surface condition
weather_conditions| Weather condition during accident
light_conditions| Lighting condition during accident
vehicle_type| Type of vehicle involved
local_authority_district| District/local authority area
urban_or_rural_area| Whether the accident occurred in an urban or rural area

---

Tools Used

Tool| Purpose
Microsoft Excel| Data cleaning, helper columns, PivotTables, charts, simple statistics
MySQL| Data storage, relational table creation, SQL querying
Power BI| Interactive dashboard creation and business storytelling
GitHub| Project submission and documentation

---

Methodology

1. Business Understanding

The project started by identifying the main business objective: understanding road accident severity and risk factors. Business questions were prepared around accident severity, road type, weather, lighting, vehicle type, district, and speed limit.

2. Data Cleaning in Excel

The raw dataset was reviewed for duplicate records, spelling issues, blank values, date formatting, and data quality problems.

Important cleaning steps included:

- Corrected accident severity spelling issue where needed.
- Checked duplicate accident records.
- Kept useful records even when some non-critical fields had missing values.
- Created helper columns such as year, month, month number, hour, severity score, and serious/fatal flag.
- Prepared the cleaned dataset for SQL and Power BI analysis.

3. SQL Database Preparation

The cleaned CSV file was imported into MySQL using a staging table. The dataset was then divided into three relational tables to show proper database structure.

SQL Table Structure

accident_fact

This is the central fact table. It stores the main accident-level details.

Key columns:

- accident_index
- accident_date
- accident_time
- day_of_week
- accident_severity
- number_of_casualties
- number_of_vehicles
- speed_limit
- year
- month
- month_number
- hour
- severity_score
- serious_fatal_flag

accident_location

This table stores accident location-related details.

Key columns:

- accident_index
- latitude
- longitude
- local_authority_district
- police_force
- urban_or_rural_area

accident_conditions

This table stores road, weather, light, junction, and vehicle-related details.

Key columns:

- accident_index
- junction_control
- junction_detail
- light_conditions
- carriageway_hazards
- road_surface_conditions
- road_type
- weather_conditions
- vehicle_type

Relationship Structure

The three final tables are connected using "accident_index".

accident_fact.accident_index = accident_location.accident_index

accident_fact.accident_index = accident_conditions.accident_index

This structure allows accident severity, casualties, location, weather, road type, and vehicle type to be analyzed together using SQL JOIN queries and Power BI relationships.

4. SQL Analysis

SQL queries were written using:

- SELECT
- WHERE
- JOIN
- GROUP BY
- COUNT
- SUM
- AVG

The SQL analysis answered questions such as:

- Which accidents were serious or fatal?
- Which speed limits show higher serious/fatal accident rates?
- Which road types have higher accident counts?
- Which districts report the most accidents?
- Which weather conditions are linked with serious/fatal accidents?

5. Power BI Dashboard Development

Power BI was used to create an interactive dashboard with KPI cards, slicers, charts, and relationship-based visuals.

The dashboard includes:

- Total Accidents
- Total Casualties
- Fatal Accidents
- Serious/Fatal Accident Rate
- Average Casualties per Accident
- Monthly Accident Trend
- Accident Severity Breakdown
- Vehicle Type Analysis
- Road Type Analysis
- Urban vs Rural Accident Split
- Light Condition Analysis
- Weather and Road Surface Filters

---

Key KPIs

KPI| Description
Total Accidents| Total number of unique accident records
Total Casualties| Total number of casualties across all accidents
Fatal Accidents| Number of accidents marked as fatal
Serious/Fatal Accident Rate| Percentage of accidents that were serious or fatal
Average Casualties per Accident| Average number of casualties per accident

Unique KPI

The unique KPI selected for this project is:

Serious/Fatal Accident Rate

This KPI helps measure the proportion of accidents that resulted in serious or fatal outcomes. It is useful for understanding overall road safety risk.

---

Preliminary Dashboard Numbers

Based on the cleaned dataset and Power BI measures:

Metric| Value
Total Accidents| Approximately 303K
Total Casualties| Approximately 410K
Fatal Accidents| Approximately 4K
Average Casualties per Accident| 1.36
Serious/Fatal Accident Rate| 14.47%

---

Dashboard Screenshots

Add dashboard screenshots here after completing the Power BI dashboard.

Example:

![Executive Overview Dashboard](03_PowerBI/Dashboard_Screenshots/executive_overview.png)

![Road and Weather Analysis](03_PowerBI/Dashboard_Screenshots/road_weather_analysis.png)

![Location and Severity Analysis](03_PowerBI/Dashboard_Screenshots/location_severity_analysis.png)

---

Key Insights

The following insights will be finalized after completing the Power BI dashboard:

1. A large share of accidents are slight, but serious and fatal accidents still form an important risk category.
2. Some road types and vehicle types are associated with higher casualty counts.
3. Weather, lighting, and road surface conditions may influence accident severity.
4. Urban and rural accident patterns may differ in terms of count and severity.
5. Certain local authority districts may need more targeted road safety interventions.

---

Business Recommendations

Based on the analysis, the following actions are recommended:

1. Focus on Serious and Fatal Accident Reduction

Since serious and fatal accidents directly impact public safety, authorities should prioritize high-risk areas and conditions where these accidents occur more frequently.

Expected Impact:
Reduction in severe road accident outcomes and improved road safety planning.

2. Improve Safety Measures on High-Risk Road Types

Road types with higher accident or casualty counts should be reviewed for better signage, speed control, lighting, and road safety infrastructure.

Expected Impact:
Lower accident frequency and reduced casualty severity on risky road segments.

3. Target Weather and Road Surface Risk Conditions

If higher accident rates are observed during poor weather or wet road surface conditions, safety alerts, road maintenance, and driver awareness campaigns should be improved.

Expected Impact:
Better accident prevention during risky driving conditions.

4. Monitor District-Level Accident Hotspots

Districts with high accident counts should be prioritized for further investigation and road safety interventions.

Expected Impact:
More focused resource allocation and better local safety planning.

---

Project Folder Structure

StudentID_Name_MilestoneProject/
│
├── README.md
│
├── 01_Excel/
│   └── StudentID_Name_ExcelAnalysis.xlsx
│
├── 02_SQL/
│   ├── StudentID_Name_SQLScripts.sql
│   └── TableNotes.pdf
│
├── 03_PowerBI/
│   ├── StudentID_Name_PowerBI.pbix
│   └── Dashboard_Screenshots/
│
└── 04_Final_Report/
    ├── StudentID_Name_BusinessInsightReport.pdf
    └── DataDictionary.pdf

---

Conclusion

This project demonstrates how road accident data can be transformed into meaningful business and safety insights using Excel, SQL, and Power BI. By analyzing accident severity, casualties, road conditions, weather conditions, vehicle types, and locations, the dashboard helps identify high-risk patterns and supports data-driven road safety decisions.
