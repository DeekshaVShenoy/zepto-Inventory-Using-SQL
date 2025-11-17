# Zepto Inventory using SQL
![](https://github.com/DeekshaVShenoy/zepto-Inventory-Using-SQL/blob/main/zepto%20logo.png)

## Project Overview
This project involves a comprehensive analysis of Zepto's inventory data using SQL.

## Objectives
  * Set up a messy, real-world e-commerce inventory database
  * Perform Exploratory Data Analysis (EDA) to explore product categories, availability, and pricing inconsistencies
  * Implement Data Cleaning to handle null values, remove invalid entries, and convert pricing from paise to rupees
  * Write business-driven SQL queries to derive insights around pricing, inventory, stock availability, revenue and more
    
## Dataset
The data for this project is sourced from the Kaggle dataset:
- **Dataset Link:** [Zepto Inventory Dataset](https://www.kaggle.com/datasets/palvinder2006/zepto-inventory-dataset/data?select=zepto_v2.csv)

## Project Workflow
**Create Database and SQL Table with appropriate datatypes**
```sql
Create database Zepto
use zepto
```
```sql
Drop Table if exists ProductDetails
CREATE TABLE ProductDetails (
    Category               VARCHAR(100),
    Name                   VARCHAR(255),
    MRP                    INT,
    DiscountPercent        INT,
    AvailableQuantity      INT,
    DiscountedSellingPrice INT,
    WeightInGms            INT,
    OutOfStock             VARCHAR(100),
    Quantity               INT
);
```
**Data Import - Bulk Upload data from CSV to ProductDetails Table using below SQL Query**
```sql
BULK INSERT ProductDetails
FROM 'C:\zepto_v2.csv'
WITH (
    FORMAT = 'CSV',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIELDQUOTE = '"',
    FIRSTROW = 2
);
```
## 3.Data Exploration
  * Counted the total number of records in the dataset
  * Viewed a sample of the dataset to understand structure and content
  * Checked for null values across all columns
  * Identified distinct product categories available in the dataset
  * Compared in-stock vs out-of-stock product counts
  * Detected products present multiple times
  
## 4.Data Cleaning
  * Identified and removed rows where MRP or discounted selling price was zero
  * Converted mrp and discountedSellingPrice from paise to rupees for consistency and readability
  
## 5 .Business Insights
  * Found top 10 best-value products based on discount percentage
  * Identified high-MRP products that are currently out of stock
  * Estimated potential revenue for each product category
  * Filtered expensive products (MRP > ₹500) with minimal discount
  * Ranked top 5 categories offering highest average discounts
  * Calculated price per gram to identify value-for-money products
  * Grouped products based on weight into Low, Medium, and Bulk categories
  * Measured total inventory weight per product category


## Author - Deeksha Shenoy

This project is part of my portfolio, showcasing the SQL skills essential for data analyst roles. If you have any questions, feedback, or would like to collaborate, feel free to get in touch!
