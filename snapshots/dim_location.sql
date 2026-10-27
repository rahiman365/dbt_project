{% snapshot dim_location %}
    {{
        config(
            target_schema='DBT',
            target_database='DBT_NEW',
            unique_key='location_id',
            strategy='timestamp', 
            invalidate_hard_deletes=False,
            updated_at='updated_at'
        )
    }}

    select  
    location_id,
    location_name,
    city,
    state,
    region,
    updated_at from {{ ref('stg_location') }}
 {% endsnapshot %}