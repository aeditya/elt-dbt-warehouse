with

source_dim as (select * from {{ ref('stg_products') }}),

base as (
    select
        {{ dbt_utils.generate_surrogate_key(['stock_code']) }} as product_key,
        stock_code as product_id,
        description as productname
    from source_dim
)

select distinct * from base
