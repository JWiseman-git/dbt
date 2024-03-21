with orders as (

    select
        orderid as order_id,
        id as customer_id,
        paymentmethod as payment_method,
        status,
        amount / 100 as amount,
        created as created_at

    from {{ source('stripe', 'payment') }}

) select * from orders