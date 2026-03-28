with

source_dim as (select * from {{ ref('stg_products') }}),

base as (
    select
        stock_code as product_id,
        description as productname
    from source_dim
)

select distinct * from base
