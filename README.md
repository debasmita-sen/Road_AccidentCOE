

# 🚦 Road Accident Analysis Dashboard  
### Excel • SQL • Power BI | Accident Severity & Road Safety Insights

<img src="https://img.shields.io/badge/Project-Road%20Accident%20Analysis-blue?style=for-the-badge" />
<img src="https://img.shields.io/badge/Tool-Excel-green?style=for-the-badge" />
<img src="https://img.shields.io/badge/Tool-MySQL-orange?style=for-the-badge" />
<img src="https://img.shields.io/badge/Tool-Power%20BI-yellow?style=for-the-badge" />

</div>

---

## 📌 Project Overview

The **Road Accident Analysis Dashboard** is a data analytics project created using **Excel, SQL, and Power BI**. The project focuses on analyzing accident patterns, casualty risk, road conditions, vehicle involvement, and accident severity.

The main objective of this project is to transform raw road accident data into meaningful business insights that can support **road safety planning, accident prevention, and decision-making**.

This project includes:

- 📊 Excel-based data cleaning, PivotTables, charts, and simple statistics  
- 🗄️ SQL database design, table creation, data import, and analytical queries  
- 📈 Power BI dashboard with KPIs, slicers, and interactive visuals  
- 📝 Business insights and recommendations based on accident trends  

---

## 🎯 Business Problem

Road safety authorities and decision-makers need a clear understanding of accident patterns to reduce accident severity and casualty risk. However, raw accident data is difficult to interpret without proper cleaning, analysis, and visualization.

This project aims to answer important business questions such as:

- Which accident severity level occurs most frequently?
- Which road type records the highest number of accidents?
- Which vehicle types are linked with higher casualty counts?
- Do weather and light conditions affect accident patterns?
- Are accidents more common in urban or rural areas?
- Which months or years show higher accident frequency?
- Which locations or districts show higher accident and casualty risk?

By answering these questions, the analysis helps identify **high-risk accident conditions** and supports better road safety actions.

---

## 📂 Dataset Information

The dataset contains detailed road accident records with accident-level, location-based, road condition, weather, vehicle, and time-related information.

### Key Dataset Columns

| Category | Important Columns |
|---|---|
| Accident Details | `accident_index`, `accident_date`, `accident_time`, `accident_severity` |
| Casualty & Vehicle Details | `number_of_casualties`, `number_of_vehicles`, `vehicle_type` |
| Road Information | `road_type`, `road_surface_conditions`, `speed_limit`, `junction_control`, `junction_detail` |
| Weather & Light Conditions | `weather_conditions`, `light_conditions`, `carriageway_hazards` |
| Location Details | `latitude`, `longitude`, `local_authority_district`, `police_force`, `urban_or_rural_area` |
| Time Details | `year`, `month`, `month_number`, `day_of_week`, `hour` |
| Derived Fields | `severity_score`, `serious_fatal_flag` |

---

## 🛠️ Tools & Technologies Used

| Tool | Purpose |
|---|---|
| **Microsoft Excel** | Data cleaning, PivotTables, PivotCharts, simple statistics, summary dashboard |
| **MySQL** | Database creation, table design, data import, SQL analysis |
| **Power BI** | Interactive dashboard creation and visual storytelling |
| **CSV** | Cleaned data import and transfer between tools |

---

## 🧱 SQL Schema Design

The cleaned road accident data was divided into three structured SQL tables.

| Table Name | Purpose |
|---|---|
| `accident_fact` | Main accident-level table containing severity, casualties, vehicles, speed, and time details |
| `accident_location` | Stores accident location details such as district, police force, latitude, longitude, and urban/rural area |
| `accident_conditions` | Stores road, weather, light, junction, surface, hazard, and vehicle-related conditions |

### Relationship Key

All tables are connected using:

```sql
accident_index
````

### Table Relationships

```sql
accident_fact.accident_index = accident_location.accident_index

