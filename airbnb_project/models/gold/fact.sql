{# {% set configs=[
        {
            'table':'AIRBNB.gold.obt',
            'alias':'gold_obt',
            'columns':'gold_obt.BOOKING_ID,gold_obt.LISTING_ID,gold_obt.HOST_ID,
            gold_obt.NIGHTS_BOOKED,gold_obt.TOTAL_AMOUNT,gold_obt.ACCOMMODATES,
            gold_obt.BEDROOMS,gold_obt.BATHROOMS,gold_obt.PRICE_PER_NIGHT,gold_obt.RESPONSE_RATE'
        },
           {
            'table':'AIRBNB.gold.dim_listings',
            'alias':'gold_dim_listings',
            'columns':'',
            'join_condition': 'gold_dim_listings.LISTING_ID = gold_obt.LISTING_ID'
        },
        {
            'table':'AIRBNB.gold.dim_hosts',
            'alias':'gold_dim_hosts',
            'columns':'',
            'join_condition':'gold_dim_hosts.HOST_ID = gold_obt.HOST_ID'
        }
]
%}


select 
        {{ configs[0]['columns']}}
from 
{% for config in configs %}
    {% if loop.first %} 
        {{ config['table']}} as {{ config['alias']}} 
    {% else %}
        inner join {{config['table']}} as {{ config['alias']}} on {{ config['join_condition']}}
    {% endif%}
{% endfor%} #}


SELECT
    gold_obt.BOOKING_ID,
    gold_obt.LISTING_ID,
    gold_obt.HOST_ID,
    gold_obt.NIGHTS_BOOKED,
    gold_obt.TOTAL_AMOUNT,
    gold_obt.ACCOMMODATES,
    gold_obt.BEDROOMS,
    gold_obt.BATHROOMS,
    gold_obt.PRICE_PER_NIGHT,
    gold_obt.RESPONSE_RATE
FROM {{ ref('obt') }} AS gold_obt
