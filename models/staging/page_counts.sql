{{ config(materialized='table') }}

select page, count(*) as views
from {{ ref('eph_clean_page_views') }}
group by page