# Ethereum On-Chain Analytics Pipeline (dbt Core + Snowflake)

## 📌 Project Overview
An end-to-end, automated ELT (Extract, Load, Transform) data pipeline designed to ingest, process, and analyze raw Ethereum blockchain data. The architecture leverages **Snowflake** as a high-performance cloud data warehouse, **dbt Core** for data modeling and data quality testing, and **GitHub Actions** to enforce robust CI/CD integration and deployment workflows.

## 🏗️ Technical Architecture
1. **Ingestion & Storage (Snowflake):** Raw, semi-structured Ethereum blocks and transaction data are ingested as variant JSON payloads directly into an immutable storage tier.
2. **Analytics Engineering (dbt Core):** Transforms raw event layers into highly structured, optimized analytics marts utilizing dimensional modeling (Stars/Snowflake schemas).
3. **Data Quality & Governance:** Implements native dbt schema and data integrity constraints to catch anomalies (e.g., handling null block data, duplicate transaction hashes) prior to warehouse materialization.
4. **CI/CD Automation (GitHub Actions):** Automates pipeline building and schema validation on every branch merge request to maintain data reliability.

## ⚙️ Repository Structure
├── .github/
│   └── workflows/          # CI/CD Automation Workflows for Pipeline Testing
├── models/
│   ├── staging/            # Base data cleanup and source validation layers
│   └── marts/              # Optimized analytical reporting tables and dimensions
├── dbt_project.yml         # Core dbt architecture configuration
└── schema.yml              # Centralized data quality testing and governance rules

## 🧪 Data Quality & Testing Controls
This pipeline treats data like production software. It leverages automated checks to completely eliminate data corruption downstream:
* **Uniqueness:** Validates hash keys across records.
* **Null Verification:** Guarantees critical block metrics are never missing.
* **Incremental Materialization:** Designed to compute only new transaction logs, drastically reducing Snowflake warehouse credit consumption.

## 🛠️ Tech Stack
* **Cloud Data Warehouse:** Snowflake
* **Transformation & Lineage:** dbt Core (SQL / Jinja)
* **Automation:** GitHub Actions CI/CD
* **Languages:** Modern SQL (CTEs, Window Functions)
