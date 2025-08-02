-- RECURSION: BANKING

-- Truy vết dòng tiền

CREATE TABLE TransactionS (
	ID VARCHAR (10),
	SENDER VARCHAR(50),
	RECEIVER VARCHAR(50),
	AMOUNT VARCHAR(50),
	TIME DATETIME
);

INSERT INTO Transactions (ID, SENDER, RECEIVER, AMOUNT, TIME) VALUES
(1, 'Alice', 'Bob',     100.00, '2025-07-01 09:00'),
(2, 'Bob',   'Charlie', 100.00, '2025-07-01 10:00'),
(3, 'Charlie', 'David', 100.00, '2025-07-01 11:00'),
(4, 'David', 'Eve',     100.00, '2025-07-01 12:00'),
(5, 'Eve', 'Frank',     100.00, '2025-07-01 13:00'),
(6, 'Frank', 'Alice',   100.00, '2025-07-01 14:00'), -- Vòng về Alice
(7, 'Bob', 'Greg',       50.00, '2025-07-02 09:00'),
(8, 'Greg', 'Helen',     50.00, '2025-07-02 10:00'),
(9, 'Helen', 'Ivy',      50.00, '2025-07-02 11:00');

---
-- Truy vết dòng tiền
WITH trans_hierachy AS (
SELECT id, sender, receiver, amount, time, 1 LEVEL, 
	   CAST(Sender+ '->' +receiver AS VARCHAR(MAX)) AS path
FROM Transactions 
WHERE Sender = 'Alice'
UNION ALL
SELECT a.id, a.sender, a.receiver, a.amount, a.time, b.level+1 LEVEL, 
	   b.Path + '->' + a.Receiver
	   --b.path
FROM transactions a
JOIN trans_hierachy b ON a.sender = b.receiver
WHERE b.Path NOT LIKE '%->' + a.Receiver + '%'
)
SELECT * FROM trans_hierachy