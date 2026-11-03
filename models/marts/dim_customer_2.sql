{{ config(
    materialized='dynamic_table',
    snowflake_warehouse='DBT_WH',
    target_lag='1 hour',
    on_configuration_change='apply'
) }}

SELECT 
CUSTOMER_ID, 
CUSTOMER_NAME , 
EMAIL, 
CITY, 
UPDATED_AT
FROM {{ ref('stg_customer') }}

