{{ config(
    materialized='incremental',
    incremental_strategy='microbatch',
    event_time='view_date',
    batch_size='day',
    begin='2026-10-24',
    lookback=1
) }}

select
    cast(date_trunc('day', viewed_at) as timestamp) as view_date,
    user_id,
    count(*) as page_views
from {{ ref('stg_page_views') }}
group by 1, 2