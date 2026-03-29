SELECT 
	subscription_id,
	customer_id,
	product_id,
	LOWER(TRIM(plan_name)) AS plan_name,
	CASE
	    WHEN monthly_price <0 THEN NULL
	    ELSE monthly_price
	END AS monthly price,
	CAST (start_date AS DATE) AS start_date, -- standarize
	CAST (end_date AS DATE) AS end_date, -- standarize
	CASE
	   WHEN LOWER(TRIM(status)) IN ('active', 'trial') THEN 'active' -- standarize
	   WHEN LOWER(TRIM(status)) IN ('cancelled', 'expired') THEN 'inactive' -- standarize
	   ELSE 'unknown'
	END AS subscription_status,
	FROM raw_subsciptions
	WHERE subscription_id IS NOT NULL -- validation
	  AND customer_id IS NOT NULL -- validation
	  AND start date <= CURRENT_DATE; -- validation
