select
    location_id,
    trim(location_name) as location_name,
    city,
    state,
    region,
    updated_at
from {{ ref('raw_location') }}