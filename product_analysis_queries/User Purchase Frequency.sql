-- User Purchase Frequency

WITH user_order AS (
  SELECT
    user_id,
    COUNT(order_id) AS order_count
  FROM `bigquery-public-data.thelook_ecommerce.orders`
  GROUP BY
    1
)
SELECT
  CASE WHEN order_count = 1 THEN 'One-time Buyer'
       WHEN order_count = 2 THEN 'Repeat Buyer'
       ELSE 'Power User'
  END AS user_segment,
  COUNT(*) AS user_count
FROM user_order
GROUP BY
  1
ORDER BY
  user_count DESC;