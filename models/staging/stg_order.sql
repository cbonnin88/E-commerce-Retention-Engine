SELECT
    order_id,
    user_id,
    status,
    created_at,
    returned_at,
    shipped_at
FROM {{source('thelook_ecommerce','orders')}}
WHERE status != 'Cancelled'