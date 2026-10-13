{{ config(
    materialized = 'ephemeral'
)}}

with hosts as (
    select HOST_ID , HOST_NAME , HOST_SINCE ,IS_SUPERHOST , 
    RESPONSE_RATE_QUALITY ,CREATED_AT AS HOST_CREATED_AT
    from {{ ref('silver_hosts')}}
)

select * from hosts

