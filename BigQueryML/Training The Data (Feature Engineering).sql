CREATE OR REPLACE TABLE `poetic-maxim-486609-e5.dbt_thelook.churn_training_data` AS
WITH user_behavior AS (
  SELECT
    user_id,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(sale_price) AS total_spend,
    AVG(sale_price) AS avg_order_value,
    MAX(created_at) AS last_purchase_date
  FROM `bigquery-public-data.thelook_ecommerce.order_items` 
  GROUP BY 1
),
user_profiles AS (
  SELECT
    id AS user_id,
    age,
    gender,
    country,
    traffic_source,
    created_at AS account_created_at
  FROM `bigquery-public-data.thelook_ecommerce.users`
)
SELECT
  b.*,
  p.age,
  p.gender,
  p.country,
  p.traffic_source,
  -- FEATURE ENGINEERING: Days since last purchase
  DATE_DIFF(CURRENT_DATE(),EXTRACT(DATE FROM b.last_purchase_date), DAY) AS recency,
  -- THE TARGET (LABEL): 1 if churned (no purchase in 60 days),  0 if active
  CASE
    WHEN DATE_DIFF(CURRENT_DATE(),EXTRACT(DATE FROM b.last_purchase_date),DAY) > 60 THEN 1
    ELSE 0
  END AS has_churned
FROM user_behavior AS b
JOIN user_profiles AS p
  ON b.user_id = p.user_id;
