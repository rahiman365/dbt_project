
select
    order_id,
    customer_id,
    order_amount,
    order_date::date as order_date

from {{ ref('raw_orders') }}
