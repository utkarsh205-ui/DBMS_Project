-- CREATE SCHEMA STORE;
-- USE STORE;
drop database if EXISTS temp1;
DROP database IF  EXISTS temp1;
create database temp1;
Use temp1;

DROP TABLE IF EXISTS Customer;
CREATE TABLE Customer (
  cust_id int NOT NULL AUTO_INCREMENT,
  email_id varchar(60) NOT NULL,
  Name varchar(20) NOT NULL,
  Ph_no varchar(10) NOT NULL,
  Cust_pass varchar(60) NOT NULL,
  Address varchar(200) NOT NULL,
  PRIMARY KEY (cust_id),
  UNIQUE KEY cust_id_Unique (cust_id)
) ;






DROP TABLE IF EXISTS Category_Description;
CREATE TABLE Category_Description (
  Category_ID int NOT NULL AUTO_INCREMENT,
  Main_Category varchar(60) NOT NULL,
  Sub_Category varchar(60) NOT NULL,
  Description varchar(60) NOT NULL,
  PRIMARY KEY (Category_ID)
);


drop table if exists Item;
CREATE TABLE Item (
  Item_id int NOT NULL AUTO_INCREMENT,
  Item_name varchar(60) NOT NULL,
  stock INT NOT NULL default 0,
  Item_price int NOT NULL,
  category_id int NOT NULL,
  PRIMARY KEY (Item_id),
  Foreign KEY (category_id) references Category_Description(Category_ID),
  UNIQUE KEY Item_id_Unique (Item_id)
) ;


DROP TABLE IF EXISTS Vendor;
CREATE TABLE Vendor (
    Vendor_ID int NOT NULL AUTO_INCREMENT,
    Name varchar(60) NOT NULL,
    E_Mail varchar(60) NOT NULL,
    Verified bool NOT NULL,
    Phone varchar(15) NOT NULL,
    Passwd varchar(20) NoT NULL,
    item_id int NOT NULL,
    PRIMARY KEY (Vendor_ID),
    Foreign KEY (item_id) references Item(Item_id)
);


DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
  Order_ID int NOT NULL AUTO_INCREMENT,
  Vendor_ID varchar(60) NOT NULL,
  Total_Pieces int unsigned NOT NULL,
  Total_Price int unsigned NOT NULL DEFAULT '0',
  description varchar(60),
  customer_id INT not null,
  item_id INT not null,
  Foreign KEY (customer_id) references Customer(cust_id),
  Foreign KEY (item_id) references Item(Item_id),
  PRIMARY KEY (Order_ID),
  UNIQUE KEY Vendor_ID_Unique (Vendor_ID)
) ;


DROP TABLE IF EXISTS Delivery_Description;
CREATE TABLE Delivery_Description (
  Delivery_ID int NOT NULL AUTO_INCREMENT,
  Name_Of_Receiver varchar(60) NOT NULL,
  Mobile_No_of_Receiver varchar(10) NOT NULL,
  Total_Price int unsigned NOT NULL DEFAULT 0,
  Vehicle_No varchar(60) NOT NULL,
  Description varchar(60) NOT NULL,
  Ratings tinyint unsigned NOT NULL,
  order_id INT,
  Foreign KEY (order_id) references orders(order_id),
  PRIMARY KEY (Delivery_ID)
);
ALTER TABLE Delivery_Description ADD CONSTRAINT Ratings_Check CHECK (Ratings >= 1 AND Ratings <= 5);


DROP TABLE IF EXISTS Admin;
CREATE TABLE Admin (
  Admin_id int NOT NULL AUTO_INCREMENT,
  Mail varchar(60) NOT NULL,
  Ph_no varchar(10) NOT NULL,
  Pass varchar(60) NOT NULL,
  customer_id INT not null,
  vendor_id INT not null,
  item_id INT not null,
  PRIMARY KEY (Admin_id),
  UNIQUE KEY Admin_id_Unique (Admin_id),
  Foreign KEY (customer_id) references Customer(cust_id),
  Foreign KEY (vendor_id) references Vendor(Vendor_ID),
  Foreign KEY (item_id) references Item(Item_id)
) ;






INSERT INTO Customer (email_id, Name, Ph_no, Cust_pass, Address) VALUES
('john@example.com', 'John Doe', '1234567890', 'password123', '123 Main St, City, Country'),
('jane@example.com', 'Jane Smith', '9876543210', 'password456', '456 Elm St, City, Country'),
('alice@example.com', 'Alice Johnson', '1112223333', 'password789', '789 Oak St, City, Country'),
('bob@example.com', 'Bob Williams', '4445556666', 'passwordabc', '456 Pine St, City, Country'),
('emily@example.com', 'Emily Brown', '7778889999', 'passworddef', '890 Maple St, City, Country'),
('michael@example.com', 'Michael Wilson', '1231231234', 'passwordghi', '111 Birch St, City, Country'),
('samantha@example.com', 'Samantha Lee', '4564564567', 'passwordjkl', '222 Cedar St, City, Country'),
('david@example.com', 'David Martinez', '7897897890', 'passwordmno', '333 Willow St, City, Country'),
('jessica@example.com', 'Jessica Taylor', '9998887776', 'passwordpqr', '444 Walnut St, City, Country'),
('matthew@example.com', 'Matthew Garcia', '1112223333', 'passwordstu', '555 Spruce St, City, Country');

INSERT INTO Customer (email_id, Name, Ph_no, Cust_pass, Address) VALUES

('c', 'John Doe', '1234567890', 'c1', '123 Main St, City, Country');


