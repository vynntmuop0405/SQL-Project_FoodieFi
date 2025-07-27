  -- # Calculate customer with curent plan from date
  -- they first start their plan untill today (27/7/2025)

-- First we will need update data in Table plans 
-- Table plans original doesn't have duration.

ALTER TABLE plans ADD duration INT -- Add column duration

UPDATE plans -- Add values
SET duration = CASE
WHEN plan_name = 'trial' THEN 7
WHEN plan_name = 'basic monthly' THEN 30
WHEN plan_name = 'pro monthly' THEN 30
WHEN plan_name = 'pro annual' THEN 365
WHEN plan_name = 'churn' THEN NULL
	 ELSE NULL
END