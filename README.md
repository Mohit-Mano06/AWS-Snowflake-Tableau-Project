# AWS-Snowflake-Tableau Project

## 📊 Project Overview

This project demonstrates a complete end-to-end data engineering pipeline. It ingests raw data into **AWS S3**, processes and loads it into **Snowflake** using Snowpipe for automation, and visualizes the insights using **Tableau**.

## 🏗️ Architecture

**AWS S3 (Storage)** -> **Snowflake (Data Warehousing/Compute)** -> **Tableau (Visualization)**

1. **Data Ingestion**: Raw CSV data is uploaded to an AWS S3 bucket.
2. **Storage Integration**: Snowflake is configured to securely access the S3 bucket via IAM roles.
3. **Data Loading**:
    - **Staging**: An external stage in Snowflake points to the S3 bucket.
    - **Snowpipe**: Automatically detects new files in S3 and loads them into Snowflake tables.
4. **Visualization**: Tableau connects to Snowflake to visualize the data.

## 📂 Project Structure

```bash
AWS-Snowflake-Tableau-Project/
├── aws/                # AWS Configuration files (e.g., IAM policies)
├── data/               # Raw data files (CSVs) to be uploaded to S3
├── images/             # Screenshots for documentation
├── snowflake/          # SQL scripts for Snowflake setup and querying
├── tableau/            # Tableau workbook files (.twb/.twbx)
└── README.md           # Project documentation
```

## ⚙️ Prerequisites

* **AWS Account**: To configure S3 and IAM roles.
- **Snowflake Account**: Free trial or standard account.
- **Tableau Desktop / Public**: To build dashboards.
- **SnowSQL** (Optional): For CLI-based Snowflake interaction.

## 🚀 Setup Instructions

### 1. AWS Configuration

1. **Create S3 Bucket**: Create a bucket (e.g., `snowflake-tableau-project-data`).
2. **Upload Data**: Upload the files from the `data/` folder to your S3 bucket.
3. **IAM Role**: Create an IAM role to allow Snowflake to access S3.
    - Attach a policy allowing `s3:GetObject` and `s3:ListBucket` on your specific bucket.
    - *See `aws/iam_policy.json` (if applicable) for the policy structure.*

### 2. Snowflake Setup

1. **Create Database & Schema**:

    ```sql
    CREATE DATABASE SALES_DB;
    CREATE SCHEMA SALES_SCHEMA;
    ```

2. **Create Storage Integration**:
    - Run the script to create a storage integration object using your AWS IAM Role ARN.
    - Retrieve the `STORAGE_AWS_IAM_USER_ARN` and `STORAGE_AWS_EXTERNAL_ID` and update the Trust Relationship in your AWS IAM Role.
3. **Create File Format & Stage**:
    - Define the CSV file format.
    - Create an external stage pointing to your S3 bucket.
4. **Create Pipe (Snowpipe)**:
    - Set up a pipe to auto-ingest data from S3 to your target table.
    - *Refer to `snowflake/setup_script.sql` for the complete SQL commands.*

### 3. Tableau Connection

1. Open Tableau Desktop.
2. Select **Connect** -> **To a Server** -> **Snowflake**.
3. Enter your Snowflake credentials:
    - **Server**: `<your-account>.snowflakecomputing.com`
    - **Warehouse**: Your compute warehouse (e.g., `COMPUTE_WH`)
    - **Authentication**: Username/Password
4. Select your `SALES_DB` and `SALES_SCHEMA`, then drag your tables to the canvas.
5. Start building your dashboard!

## 📈 Dashboard Overview



## 🛠️ Technologies Used

* **Amazon Web Services (S3, IAM)**
- **Snowflake Data Cloud**
- **Tableau**
- **SQL**


