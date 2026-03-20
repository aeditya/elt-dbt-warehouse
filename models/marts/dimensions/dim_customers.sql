with

source_dim as (select * from {{ ref('stg_customers') }}),

base as (
    select
        customer_id,
        email,
        phone
    from source_dim
)

select * from base