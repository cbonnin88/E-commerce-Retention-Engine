-- Determine if users brow a lot before buying (Intent Analysis)

WITH user_sessions AS (
  SELECT 
    user_id,
    COUNT(DISTINCT session_id) AS total_sessions
  FROM `bigquery-public-data.thelook_ecommerce.events`
  WHERE user_id IS NOT NULL
  GROUP BY
    1
)
SELECT
  total_sessions,
  COUNT(user_id) AS user_count
FROM user_sessions
WHERE total_sessions < 20
GROUP BY
  1
ORDER BY
  1;