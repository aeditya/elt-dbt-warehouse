with

source as (select * from {{ source("raw", "online_retail") }}),

final as (
    select distinct
        stock_code,
        description
    from source
    where stock_code is not null
)

select * from final
