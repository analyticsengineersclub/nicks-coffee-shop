with src as (
  select * from  {{ source ('coffee_shop', 'orders') }}
),

transformed as (
  select
    id as as order_id,
    customer_id,
    created_at,
  from src
)

select * from transformed