INSERT INTO Category_Description (Main_Category, Sub_Category, Description) VALUES
('Electronics', 'Smartphones', 'Latest models available'),
('Electronics', 'Laptops', 'Variety of brands and specifications'),
('Clothing', 'Men', 'Trendy and fashionable styles'),
('Clothing', 'Women', 'Wide range of sizes available'),
('Books', 'Fiction', 'Bestselling novels and classics'),
('Books', 'Non-Fiction', 'Informative and educational reads'),
('Home Decor', 'Furniture', 'Stylish and durable pieces'),
('Home Decor', 'Lighting', 'Elegant lighting solutions'),
('Toys', 'Educational', 'Interactive and fun learning toys'),
('Toys', 'Outdoor', 'Outdoor games and playsets');


INSERT INTO Item (Item_name, stock, Item_price, category_id) VALUES
('iPhone 13', '100', 1000, 1),
('MacBook Pro', '50', 2000, 2),
('T-Shirt', '200', 20, 3),
('Jeans', '150', 50, 4),
('To Kill a Mockingbird', '300', 15, 5),
('The Subtle Art of Not Giving a F*ck', '200', 20, 6),
('Sofa', '20', 500, 7),
('Chandelier', '30', 300, 8),
('LEGO Mindstorms EV3', '50', 300, 9),
('Basketball', '30', 25, 10);


INSERT INTO Vendor (Name, E_Mail, Verified, Phone, item_id,Passwd) VALUES
('Best Electronics', 'best@example.com', 1, '1234567890', 1,"v1"),
('Laptop World', 'laptopworld@example.com', 1, '9876543210', 2,"v2"),
('Fashion Boutique', 'fashionboutique@example.com', 0, '1112223333', 3,"v3"),
('Jeans & More', 'jeansmore@example.com', 1, '4445556666', 4,"v4"),
('Book Emporium', 'bookemporium@example.com', 0, '7778889999', 5,"v5"),
('Book Nook', 'booknook@example.com', 1, '1231231234', 6,"v6"),
('Furniture Palace', 'furniturepalace@example.com', 1, '4564564567',7, "v7"),
('Luminaire Haven', 'luminairehaven@example.com', 0, '7897897890', 8,"v8"),
('Toys Galore', 'toysgalore@example.com', 1, '9998887776', 9,"v9"),
('Sports World', 'sportsworld@example.com', 1, '1112223333', 10,"v10");



INSERT INTO orders (Vendor_ID, Total_Pieces, Total_Price, description, customer_id, item_id) VALUES
('VND001', 2 ,2000, 'Two iPhone 13s', 1, 1),
('VND002', 1 ,2000, 'MacBook Pro', 2, 2),
('VND003', 3 ,60, 'Three T-Shirts', 3, 3),
('VND004', 2 ,100, 'Two pairs of Jeans', 4, 4),
('VND005', 4 ,60, 'Four books', 5, 5),
('VND006', 3 ,60, 'Three books', 6, 6),
('VND007', 1 ,500, 'Sofa', 7, 7),
('VND008', 1 ,300, 'Chandelier', 8, 8),
('VND009', 2 ,600, 'Two LEGO Mindstorms EV3', 9, 9),
('VND010', 2 ,50, 'Two Basketballs', 10, 10);


INSERT INTO Delivery_Description (Name_Of_Receiver, Mobile_No_of_Receiver, Total_Price, Vehicle_No, Description, Ratings, order_id) VALUES
('John Doe', '1234567890', 2000, 'ABC123', 'Delivered on time', 5, 1),
('Jane Smith', '9876543210', 2000, 'DEF456', 'Quick delivery', 4, 2),
('Alice Johnson', '1112223333', 60, 'GHI789', 'Fast shipping', 4, 3),
('Bob Williams', '4445556666', 100, 'JKL012', 'Item received as described', 5, 4),
('Emily Brown', '7778889999', 60, 'MNO345', 'Package intact', 4, 5),
('Michael Wilson', '1231231234', 60, 'PQR678', 'Good service', 4, 6),
('Samantha Lee', '4564564567', 500, 'STU901', 'Delivery person was friendly', 5, 7),
('David Martinez', '7897897890', 300, 'VWX234', 'Product well-packaged', 5, 8),
('Jessica Taylor', '9998887776', 600, 'YZA567', 'Prompt delivery', 5, 9),
('Matthew Garcia', '1112223333', 50, 'BCD890', 'Item received on time', 5, 10);


INSERT INTO Admin (Mail, Ph_no, Pass, customer_id, vendor_id, item_id) VALUES
('admin1@example.com', '1234567890', 'adminpass1', 1, 1, 1),
('admin2@example.com', '9876543210', 'adminpass2', 2, 2, 2),
('admin3@example.com', '1112223333', 'adminpass3', 3, 3, 3),
('admin4@example.com', '4445556666', 'adminpass4', 4, 4, 4),
('admin5@example.com', '7778889999', 'adminpass5', 5, 5, 5),
('admin6@example.com', '1231231234', 'adminpass6', 6, 6, 6),
('admin7@example.com', '4564564567', 'adminpass7', 7, 7, 7),
('admin8@example.com', '7897897890', 'adminpass8', 8, 8, 8),
('admin9@example.com', '9998887776', 'adminpass9', 9, 9, 9),
('admin10@example.com', '1112223333', 'adminpass10', 10, 10, 10);

INSERT INTO Admin (Mail, Ph_no, Pass, customer_id, vendor_id, item_id) VALUES
('a', '1234567890', 'a1', 1, 1, 1);


select * from customer;
select * from Category_Description;
select * from Item;
select * from Vendor;
select * from orders;
select * from Delivery_Description;
select * from Admin;
select * from Admin;
