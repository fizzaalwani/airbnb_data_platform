# Airbnb Data Warehouse — Snowflake & dbt

An end-to-end Airbnb data warehouse built with **Snowflake and dbt**, following a **Bronze → Silver → Gold Medallion Architecture**.

## What I Built

* Incremental ELT pipelines using dbt
* Bronze, Silver, and Gold data layers
* Data cleaning and transformation with SQL
* OBT (One Big Table) and dimensional modeling
* Fact and dimension tables
* dbt snapshots for **SCD Type 2 historical tracking**
* Reusable Jinja macros and dynamic SQL
* dbt data quality tests
* Ephemeral models for intermediate transformations
* Snowflake as the analytical data warehouse

## Tech Stack

**Snowflake · dbt · SQL · Jinja · Git**

## Architecture

```text
Raw Airbnb Data
      ↓
   Snowflake
      ↓
   Bronze
      ↓
   Silver
      ↓
    Gold
   ├── OBT
   ├── Fact
   └── Dimensions
      ↓
   Power BI
```

## Project Structure

```text
models/
├── bronze/
├── silver/
└── gold/

macros/
snapshots/
tests/
analyses/
```

## Key Concepts

**ELT · Medallion Architecture · Incremental Models · Dimensional Modeling · OBT · SCD Type 2 · dbt Snapshots · Jinja · Data Quality**
