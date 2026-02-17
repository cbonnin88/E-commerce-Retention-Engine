WITH orders_cleaned AS (
    SELECT
        order_id,
        user_id,
        created_at,
        status
    FROM {{ref('stg_orders')}}
)
SELECT
    *,
    -- Using a Window Function to sequence orders by user
    ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY created_at) AS user_order_number,
    -- Calculate the time gap since the previous order
    LAG(created_at) OVER(PARTITION BY user_id ORDER BY created_at) AS previous_order_timestamp,
    -- Create a flag for Repeat Purchases
    CASE
        WHEN ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY created_at) > 1 THEN 1
        ELSE 0
    END AS is_repeat_purchase
FROM orders_cleaned