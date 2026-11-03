{% macro etl_columns() %}
    {{ dbt.current_timestamp() }}   as etl_loaded_at,
    '{{ invocation_id }}'           as etl_batch_id,
    '{{ target.name }}'             as etl_environment,
    '{{ model.name }}'              as etl_model_name
{% endmacro %}