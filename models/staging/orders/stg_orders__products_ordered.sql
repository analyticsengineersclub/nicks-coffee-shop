with src as (
  select * from  {{ source ('coffee_shop', 'order_items') }}
),

transformed as (
  select
    order_id,
    product_id
  from src
)

select * from transformed