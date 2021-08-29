with src as (
  select * from {{ ref('customers') }}
),

transformed as (
  select * from src
  where number_of_orders = 0
)

select * from transformed