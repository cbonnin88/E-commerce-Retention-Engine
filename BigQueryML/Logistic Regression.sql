-- Training the model using Logistic Regression

CREATE OR REPLACE MODEL `poetic-maxim-486609-e5.dbt_thelook.churn_model`
OPTIONS(
  model_type='logistic_reg',
  input_label_cols=['has_churned']) AS
SELECT * EXCEPT(user_id,last_purchase_date)
FROM `poetic-maxim-486609-e5.dbt_thelook.churn_training_data`