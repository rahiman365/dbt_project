
select
    order_id,
    customer_id,
    order_amount,
    cast(order_date as date) as order_date

from {{ source('raw_source', 'raw_orders_new') }}

