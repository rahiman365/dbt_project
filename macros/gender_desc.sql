{% macro gender_desc(col) %}
        case when {{ col }} = 'M' then 'MALE'
         when {{ col }} = 'F' then 'FEMALE'
         else 'UNKNOWN' end
{% endmacro %}