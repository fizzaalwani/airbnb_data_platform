{{ config(
    materialized ='incremental'
)}}

with cte as (
    select avg(response_rate) as avg_response_rate from {{ ref("bronze_hosts")}}
)
select HOST_ID,
        REPLACE(HOST_NAME, ' ', '_') AS HOST_NAME,
        HOST_SINCE AS HOST_SINCE,
        IS_SUPERHOST AS IS_SUPERHOST,
        RESPONSE_RATE AS RESPONSE_RATE,
        CASE 
        WHEN response_rate > (select * from cte) THEN 'GOOD'
        ELSE 'NOT GOOD'
        END AS RESPONSE_RATE_QUALITY,
        CREATED_AT AS CREATED_AT
        from {{ ref("bronze_hosts")}}