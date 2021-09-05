with orders as  (
    select * from {{ ref('stg_orders') }}
),

products as (
    select * from {{ ref('stg_products') }}
),

order_product_lookup as (
    select * from {{ ref('stg_orders__products_ordered') }}
),

prices as (
    select * from {{ ref('stg_products__prices') }}
),

customers as (
    select * from {{ ref('stg_customers') }}
),

transformed as (
    select
        orders.order_id,
        orders.created_at,
        products.product_id,
        products.product_name,
        products.product_category,
        prices.product_price as price_charged,
        orders.customer_id,
        row_number() over (partition by orders.customer_id order by orders.created_at) as customer_order_index
    from orders
    inner join order_product_lookup using (order_id)
    inner join products using (product_id)
    left outer join prices on prices.product_id = products.product_id
        and prices.valid_from >= orders.created_at
        and priced.valid_to <= orders_created_at
),

final as (
    select
        order_id,
        created_at,
        product_id,
        product_name,
        product_category,
        price_charged,
        customer_id,
        case 
            when customer_order_index = 1 then true 
            else false 
        end as is_first_order_by_customer
    from transformed
)

select * from final