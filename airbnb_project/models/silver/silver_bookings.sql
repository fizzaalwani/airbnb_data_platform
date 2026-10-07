{{ config(
    materialized='incremental',
    unique_key='booking_id'
)}}

select  BOOKING_ID ,
        LISTING_ID,
        BOOKING_DATE,
        NIGHTS_BOOKED,
        ({{ multiply('booking_amount','nights_booked',2)}} + cleaning_fee + service_fee) as total_amount,
        {{ trimmer('booking_status') }} as BOOKING_STATUS,
        CREATED_AT
from {{ ref('bronze_bookings')}}
