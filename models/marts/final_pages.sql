select
    {{ dbt_utils.generate_surrogate_key(['user_id']) }} as user_page_key,
    user_id,
    page
from {{ ref('stg_page_views') }}