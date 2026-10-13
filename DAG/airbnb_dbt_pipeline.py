
from datetime import datetime

from airflow import DAG
from airflow.providers.standard.operators.bash import BashOperator


with DAG(
    dag_id="airbnb_dbt_pipeline",
    description="Run Airbnb dbt transformations and tests in Snowflake",
    start_date=datetime(2026, 1, 1),
    schedule="0 2 * * *",
    catchup=False,
    tags=["airbnb", "dbt", "snowflake"],
) as dag:

    run_dbt_build = BashOperator(
        task_id="run_dbt_build",
       
bash_command="""
    mkdir -p /tmp/dbt-logs /tmp/dbt-target &&
    cd /opt/airflow/airbnb_project &&
    dbt build \
        --no-partial-parse \
        --log-path /tmp/dbt-logs \
        --target-path /tmp/dbt-target \
        --profiles-dir /opt/airflow/.dbt \
        --target dev
""",

    )
