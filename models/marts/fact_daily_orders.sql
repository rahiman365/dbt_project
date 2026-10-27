{{
    config(
        materialized='incremental',
        incremental_strategy = 'insert_overwrite',
        partition_by = {"field" : "order_date",
                        "data_type": "date"}
    )
}}

select
    order_id,
    customer_id,
    order_amount,
    order_date
from {{ ref('stg_orders') }}

{% if is_incremental() %}
where order_date >= dateadd(day, -10, current_date())
{% endif %}