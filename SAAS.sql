--- RECURSION: SAAS - Software as a service

-- 1. Cấu trúc tổ chức người dùng
CREATE TABLE USERS (
	USER_ID VARCHAR(50),
	USER_NAME VARCHAR(50),
	MANAGER_ID VARCHAR(50)
);
INSERT INTO USERS (USER_ID, USER_NAME, MANAGER_ID) VALUES 
(1, 'CEO',        NULL),      -- CEO không có cấp trên
(2, 'Manager A',  1),
(3, 'Manager B',  1),
(4, 'Lead A1',    2),
(5, 'Lead A2',    2),
(6, 'Staff A1.1', 4),
(7, 'Staff A2.1', 5),
(8, 'Lead B1',    3),
(9, 'Staff B1.1', 8),
(10,'Intern B1.1.1', 9)
;

-- LEVEL TRONG 1 TỔ CHỨC 

WITH users_hierachy AS (
SELECT user_id, user_name, manager_id, 0 LEVEL
FROM users WHERE manager_id IS NULL
UNION ALL
SELECT a.user_id, a.user_name, a.manager_id, b.LEVEL+1 LEVEL 
FROM users a 
JOIN users_hierachy b ON a.MANAGER_ID = b.user_id
)
SELECT * FROM users_hierachy

-- TÌM AI LÀ CẤP TRÊN CỦA AI

With Subordinates AS (
SELECT user_id, user_name, manager_id 
FROM users WHERE manager_id = 3
UNION ALL
SELECT a.user_id, a.user_name, a.manager_id
FROM users a
JOIN Subordinates b on a.user_id = b.manager_id
)
SELECT * FROM Subordinates
