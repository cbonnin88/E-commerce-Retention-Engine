-- Average Order Value

SELECT
  EXTRACT(MONTH FROM created_at) AS month,
  COUNT(DISTINCT order_id) AS total_orders,
  ROUND(SUM(sale_price),2) AS total_revenue
FROM `bigquery-public-data.thelook_ecommerce.order_items`
GROUP BY 
  1
HAVING total_orders > 10
ORDER BY
  1;