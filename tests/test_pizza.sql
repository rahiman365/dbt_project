select * from
{{ ref('pizza_sales_stg') }}
where revenue < 0