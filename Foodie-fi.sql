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

---- LISTTING CUSTOMER SUBSCRIPTION IN YEAR 2020
---- THEN TÍNH TỔNG DOANH SỐ TRONG NĂM 2020 CỦA CÁC KHÁCH ĐÃ ĐĂNG KÍ SUBSCRIPTIONS
WITH 
total_sub AS (
SELECT a.customer_id, a.plan_id, b.plan_name, a.start_date,
	   LEAD(a.start_date,1,'2020-12-31') OVER(PARTITION BY a.customer_id ORDER BY a.start_date, a.plan_id) next_date,
	   b.price
	   ---- Chỗ này em search thì hàm LEAD sau số 1 (ngày kế tiếp) sẽ là 1 số default thì mình sẽ đặt là 31/12, phải ý anh vậy ko.
FROM subscriptions a
JOIN plans b ON a.plan_id = b.plan_id
WHERE a.start_date <= '2020-12-31'
	  AND plan_name NOT IN ('trial','churn')
),
sub_hierachy AS (
SELECT customer_id, plan_id, plan_name, start_date, next_date, price
FROM total_sub --ORDER BY customer_id
UNION ALL
SELECT customer_id, plan_id, plan_name, 
	  DATEADD(month,1,start_date) start_date, next_date, price
FROM sub_hierachy
WHERE next_date > DATEADD(month,1,start_date)
	  AND plan_name <> 'pro annual'
)
SELECT * FROM sub_hierachy ORDER BY customer_id