-- Data Preparation for Google Sheets

SELECT
  order_id,
  user_id,
  status,
  created_at,
  ROUND(sale_price,2) AS sale_price,
  FORMAT_DATE('%Y-%m',created_at) AS month_yr,
  EXTRACT(DAYOFWEEK FROM created_at) AS day_of_week
FROM `bigquery-public-data.thelook_ecommerce.order_items`
WHERE status NOT IN ('Cancelled','Returned')