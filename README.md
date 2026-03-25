# City Tree Services BI Dashboard (GCP)

## Overview

This project demonstrates how I built a cloud-based analytics and FinOps-style cost modeling solution using Google Cloud. The goal was to transform raw tree service operation logs into actionable insights that support data-driven decision-making and cost optimization.

## Problem Statement

City tree service operations generate large volumes of data, but without proper visualization and cost tracking, it is difficult to identify inefficiencies, high-cost service areas, and demand trends.

## Solution

I designed a data analytics pipeline using BigQuery and Looker Studio to analyze service data and simulate operational costs based on tree species. This enabled visibility into service demand and cost distribution across neighborhoods.

## Architecture

* BigQuery – Data warehouse for storing and querying large datasets
* Looker Studio – Dashboard for visualization and reporting
* SQL – Data transformation and cost modeling

## Key Features

* Built a BigQuery dataset to analyze tree service records
* Implemented a cost simulation model using SQL CASE statements
* Created interactive dashboards to visualize:

  * Service demand trends
  * Cost distribution by species
  * Neighborhood-level operational insights
* Enabled filtering and drill-down analysis in Looker Studio

## Sample Query (Cost Model)

```sql
SELECT
  neighborhood,
  species,
  COUNT(tree_id) AS total_trees,
  SUM(
    CASE
      WHEN species LIKE '%Maple%' THEN 30
      WHEN species LIKE '%Pine%' THEN 20
      ELSE 10
    END
  ) AS total_estimated_cost
FROM `your_project.your_dataset.your_table`
GROUP BY neighborhood, species;
```

## Business Impact

* Identified high-cost tree service categories
* Enabled cost visibility aligned with FinOps principles
* Provided insights for optimizing resource allocation and operational efficiency

## Technologies Used

* Google Cloud Platform (BigQuery, Looker Studio)
* SQL
* Data Visualization

## Screenshots


<img width="1298" height="563" alt="architecture-diagram" src="https://github.com/user-attachments/assets/5669f930-d814-4817-9872-89e97cef71e9" />

## Future Improvements

* Integrate real-time data ingestion
* Implement forecasting using BigQuery ML
* Add cost anomaly detection for proactive monitoring
