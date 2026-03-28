with

    source as (select * from {{ source("raw", "online_retail") }}),

    final as (

        select
            invoice_no,
            stock_code,
            description as description_details,
            sum(quantity) as quantity,
            min(TO_TIMESTAMP(invoice_date,'DD-MM-YYYY HH24:MI')) as invoice_date,
            avg(unit_price) as unit_price,
            sum(quantity * unit_price) as revenue,
            customer_id,
            country

        from source
        group by
                invoice_no,
                description_details,
                stock_code,
                customer_id,
                country

    )

select *
from final
