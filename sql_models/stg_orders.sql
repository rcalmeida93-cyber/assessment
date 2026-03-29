SELECT
	order_id,
	customer_id,
	product_id,
	CAST(order_date AS DATE) AS order_date, --standardize
	CASE
	   WHEN amount <0 THEN NULL
	   ELSE amount
	END AS amount,
	LOWER(TRIM(order_type)) AS order_type, --standardize,
	CASE
	   WHEN LOWER(TRIM(status)) IN ('paid', 'completed') THEN 'completed' -- standarize
	   WHEN LOWER(TRIM(status)) IN ('failed', 'cancelled') THEN 'failed' -- standarize
	   ELSE 'unknown'
	END AS order_status,
	currency
FROM raw_orders
WHERE order_id IS NOT NULL --validation
 AND customer id IS NOT NULL --validation
 AND amount >= 0  --validation
 AND order_date <= CURRENT_DATE; -- validation
