select
*, 'DEPT' as DEPT,
'FAIL' as Result3
from {{ ref('raw_sales') }}