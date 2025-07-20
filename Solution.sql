# How many customers has Foodie-Fi ever had?

--# What is the monthly distribution of trial plan start_date values for our dataset - use the start of the month as the group by value

SELECT DATEADD(DAY,1, EOMONTH(start_date,-1)) AS MONTH,
	   COUNT(DISTINCT customer_id) trial_cust_count
FROM subscriptions
WHERE plan_id = '0'
GROUP BY DATEADD(DAY,1, EOMONTH(start_date,-1))
ORDER BY 2 DESC
--	=> March has the highest cust count ò trial plan distribution
