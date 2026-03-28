with

    source as (select * from {{ source("raw", "online_retail") }}),

    final as (

        select
            invoice_no,
            stock_code,
            description as description_details,
            quantity,
            TO_TIMESTAMP(invoice_date,'DD-MM-YYYY HH24:MI') as invoice_date,
            unit_price,
            customer_id,
            country,
            quantity * unit_price as revenue

        from source

    )

select *
from final
