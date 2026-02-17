SELECT
  order_id,
  user_id,
  status,
  COALESCE(shipped_at,created_at) AS estimated_ship_date, -- Fill Nulls
  EXTRACT(DATE FROM created_at) AS order_date  
FROM `bigquery-public-data.thelook_ecommerce.orders`
WHERE status != 'Cancelled';