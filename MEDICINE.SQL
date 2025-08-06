-- CREATE AND INSERT INTO TABLES
--
CREATE TABLE MED_CATEGORY (
CATEGORY_ID VARCHAR(50),
CATEGORY_NAME VARCHAR(50),
PARENT_ID VARCHAR(50)
);

CREATE TABLE MEDICINE (
MEDICINE_ID VARCHAR(50),
MEDICINE_NAME VARCHAR(50),
CATEGORY_ID VARCHAR(50)
);
-----
INSERT INTO MED_CATEGORY (category_id, category_name, parent_id) VALUES
(1, 'Ho hap cap', NULL),
(2, 'Thuoc ho', 1),
(3, 'Thuoc cam', 1),
(4, 'Thuoc di ung', 3),
(5, 'Tieu hoa', NULL),
(6, 'Thuoc dau bung', 5);

-- Dữ liệu thuốc
INSERT INTO Medicine (medicine_id, medicine_name, category_id) VALUES
('M001', 'Terpin Codein', 2),
('M002', 'Decolgen', 3),
('M003', 'Loratadin', 4),
('M004', 'Paracetamol', 3),
('M005', 'Smecta', 6),
('M006', 'Berberin', 6),
('M007', 'Eugica', 2),
('M008', 'Panadol', 3);

--Viết truy vấn để liệt kê tất cả thuốc con nằm trong danh mục điều trị "Hô hấp cấp" của Pharmacity
WITH MED_HIERACHY AS (
SELECT category_id, category_name, parent_id, 0 level
FROM MED_CATEGORY
WHERE category_name = 'Ho hap cap'
UNION ALL
SELECT a.category_id, a.category_name, a.parent_id, b.level+1 LEVEL
FROM MED_CATEGORY a
JOIN med_hierachy b ON a.parent_id = b.category_id
)
SELECT a.medicine_id, a.medicine_name, a.category_id, b.category_name
FROM MEDICINE a
JOIN MED_HIERACHY b ON a.CATEGORY_ID=b.CATEGORY_ID


