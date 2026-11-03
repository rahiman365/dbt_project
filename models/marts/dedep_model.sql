
with filtered_pages as (

    select *
    from {{ ref('stg_page_views') }}
    where user_id is not null

),

deduplicated_pages as (

    {{
        dbt_utils.deduplicate(
            relation='filtered_pages',
            partition_by='user_id, page_view_id',
            order_by='viewed_at desc'
        )
    }}

)

select *
from deduplicated_pages
