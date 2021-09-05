{{ config(materialized='table') }}

with customers as (
  select * from  {{ source ('customers', 'customers') }}
),

transformed as (
  select
     customers.id as customer_id,
     customers.name as customer_name,
     customers.email as customer_email
  from customers
)

select * from transformed
