SELECT 
	o.order_id,
	o.customer_id,
	o.product_id,
	o.order_date,
	o.currency,
	c.country, --customer enrichment
	CASE --standardize revenue logic
	   WHEN o.order_status = 'completed'THEN o.amount
	   ELSE 0
	END AS revenue amount,
FROM stg_orders o
LEFT JOIN stg_customers c
     ON o.customer_id = c.customer_id
