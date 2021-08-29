{{ config(materialized='table') }}

with customers as (
	select * from  {{ source ('coffee_shop', 'customers') }}
),

orders as (
	select * from {{source ('coffee_shop', 'orders') }},
),

transformed as

select
    customers.id as customer_id,
    customers.name,
    customers.email,
    min(orders.created_at) as first_order_at,
    coalesce(count(distinct orders.id),0) as number_of_orders
from customers
left outer join orders on customers.id = orders.customer.id
group by 1,2,3
)

select * from transformed
