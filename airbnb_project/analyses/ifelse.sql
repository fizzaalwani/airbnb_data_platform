{% set state= 2 %}


select * from {{ ref('bronze_bookings') }}
{%if state==1 %}
where nights_booked=1
{% else %}
where nights_booked <> 1
{% endif %}