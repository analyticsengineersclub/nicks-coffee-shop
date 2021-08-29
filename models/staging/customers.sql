{{ config(materialized='table') }}

select
    customers.id as customer_id,
    customers.name,
    customers.email,
    min(orders.created_at) as first_order_at,
    coalesce(count(distinct orders.id),0) as number_of_orders
from `analytics-engineers-club.coffee_shop.orders` as orders
left outer join `analytics-engineers-club.coffee_shop.customers` as customers on orders.customer_id = customers.id
group by 1,2,3
order by first_order_at