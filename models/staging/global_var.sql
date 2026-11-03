select
    page_view_id,
    session_id,
    user_id,
    page,
    cast(viewed_at as timestamp) as viewed_at
from {{ ref('raw_page_views') }}
where page = '{{ var("page_name") }}'