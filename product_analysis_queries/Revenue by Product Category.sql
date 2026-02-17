-- Revenue by Product Category

SELECT
  p.category,
  COUNT(oi.id) AS units_sold,
  ROUND(SUM(oi.sale_price),2) AS category_revenue
FROM `bigquery-public-data.thelook_ecommerce.order_items` AS oi
INNER JOIN `bigquery-public-data.thelook_ecommerce.products` AS p
  ON oi.product_id = p.id
WHERE oi.status = 'Complete'
GROUP BY 
  1
ORDER BY
  3 DESC;