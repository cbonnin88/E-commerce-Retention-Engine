-- Tracking Growth throughout the year

SELECT
  date,
  daily_revenue,
  SUM(daily_revenue)
    OVER (ORDER BY date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
    AS running_total
FROM
  (
    SELECT DATE(created_at) AS date, ROUND(SUM(sale_price), 2) AS daily_revenue
    FROM `bigquery-public-data.thelook_ecommerce.order_items`
    WHERE status = 'Complete'
    GROUP BY 1
  )
ORDER BY date;
