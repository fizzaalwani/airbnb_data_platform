{{ config(
    materialized='incremental'
)}}

select * from {{ source('staging','listings') }}

{% if is_incremental() %}
where created_at > 
        coalesce(( select max(created_at) from {{ this }} ),
        '1900-01-01')
{% endif %}
