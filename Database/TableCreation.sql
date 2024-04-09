create database rms;

use rms;

CREATE TABLE Employee (
  EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
  Name VARCHAR(255) NOT NULL,
  PhoneNo VARCHAR(20),
  DateOfJoining DATE NOT NULL
);


CREATE TABLE CustomerPhone (
  CustomerPhoneID INT PRIMARY KEY AUTO_INCREMENT,
  CustomerID INT NOT NULL,
  PhoneType VARCHAR(255) NOT NULL,
  PhoneNumber VARCHAR(20) NOT NULL,
  CONSTRAINT fk_customerphone_customer FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);


CREATE TABLE Customer (
  CustomerID INT PRIMARY KEY AUTO_INCREMENT,
  Name VARCHAR(255) NOT NULL,
  Email VARCHAR(255) UNIQUE,
  CONSTRAINT fk_customer_phone FOREIGN KEY (CustomerID) REFERENCES CustomerPhone(CustomerID)
);


CREATE TABLE Reservation (
  ReservationID INT PRIMARY KEY AUTO_INCREMENT,
  CustomerID INT NOT NULL,
  NoOfGuests INT NOT NULL,
  DateTime DATETIME NOT NULL,
  CONSTRAINT fk_reservation_customer FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);


CREATE TABLE Order (
  OrderID INT PRIMARY KEY AUTO_INCREMENT,
  ReservationID INT UNIQUE,
  TableNo INT,
  OrderStatusID INT NOT NULL,
  OrderDateTime DATETIME NOT NULL,
  TotalAmount DECIMAL(10,2) NOT NULL,
  PaymentStatus VARCHAR(255) NOT NULL,
  CONSTRAINT fk_order_reservation FOREIGN KEY (ReservationID) REFERENCES Reservation(ReservationID),
  CONSTRAINT fk_order_customer FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)  -- Assuming a customer can have multiple orders, add this foreign key
);


CREATE TABLE Menu_Item (
  ItemID INT PRIMARY KEY AUTO_INCREMENT,
  ItemName VARCHAR(255) NOT NULL,
  Category VARCHAR(255) NOT NULL
);


CREATE TABLE Order_Contains_Menu_Item (
  OrderID INT NOT NULL,
  ItemID INT NOT NULL,
  Quantity INT NOT NULL,
  PRIMARY KEY (OrderID, ItemID),
  CONSTRAINT fk_ocmi_order FOREIGN KEY (OrderID) REFERENCES Order(OrderID),
  CONSTRAINT fk_ocmi_menu_item FOREIGN KEY (ItemID) REFERENCES Menu_Item(ItemID)
);


CREATE TABLE ParkingSlot (
  SlotNo INT PRIMARY KEY AUTO_INCREMENT
);


CREATE TABLE Parking (
  ParkingID INT PRIMARY KEY AUTO_INCREMENT,
  CustomerID INT NOT NULL,
  VehicleNo VARCHAR(255) NOT NULL,
  SlotNo INT NOT NULL,
  StartTimeDate DATETIME NOT NULL,
  EndTimeDate DATETIME,
  CONSTRAINT fk_parking_customer FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
  CONSTRAINT fk_parking_slot FOREIGN KEY (SlotNo) REFERENCES ParkingSlot(SlotNo)
);


