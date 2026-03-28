{{ config(
    materialized = 'incremental',
    unique_key='invoice_no || product_id'
)}}

with

source_stg as (select * from  {{ ref('stg_orders')    }}),
dim_cus    as (select * from  {{ ref('dim_customers') }}),
dim_prd    as (select * from {{ ref('dim_products')   }}),

base_ft as (
    select
        o.invoice_no,
        o.invoice_date,
        
        c.customer_key,
        p.product_key,
        
        o.quantity,
        o.unit_price,
        o.revenue,
        o.country
    
    from source_stg o 

    left join dim_cus c 
        on o.customer_id = c.customer_id
    left join dim_products p
        on o.stock_code = p.product_id
    
    {% if is_incremental() %}

    where invoice_date > (select max(invoice_date) from {{this}} )

    {% endif %}
)

select * from base_ft
