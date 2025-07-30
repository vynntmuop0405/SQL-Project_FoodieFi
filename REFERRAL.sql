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