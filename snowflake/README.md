# Snowflake Setup and Data Transformation

This directory contains the SQL scripts used to set up the Snowflake environment, integrate with AWS S3, load data, and perform data transformations for the Tableau visualization project.

## Overview

The Snowflake setup involves:

1. **Storage Integration**: configuring a secure connection to the AWS S3 bucket.
2. **Data Loading**: creating the database, schema, and tables, and ingesting raw data from S3.
3. **Data Transformation**: cleaning and modifying the data to prepare it for analysis and visualization.

## Prerequisites

- AWS S3 bucket configured with dataset (see `aws/s3_setup.md`).
- IAM Role for Snowflake (see `aws/iam_role_setup.md`).
- Snowflake account with `ACCOUNTADMIN` or appropriate privileges.

## Project Structure & Scripts

### 1. Storage Integration

**File:** [`creating_integration.sql`](creating_integration.sql)

This script creates a storage integration object in Snowflake to allow secure access to the external S3 stage.

- **Object**: `tableau_Integration`
- **Type**: `EXTERNAL_STAGE`
- **Provider**: `S3`
- **Role ARN**: Links to the AWS IAM role.

### 2. Data Loading

**File:** [`loading_data.sql`](loading_data.sql)

This script handles the initialization of the database and data ingestion.

- **Database**: `tableau`
- **Schema**: `tableau_Data`
- **Table**: `tableau_dataset` (defines the structure for household energy data).
- **Stage**: `tableau_stage` (points to the S3 bucket using the storage integration).
- **Copy Command**: Loads data from the external stage into the `tableau_dataset` table.

### 3. Data Transformation

**File:** [`data_transformation.sql`](data_transformation.sql)

This script performs analysis and modifies the data for different scenarios.

- **Exploration**: Basic counts and grouping by region/income.
- **Backup**: Creates a working copy table `energy_consumption`.
- **Transformations**:
  - Adjusts `monthly_usage_kwh` based on `income_level` (simulating usage scenarios).
  - Adjusts `cost_savings_usd` based on `income_level`.
