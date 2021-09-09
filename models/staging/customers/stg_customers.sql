with src as (
  select * from  {{ source ('coffee_shop', 'customers') }}
),

transformed as (
  select
    id as customer_id,
    name as customer_name,
    email as customer_email
  from src
)

select * from transformed