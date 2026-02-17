WITH user_metrics AS (
    SELECT
        DATE_TRUNC(create_at, MONTH) AS order_month,
        COUNT(DISTINCT user_id) AS total_monthly_customers,
        SUM(is_repeat_purchase) AS repeat_customers
    FROM {{ref('int_user_order_sequencing')}}
    GROUP BY 1
)
SELECT
    order_month,
    total_monthly_customers,
    repeat_customers,
    -- The core KPI: Repeat Purchase Rate
    ROUND(SAFE_DIVIDE(repeat_customers,total_monthly_customers)* 100,2) AS repeat_purchase_rate_pct
FROM user_metrics
ORDER BY
    1 DESC;