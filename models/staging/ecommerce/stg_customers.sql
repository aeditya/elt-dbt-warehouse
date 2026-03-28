with 

source as (

    select * from {{ source('raw', 'customers_raw') }}

),

final as (

    select
        customer_id,
        email,
        phone

    from source

)

select * from final