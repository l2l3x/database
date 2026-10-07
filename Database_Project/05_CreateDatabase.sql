-- 05_CreateDatabase.sql
-- ระบบเช่าอุปกรณ์จัดงาน

IF DB_ID(N'EventRentalDB') IS NOT NULL
BEGIN
    ALTER DATABASE EventRentalDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE EventRentalDB;
END
GO

CREATE DATABASE EventRentalDB;
GO

USE EventRentalDB;
GO

-- สร้างตาราง Customer
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    CustomerName NVARCHAR(100) NOT NULL,
    Phone NVARCHAR(20),
    Email NVARCHAR(100),
    Address NVARCHAR(255)
);

-- สร้างตาราง Equipment
CREATE TABLE Equipment (
    EquipmentID INT PRIMARY KEY,
    EquipmentName NVARCHAR(100) NOT NULL,
    Category NVARCHAR(100),
    StockQty INT NOT NULL,
    AvailableQty INT NOT NULL,
    RentalPricePerDay DECIMAL(10,2) NOT NULL,
    Status NVARCHAR(30)
);

-- สร้างตาราง RentalOrder
CREATE TABLE RentalOrder (
    RentalID INT PRIMARY KEY,
    CustomerID INT NOT NULL REFERENCES Customer(CustomerID),
    StartDate DATE NOT NULL,
    DueDate DATE NOT NULL,
    RentalStatus NVARCHAR(30)
);

-- สร้างตาราง RentalDetail
CREATE TABLE RentalDetail (
    RentalID INT NOT NULL,
    EquipmentID INT NOT NULL,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (RentalID, EquipmentID),
    FOREIGN KEY (RentalID) REFERENCES RentalOrder(RentalID),
    FOREIGN KEY (EquipmentID) REFERENCES Equipment(EquipmentID)
);

-- สร้างตาราง ReturnRecord
CREATE TABLE ReturnRecord (
    ReturnID INT PRIMARY KEY,
    RentalID INT NOT NULL REFERENCES RentalOrder(RentalID),
    ReturnDate DATE NOT NULL
);

-- สร้างตาราง ReturnDetail
CREATE TABLE ReturnDetail (
    ReturnID INT NOT NULL,
    EquipmentID INT NOT NULL,
    ReturnQuantity INT NOT NULL,
    EquipmentCondition NVARCHAR(100),
    PRIMARY KEY (ReturnID, EquipmentID),
    FOREIGN KEY (ReturnID) REFERENCES ReturnRecord(ReturnID),
    FOREIGN KEY (EquipmentID) REFERENCES Equipment(EquipmentID)
);
GO
