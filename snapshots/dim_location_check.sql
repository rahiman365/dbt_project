
{% snapshot dim_location_check %}

    {{
        config(
            target_schema='DBT',
            target_database='DBT_NEW',
            unique_key='location_id',
            strategy='check',
            check_cols=[
                'location_name',
                'city',
                'state',
                'region'
            ],
            invalidate_hard_deletes=False
        )
    }}

    SELECT
        location_id,
        location_name,
        city,
        state,
        region,
        updated_at
    FROM {{ ref('stg_location') }}

{% endsnapshot %}
