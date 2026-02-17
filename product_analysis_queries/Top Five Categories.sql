-- Top 5 Categories with Above-Average Returns

SELECT
  p.category,
  COUNT(CASE WHEN oi.status='Returned' THEN 1 END) / COUNT(*) AS return_rate
FROM `bigquery-public-data.thelook_ecommerce.order_items` AS oi
JOIN `bigquery-public-data.thelook_ecommerce.products` AS p
  ON oi.product_id = p.id
GROUP BY
  1
HAVING return_rate > (
  SELECT COUNT(CASE WHEN status='Returned' THEN 1 END) / COUNT(*)
  FROM `bigquery-public-data.thelook_ecommerce.order_items` 
)
ORDER BY
  return_rate DESC
LIMIT 5;