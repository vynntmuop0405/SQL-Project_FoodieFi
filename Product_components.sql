-- CREATE AND INSERT INTO TABLE PRODUCT_COMPONENTS

CREATE TABLE ProductComponents (
    ParentSKU VARCHAR(50),    -- Bundle cha
    ChildSKU  VARCHAR(50),    -- Thành phần con
    Quantity  INT             -- Số lượng con cần để tạo ra 1 cha
);

INSERT INTO ProductComponents (ParentSKU, ChildSKU, Quantity) VALUES
-- Top-level bundles
('BUNDLE_1', 'BUNDLE_2', 1),
('BUNDLE_1', 'BUNDLE_3', 1),
('BUNDLE_1', 'A', 2),
-- Mid-level bundles
('BUNDLE_2', 'B', 3),
('BUNDLE_2', 'C', 2),
('BUNDLE_3', 'D', 2),
('BUNDLE_3', 'E', 4),
-- Components with their subcomponents
('B', 'F', 2),
('B', 'G', 1),
('C', 'G', 3),
('D', 'H', 2),
('E', 'I', 1),
('E', 'J', 5),
-- Lower-level subcomponents
('F', 'K', 1),
('F', 'L', 2),
('G', 'L', 1),
('H', 'M', 3),
('I', 'M', 1),
('I', 'N', 2),
-- Standalone leaf nodes (end materials)
('L', 'O', 2),
('O', 'P', 1);

-- TÍNH SỐ LƯỢNG SKU Ở MỌI CẤP ĐỘ CON CẦN DÙNG
WITH Product_hierachy AS (
SELECT parent_sku, child_sku, quanity, 1 level,
	   CAST(PARENT_SKU + '>' + CHILD_SKU AS VARCHAR(MAX)) path
FROM product_components
WHERE Parent_sku = 'BUNDLE_1'
UNION ALL
SELECT a.parent_sku, a.child_sku, a.quanity, b.level+1 level,
	   CAST(b.path+ '->' + a.child_sku AS VARCHAR(MAX)) path
FROM Product_components a
JOIN Product_hierachy b ON a.parent_sku = b.child_sku
)
SELECT child_sku, level, SUM(quanity) Total_quanity
FROM Product_hierachy 
GROUP BY child_sku, level
ORDER BY level
