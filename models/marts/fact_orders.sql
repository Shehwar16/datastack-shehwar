select
    o.order_id,
    o.customer_id,
    oi.product_id,
    oi.seller_id,

    o.order_status,
    o.order_purchase_timestamp,

    p.payment_type,
    p.payment_value,

    oi.price,
    oi.freight_value

from {{ ref('stg_orders') }} o

left join {{ ref('stg_order_items') }} oi
    on o.order_id = oi.order_id

left join {{ ref('stg_payments') }} p
    on o.order_id = p.order_id