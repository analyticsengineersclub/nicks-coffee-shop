with src as (
  select * from  {{ source ('coffee_shop', 'customers') }}
),

transformed as (
  select
    customers.id as customer_id,
    customers.name as customer_name,
    customers.email as customer_email
  from src
)

select * from transformed