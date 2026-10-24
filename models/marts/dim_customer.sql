{{
    config(
        materialized='incremental',
        unique_key = 'customer_id',
        incremental_strategy = 'merge'
    )
}}

SELECT 
CUSTOMER_ID, 
CUSTOMER_NAME , 
EMAIL, 
CITY, 
UPDATED_AT
FROM {{ ref('stg_customer') }}



{% if is_incremental() %}
    -- this filter will only be applied on an incremental run
    where UPDATED_AT > (select max(UPDATED_AT) from {{ this }}) 
{% endif %}