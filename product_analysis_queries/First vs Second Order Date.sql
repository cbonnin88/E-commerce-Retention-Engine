-- How long does it take for a user to 'stick'

SELECT
  user_id,
  order_id,
  created_at,
  LAG(created_at) OVER(PARTITION BY user_id ORDER BY created_at) AS previous_order_date,
  DATE_DIFF(created_at, LAG(created_at) OVER(PARTITION BY user_id ORDER BY created_at),DAY) AS days_between_orders
FROM `bigquery-public-data.thelook_ecommerce.orders`
ORDER BY
  user_id,
  created_at;
