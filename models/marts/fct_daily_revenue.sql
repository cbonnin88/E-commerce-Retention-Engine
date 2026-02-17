SELECT
    date_trunc(created_at,DAY) AS date,
    COUNT(DISTINCT order_id) AS daily_orders,
    SUM(sale_price) AS revenue
FROM {{source('thelook_ecommerce','order_items')}}
GROUP BY 1