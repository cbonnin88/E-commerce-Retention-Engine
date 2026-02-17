-- Cart Abandonment Rate

SELECT
  COUNT(DISTINCT CASE WHEN event_type = 'cart' THEN session_id END) AS cart_sessions,
  COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN session_id END) AS purchase_sessions,
  1 - (COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN session_id END) /
       COUNT(DISTINCT CASE WHEN event_type = 'cart' THEN session_id END)) AS abandonment_rate
FROM `bigquery-public-data.thelook_ecommerce.events`; 