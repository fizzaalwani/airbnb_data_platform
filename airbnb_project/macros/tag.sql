{% macro tag(col) %}
   CASE WHEN {{ col }} > AVG({{col}}) OVER() THEN 'ABOVE AVG'
   ELSE 'BELOW AVG' END
{% endmacro %}