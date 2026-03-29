SELECT
	customer_id,
	LOWER(TRIM(email)) AS email, -- clean and standarize email
	INITCAP(TRIM(first_name)) AS first_name, -- standarize first name
	INITCAP(TRIM(last_name)) AS last_name, -- standarize last name
	CAST(created_cst AS DATE) AS created_date, --standardize datetime to date
	LOWER(TRIM(country)) AS country, --standarize country
	CASE
	   WHEN date_of_birth > CURRENT_DATE THEN NULL
	   ELSE CAST(date_of_birth AS DATE)
	END AS date_of_birth
	CASE
	   WHEN LOWER(TRIM(gender)) IN ('m', 'male') THEN 'male'
	   WHEN LOWER(TRIM(gender)) IN ('f', 'female') THEN 'female'
	END AS gender,
        REGEEXP_REPLACE(phone_number, '[^0-9]', '') AS phone_number,

FROM raw_customers
WHERE customer_id IS NOT NULL -- validation: ensure essential fields are presente
	AND email IS NOT NULL -- validation
	AND CAST(created_cst AS DATE) <= CURRENT_DATE -- validation
	AND CAST(date_of_birth AS DATE) >= DATEADD(year, -120, CURRENT_DATE))); -- validation
