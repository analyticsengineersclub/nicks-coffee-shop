with src as (
  select * from {{ ref('customers') }}
)

select * from src
where number_of_orders = 0