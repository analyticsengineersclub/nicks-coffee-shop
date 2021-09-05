with src as (
  select * from  {{ source ('coffee_shop', 'product_prices') }}
),

transformed as (
  select
    product_id,
    price as product_price,
    created_at as valid_from,
    ended_at as valid_to
  from src
)

select * from transformed