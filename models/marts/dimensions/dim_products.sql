with

source_dim as (select * from {{ ref('stg_products') }}),

base as (
    select
        {{ dbt_utils.generate_surrogate_key(['stock_code']) }} as product_key,
        stock_code as product_id,
        max(description) as productname
    from source_dim
    group by stock_code
)

select distinct * from base
