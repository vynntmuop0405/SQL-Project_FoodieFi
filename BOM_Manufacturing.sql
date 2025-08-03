--- BOM MANUFACTURING
--
--CREATE AND INSERT DATA INTO TABLE BOM

CREATE TABLE BOM (
	Parent_sku VARCHAR(50),
	Child_sku VARCHAR(50),
	Quanity VARCHAR(50)
);
--
INSERT INTO BOM VALUES
-- Level 1
('A', 'B1', 2),
('A', 'B2', 3),
('A', 'B3', 1),
-- Level 2
('B1', 'C1', 2),
('B1', 'C2', 4),
('B2', 'C3', 1),
('B2', 'C4', 2),
('B3', 'C5', 3),
-- Level 3
('C1', 'D1', 2),
('C2', 'D2', 1),
('C3', 'D3', 5),
('C4', 'D4', 3),
('C4', 'D5', 2),
('C5', 'D6', 4),
-- Level 4
('D1', 'E1', 2),
('D3', 'E2', 1),
('D4', 'E3', 2),
('D5', 'E4', 1),
('D6', 'E5', 2),
-- More branches
('B3', 'C6', 1),
('C6', 'D7', 2),
('D7', 'E6', 1),
('E6', 'F1', 3),
('F1', 'G1', 2),
-- Unrelated branches for testing
('Z1', 'Z2', 1),
('Z2', 'Z3', 1),
('Z3', 'Z4', 1),
('Z4', 'Z5', 1),
('Z5', 'Z6', 1);