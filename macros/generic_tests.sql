{% test valid_page(model, column_name) %}
select * 
from {{model}}
where {{column_name}} not in ('home', 'pricing', 'docs')
{% endtest %}

