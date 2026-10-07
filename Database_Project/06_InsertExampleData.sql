-- 06_InsertExampleData.sql
-- เพิ่มข้อมูลตัวอย่าง ระบบเช่าอุปกรณ์จัดงาน

USE EventRentalDB;
GO

-- เพิ่มข้อมูลลงในตาราง Customer
INSERT INTO Customer (CustomerID, CustomerName, Phone, Email, Address)
VALUES
(1, N'สมชาย ใจดี', '0811111111', 'somchai@email.com', N'กรุงเทพฯ'),
(2, N'สุภาวดี แสงทอง', '0822222222', 'supawadee@email.com', N'นนทบุรี'),
(3, N'ณัฐพงษ์ มีสุข', '0833333333', 'nattapong@email.com', N'ปทุมธานี'),
(4, N'มณีรัตน์ ทองดี', '0844444444', 'maneerat@email.com', N'สมุทรปราการ'),
(5, N'บริษัท ABC จำกัด', '025555555', 'abc@email.com', N'กรุงเทพฯ');

-- เพิ่มข้อมูลลงในตาราง Equipment
INSERT INTO Equipment (EquipmentID, EquipmentName, Category, StockQty, AvailableQty, RentalPricePerDay, Status)
VALUES
(1, N'ลำโพง JBL', N'เครื่องเสียง', 6, 5, 1500, N'พร้อมใช้งาน'),
(2, N'ไมโครโฟนไร้สาย', N'เครื่องเสียง', 10, 5, 500, N'พร้อมใช้งาน'),
(3, N'ไฟพาร์ LED', N'แสงสว่าง', 20, 17, 300, N'พร้อมใช้งาน'),
(4, N'โปรเจคเตอร์ Full HD', N'ภาพและการนำเสนอ', 4, 2, 1200, N'พร้อมใช้งาน'),
(5, N'ฉาก Backdrop', N'ตกแต่งสถานที่', 5, 2, 1800, N'พร้อมใช้งาน'),
(6, N'โต๊ะ Cocktail', N'เฟอร์นิเจอร์', 30, 20, 250, N'พร้อมใช้งาน');

-- เพิ่มข้อมูลลงในตาราง RentalOrder
INSERT INTO RentalOrder (RentalID, CustomerID, StartDate, DueDate, RentalStatus)
VALUES
(1, 1, '2026-10-10', '2026-10-12', N'คืนครบแล้ว'),
(2, 2, '2026-10-15', '2026-10-16', N'คืนบางส่วน'),
(3, 1, '2026-10-20', '2026-10-21', N'กำลังเช่า'),
(4, 3, '2026-11-01', '2026-11-03', N'กำลังเช่า'),
(5, 4, '2026-11-05', '2026-11-07', N'คืนครบแล้ว'),
(6, 5, '2026-11-10', '2026-11-12', N'กำลังเช่า');

-- เพิ่มข้อมูลลงในตาราง RentalDetail
INSERT INTO RentalDetail (RentalID, EquipmentID, Quantity, UnitPrice)
VALUES
(1, 1, 2, 1500),
(1, 2, 4, 500),
(2, 3, 8, 300),
(2, 4, 1, 1200),
(3, 5, 1, 1800),
(3, 2, 2, 500),
(4, 1, 1, 1500),
(4, 6, 10, 250),
(5, 3, 5, 300),
(5, 6, 8, 250),
(6, 4, 1, 1200),
(6, 5, 2, 1800),
(6, 2, 3, 500);

-- เพิ่มข้อมูลลงในตาราง ReturnRecord
INSERT INTO ReturnRecord (ReturnID, RentalID, ReturnDate)
VALUES
(1, 1, '2026-10-12'),
(2, 2, '2026-10-16'),
(3, 5, '2026-11-07');

-- เพิ่มข้อมูลลงในตาราง ReturnDetail
INSERT INTO ReturnDetail (ReturnID, EquipmentID, ReturnQuantity, EquipmentCondition)
VALUES
(1, 1, 2, N'สภาพดี'),
(1, 2, 4, N'สภาพดี'),
(2, 3, 5, N'สภาพดี'),
(3, 3, 5, N'สภาพดี'),
(3, 6, 8, N'มีรอยเล็กน้อย');

-- ตรวจสอบข้อมูลในแต่ละตาราง
SELECT * FROM Customer;
SELECT * FROM Equipment;
SELECT * FROM RentalOrder;
SELECT * FROM RentalDetail;
SELECT * FROM ReturnRecord;
SELECT * FROM ReturnDetail;
GO
