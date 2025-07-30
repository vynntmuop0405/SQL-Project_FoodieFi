--- RECURSION: Referrals

-- Create table
CREATE TABLE Referral_Users (
	User_ID VARCHAR(50),
	User_name VARCHAR(50),
	Referral_ID VARCHAR(50)
);

INSERT INTO Referral_Users VALUES 
(1, 'Alice', NULL),     -- người gốc
(2, 'Bob', 1),          -- do Alice giới thiệu
(3, 'Charlie', 1),      -- do Alice giới thiệu
(4, 'David', 2),        -- do Bob giới thiệu
(5, 'Eve', 2),
(6, 'Frank', 3),
(7, 'Grace', 6);

SELECT * FROM Referral_Users

-- Lấy toàn bộ referral của nhân sự gốc Alice
WITH Referral_hierachy AS (
SELECT user_id, user_name, referral_id, user_id AS root_id
FROM Referral_Users
WHERE user_id = '1'
UNION ALL
SELECT a.User_ID, a.User_name, a.Referral_ID, b.root_id
FROM Referral_Users a
JOIN referral_hierachy b ON a.Referral_ID = b.user_id
)
SELECT * FROM Referral_hierachy

-- Ai giới thiệu ai
SELECT a.user_id, a.user_name, a.referral_id, b.User_name Referrals_name
FROM Referral_Users a
LEFT JOIN (SELECT * FROM Referral_Users) b ON a.Referral_ID = b.User_ID