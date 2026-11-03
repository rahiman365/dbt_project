select 
customer_id,customer_name,email,city,updated_at,
gender,
 {{  gender_desc('gender')}} as GENDER_DES,
 {{etl_columns()}}  
from {{ ref('customer_gen') }}