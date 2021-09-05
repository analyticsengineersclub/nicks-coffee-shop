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

customer_status as (
    select * from {{ ref('stg_customers__customer_status') }}
),

transformed as (
    select
        null
    from customers
)

select * from transformed
