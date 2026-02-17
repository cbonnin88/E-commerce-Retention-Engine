SELECT
    date_trunc(created_at,DAY) AS date,
    COUNT(DISTINCT order_id) AS daily_orders,
    SUM(sale_price) AS revenue
FROM {{ref('stg_orders')}}
GROUP BY 1