with customers as (
    select * from {{ ref('stg_customers') }}
),

orders as (
    select * from {{ ref('stg_orders') }}
),

transformed as (
    select
        customers.customer_id,
        case when orders.customer_id is not null then true else false end as has_placed_order,
        coalesce( count(order_id), 0) as num_orders
    from customers
    left outer join orders using (customer_id)
    group by 1,2
)

select * from transformed