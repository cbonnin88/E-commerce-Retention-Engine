-- How many users who bought in Month A also bought in Month B ?

WITH
  monthly_users AS (
    SELECT DISTINCT
      user_id, DATE_TRUNC(CAST(created_at AS DATE), MONTH) AS month
    FROM `bigquery-public-data.thelook_ecommerce.orders`
  )
SELECT
  this_month.month,
  COUNT(DISTINCT this_month.user_id) AS active_users,
  COUNT(DISTINCT last_month.user_id) AS retained_users,
  ROUND(
    COUNT(DISTINCT last_month.user_id) / COUNT(DISTINCT this_month.user_id), 4)
    AS retention_rate
FROM monthly_users AS this_month
LEFT JOIN monthly_users AS last_month
  ON
    this_month.user_id = last_month.user_id
    AND DATE_ADD(last_month.month, INTERVAL 1 MONTH) = this_month.month
GROUP BY 1
ORDER BY 1;
