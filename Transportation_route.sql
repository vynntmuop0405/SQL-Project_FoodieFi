-- CREATE AND INSERT DATA INTO TABLE Transportation
--
CREATE TABLE Transportation_route (
	order_id VARCHAR(50),
	from_location VARCHAR(50),
	to_location VARCHAR(50),
	step_no INT
);
--
INSERT INTO Transportation_route VALUES 
-- Đơn hàng ORD001
('ORD001', 'Warehouse_HCM', 'Depot_LongAn', 1),
('ORD001', 'Depot_LongAn', 'Hub_TienGiang', 2),
('ORD001', 'Hub_TienGiang', 'DropPoint_MyTho', 3),
-- Đơn hàng ORD002
('ORD002', 'Warehouse_HCM', 'Depot_BinhDuong', 1),
('ORD002', 'Depot_BinhDuong', 'Hub_ThuDauMot', 2),
('ORD002', 'Hub_ThuDauMot', 'DropPoint_DaiNam', 3),
-- Đơn hàng ORD003 – đi thẳng
('ORD003', 'Warehouse_HCM', 'DropPoint_CuChi', 1);