{{
    config(
        materialized='ephemeral'
    )
}}

select
    page_view_id,
    user_id,
    lower(trim(page)) as page
from {{ ref('stg_page_views') }}
where page_view_id is not null