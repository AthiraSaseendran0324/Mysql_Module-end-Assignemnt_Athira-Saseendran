# Mysql_Module-end-Assignemnt_Athira-Saseendran

DRIVE LINK : https://drive.google.com/drive/folders/1xdQCNvotTLlEQuV5b416AFJPYUvihv7_?usp=drive_link

E-Commerce Customer Churn Analysis

Project Overview

This project focuses on analysing an e-commerce customer churn dataset using MySQL. The project involves data cleaning, data transformation, and data exploration to understand customer behaviour and churn patterns.

Problem Statement

In the realm of e-commerce, businesses face the challenge of understanding customer churn patterns to ensure customer satisfaction and sustained profitability. This project aims to delve into the dynamics of customer churn within an e-commerce domain, utilizing historical transactional data to uncover underlying patterns and drivers of churn.

By analysing customer attributes such as tenure, preferred payment modes, satisfaction scores, and purchase behaviour, the project seeks to investigate and understand the dynamics of customer attrition and their propensity to churn.

The ultimate objective is to equip e-commerce enterprises with actionable insights to implement targeted retention strategies and mitigate churn, thereby fostering long-term customer relationships and ensuring business viability in a competitive landscape.

 Objectives

- Clean the customer churn dataset.
- Handle missing values and inconsistent data.
- Remove unwanted outliers.
- Transform and rename required columns.
- Analyse customer churn patterns using SQL.
- Explore customer behaviour using aggregate functions and grouping.
- Create and analyse customer return details.
- Use SQL joins and subqueries for data analysis.

 Project Steps
 1. Data Cleaning

- Checked and handled missing values.
- Performed mean imputation for numerical columns.
- Performed mode imputation for required columns.
- Removed records with WarehouseToHome values greater than 100.
- Corrected inconsistent values in selected columns.

 2. Data Transformation

- Renamed required columns.
- Created `ComplaintReceived` column.
- Created `ChurnStatus` column.
- Removed the original `Churn` and `Complain` columns.

 3. Data Exploration

SQL queries were used to analyse:

- Active and churned customer counts.
- Average tenure and cashback of churned customers.
- Complaints among churned customers.
- City tier and order category patterns.
- Preferred payment modes.
- Order amount hike.
- Registered devices.
- Coupon usage.
- Satisfaction scores.
- Average cashback by order category.
- Warehouse-to-home distance categories.
- Customer order behaviour.

4. Customer Returns

A separate `customer_returns` table was created and populated with return details.

The returns table was joined with the customer churn table to identify return details of customers who had churned and made complaints.

 Key SQL Concepts Used

- SELECT
- WHERE
- GROUP BY
- ORDER BY
- HAVING
- LIMIT
- COUNT()
- SUM()
- AVG()
- MAX()
- CASE
- Subqueries
- JOIN
- ALTER TABLE
- UPDATE
- DELETE
  
 Conclusion
The project successfully demonstrates the use of MySQL for cleaning, transforming, and analysing an e-commerce customer churn dataset. The analysis helps understand different customer characteristics, purchasing behaviour, satisfaction levels, payment preferences, and churn patterns.
The project also demonstrates practical use of SQL concepts such as aggregate functions, grouping, filtering, subqueries, and joins to extract useful information from customer data.
