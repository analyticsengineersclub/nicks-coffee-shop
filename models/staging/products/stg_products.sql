with src as (
  select * from  {{ source ('coffee_shop', 'products') }}
),

transformed as (
  select
    id as product_id,
    name as product_name,
    category as product_category,
    created_at
  from src
)

select * from transformed