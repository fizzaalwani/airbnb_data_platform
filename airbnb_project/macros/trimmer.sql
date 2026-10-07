{% macro trimmer(col) %}
    UPPER(trim( {{col}} ))
{% endmacro %}