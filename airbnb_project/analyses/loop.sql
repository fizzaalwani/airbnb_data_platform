{% set columns=['nights_booked','booking_amount', 'booking_status']%}

select  
{% for col in columns %}
    {{ col }}
    {% if not loop.last %} , {% endif%}
 {% endfor%}
from {{ref('bronze_bookings')}}
