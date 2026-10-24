{{
    config(
        materialized='incremental',
        unique_key='order_id',
        incremental_strategy = 'append'
    )
}}

select
    order_id,
    customer_id,
    order_amount,
    order_date
from {{ ref('stg_orders') }}

{% if is_incremental() %}
    -- this filter will only be applied on an incremental run
    where order_date > (select max(order_date) from {{ this }}) 
{% endif %}