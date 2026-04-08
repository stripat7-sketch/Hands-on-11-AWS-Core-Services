# Hands-on-11-AWS-Core-Services

## Lab Overview
This lab demonstrates the integration of AWS services for serverless data processing:
- **S3**: Storage for raw and processed data
- **Glue**: Cataloging and crawling data
- **CloudWatch**: Monitoring crawler execution
- **Athena**: SQL querying on S3 data

## Architecture
1. Upload CSV data to S3 bucket
2. Create IAM role with appropriate permissions
3. Configure Glue crawler to infer schema
4. Monitor crawler via CloudWatch logs
5. Query cataloged data using Athena

## Dataset
- **Source:** Kaggle E-commerce Sales Data
- **File:** Amazon_Sale_Report.csv
- **Records:** [Number of rows in your data]
- **Columns:** 24 columns including Order_ID, Date, Status, Category, Amount, etc.

## Setup Steps

### 1. S3 Buckets Created
- **Raw data bucket:** `hands-on-data-stripat`
- **Processed data bucket:** `[your-processed-bucket-name]`

### 2. IAM Role Configuration
- **Role name:** `glue-s3-access-role`
- **Attached policies:**
  - AmazonS3FullAccess
  - AWSGlueServiceRole

### 3. Glue Crawler
- **Crawler name:** `ecommerce-crawler`
- **Database:** `ecommerce_db`
- **Status:** Successful
- **Tables created:** `sales_data`

### 4. CloudWatch Monitoring
- Crawler logs available in CloudWatch Logs
- No errors during execution

## Challenges Faced & Solutions

### Challenge 1: Table creation errors
**Issue:** Initial table creation failed due to metadata files in S3 bucket.
**Solution:** Cleaned up S3 bucket by removing `Unsaved` folder and metadata files.

### Challenge 2: Empty values in Amount column
**Issue:** Athena couldn't parse empty strings as DOUBLE data type.
**Solution:** Changed Amount column to STRING type and used CAST in queries with NULL handling.

### Challenge 3: File path issues
**Issue:** Spaces in filename caused parsing problems.
**Solution:** Renamed file from "Amazon Sale Report.csv" to "Amazon_Sale_Report.csv".

## Learning Outcomes
- How to configure IAM roles with least privilege principles
- Using Glue crawlers to automatically infer data schemas
- Monitoring AWS services with CloudWatch logs
- Writing analytical SQL queries in Athena
- Handling data quality issues (empty values, type mismatches)

## Repository Structure
```
Hands-on-11-AWS-Core-Services/
├── Output CSV files/
|   ├── Query 1.csv
|   ├── Query 2.csv
|   ├── Query 3.csv
|   ├── Query 4.csv
|   ├── Query 5.csv
├── Query SQL Input/
|   ├── Query 1.sql
|   ├── Query 2.sql
|   ├── Query 3.sql
|   ├── Query 4.sql
|   ├── Query 5.sql
├── Screenshots/
|   ├── Cloudwatch_logs.png
|   ├── Glue_Crawler.png
|   ├── IAM_role.png
|   └── S3_buckets.png
└── README.md
```



