{{ config(materialized='table') }}

select distinct
    user_id,'New' as new
from {{ ref('raw_page_views') }}
where  user_id is not null