accident_fact.accident_index = accident_conditions.accident_index
```
<img width="1011" height="498" alt="Relationship" src="https://github.com/user-attachments/assets/d3f41d90-2e6f-49db-9e1b-c8155ef99deb" />

---

## 🔄 Methodology

The project was completed in the following steps:

### 1️⃣ Data Cleaning in Excel

The raw accident dataset was cleaned and prepared for analysis. Missing values, inconsistent text formats, duplicate records, and incorrect data types were reviewed.

Additional derived columns were created, such as:

* `year`
* `month`
* `month_number`
* `hour`
* `severity_score`
* `serious_fatal_flag`

These columns helped in trend analysis, severity analysis, and dashboard filtering.

---

### 2️⃣ Excel Analysis

Excel was used to create:

* PivotTables
* PivotCharts
* Summary dashboard
* Simple statistics summary
* Correlation analysis
* Monthly accident trend chart
* Outlier review

The Excel analysis helped identify accident patterns by severity, road type, month, vehicle type, weather condition, and light condition.

---

### 3️⃣ SQL Analysis

The cleaned CSV file was imported into MySQL. SQL queries were used to analyze accident severity, casualties, road types, weather conditions, speed limits, and location-based accident patterns.

Examples of SQL analysis performed:

* Accident count by severity
* Casualty count by road type
* Serious/Fatal accident rate by weather condition
* Top districts by accidents and casualties
* Accident patterns by year and speed limit

---

### 4️⃣ Power BI Dashboard

Power BI was used to create an interactive dashboard with KPIs, charts, slicers, and visual storytelling.

The dashboard includes:

* Total Accidents
* Total Casualties
* Fatal Accidents
* Serious/Fatal Accident Rate
* Average Casualties per Accident
* Monthly Accident Trend
* Accidents by Severity
* Accidents by Road Type
* Urban vs Rural Accident Analysis
* Casualties by Vehicle Type
* Accidents by Light Conditions

---

## 📊 Key Dashboard KPIs

| KPI                                 | Description                                        |
| ----------------------------------- | -------------------------------------------------- |
| **Total Accidents**                 | Total number of accident records analyzed          |
| **Total Casualties**                | Total number of casualties recorded                |
| **Fatal Accidents**                 | Number of accidents classified as Fatal            |
| **Serious/Fatal Accident Rate**     | Percentage of accidents marked as Serious or Fatal |
| **Average Casualties per Accident** | Average number of casualties per accident          |

---

## 🔍 Key Findings

### 1️⃣ Accident Severity Pattern

The analysis shows that **Slight accidents form the largest share** of total accidents. However, Serious and Fatal accidents are highly important because they represent higher risk and greater impact on public safety.

### 2️⃣ Road Type Risk

Certain road types show higher accident counts and casualty levels. This indicates that road structure, traffic volume, and road usage patterns may influence accident occurrence.

### 3️⃣ Vehicle Type Impact

Some vehicle types are linked with higher casualty counts. This helps identify which vehicle categories require more safety monitoring and awareness campaigns.

### 4️⃣ Monthly Accident Trend

The monthly trend analysis shows how accident frequency changes over time. This helps identify whether accidents are concentrated in specific months or remain stable throughout the year.

### 5️⃣ Light and Weather Conditions

Accidents occur under different light and weather conditions. While accident counts may be higher in common driving conditions, poor visibility and adverse weather still require special attention from a road safety perspective.

### 6️⃣ Urban vs Rural Accident Pattern

The dashboard compares accidents in urban and rural areas. This helps understand whether accident frequency and casualty risk differ based on location type.

---

## 📸 Dashboard Screenshots

### Main Power BI Dashboard

<img width="885" height="493" alt="Dashboard Screenshot" src="https://github.com/user-attachments/assets/e561ec08-6b1e-4ffd-8722-29caa9995a24" />


### Excel Summary Dashboard

<img width="868" height="424" alt="image" src="https://github.com/user-attachments/assets/efba6716-ef3c-4d8b-8575-861e858befe6" />

<img width="1022" height="404" alt="image" src="https://github.com/user-attachments/assets/eb0e1bd8-73db-49de-babe-b9a9c9aa2bbf" />

---

## 💡 Business Recommendations

Based on the analysis, the following recommendations can be made:

### ✅ 1. Focus on High-Severity Accidents

Even though Slight accidents may be more frequent, Serious and Fatal accidents should receive priority because they have greater human impact.

### ✅ 2. Improve Safety Measures on High-Risk Road Types

Road types with higher accident and casualty counts should be reviewed for better signage, speed control, lane markings, and traffic monitoring.

### ✅ 3. Monitor Vehicle Categories with Higher Casualties

Vehicle types linked with higher casualty counts should be targeted through awareness campaigns, safety checks, and stricter traffic enforcement.

### ✅ 4. Strengthen Road Safety During Riskier Time Periods

If specific months show higher accident counts, authorities can plan seasonal safety campaigns, awareness programs, and enforcement activities during those periods.

### ✅ 5. Improve Visibility and Lighting Conditions

Accidents related to poor light conditions should be addressed through better street lighting, reflective signs, and visibility improvement measures.

### ✅ 6. Use Data-Driven Decision Making

Road safety planning should not depend on one factor alone. Accident severity, road type, vehicle type, weather, light condition, location, and time should be analyzed together for better decision-making.

---

## 📁 Project Folder Structure

```text
Road-Accident-Analysis-Dashboard/
│
├── README.md
│
├── 01_Excel/
│   └── Excel_Analysis.xlsx
│
├── 02_SQL/
│   ├── SQL_Scripts.sql
│   └── TableNotes.pdf
│
├── 03_PowerBI/
│   ├── PowerBI_Dashboard.pbix
│   └── Dashboard_Screenshots/
│
└── 04_Final_Report/
    ├── BusinessInsightReport.pdf
    └── DataDictionary.pdf
```

---

## 🧾 Final Conclusion

The Road Accident Analysis Dashboard provides a clear and structured view of accident patterns, severity levels, casualty risk, road conditions, vehicle involvement, and time-based trends.

By combining **Excel, SQL, and Power BI**, this project converts raw accident data into meaningful insights that can support road safety planning and decision-making.

The analysis highlights that accident risk should be understood through multiple factors together, including severity, road type, vehicle type, weather condition, light condition, location, and time. These insights can help authorities take targeted actions to reduce accident severity and improve public safety.

---

<div align="center">

## ⭐ Project Outcome

**A complete end-to-end data analytics project using Excel, SQL, and Power BI for road accident analysis and business insight generation.**

</div>
```
