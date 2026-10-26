{{
    config(
        materialized='incremental',
        unique_key='sale_date',
        incremental_strategy = 'delete+insert',
        on_schme
        query_tag = 'FROM DBT FACT'

    )
}}

select
*
from {{ ref('stg_sales') }}

