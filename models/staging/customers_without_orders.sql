with src as (
  select * from dbt_ref{{ ref('customers') }}
)

select * from src
where number_of_orders = 0
