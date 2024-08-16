-- Create ecbuser table
CREATE TABLE ecbuser (
    userid INT AUTO_INCREMENT,
    username VARCHAR(15),
    password VARCHAR(255),
    name VARCHAR(30),
    snaem VARCHAR(30),
    address VARCHAR(255),
    tel VARCHAR(10),
    email VARCHAR(255),
    permission VARCHAR(3),
    PRIMARY KEY (userid)
);

-- Insert data into ecbuser
INSERT INTO ecbuser (username, password, name, snaem, address, tel, email, permission) VALUES
('admin', 'admin', 'admin01', 'default', '123 Main St', '1234567890', 'admin.deafault@example.com', 'ADM'),
('test', 'test', 'test', '01', '456 Elm St', '0987654321', 'test.01@example.com', 'MEM');

-- Create ecbitem table
CREATE TABLE ecbitem (
    itemid INT AUTO_INCREMENT,
    itemcode VARCHAR(15),
    itemname VARCHAR(30),
    itemdetail VARCHAR(255),
    itemtype VARCHAR(30),
    price INT,
    balance INT,
    imagedata TEXT,
    PRIMARY KEY (itemid)
);

-- Insert data into ecbitem
INSERT INTO ecbitem (itemcode, itemname, itemdetail, itemtype, price, balance, imagedata) VALUES
('ITEM0131235959', 'Item 1', 'Detail of item 1', 'Type A', 100, 50, ''),
('ITEM0228000001', 'Item 2', 'Detail of item 2', 'Type B', 150, 30, '');

-- Create ecbbestsell table
CREATE TABLE ecbbestsell (
    bestsellno INT,
    itemcode VARCHAR(15)
);

-- Insert data into ecbbestsell
INSERT INTO ecbbestsell (bestsellno, itemcode) VALUES
(1, ""),
(2, ""),
(3, ""),
(4, ""),
(5, "");

-- Create ecborder table
CREATE TABLE ecborder (
    orderid INT AUTO_INCREMENT,
    ordercode VARCHAR(15),
    itemcode VARCHAR(15),
    orderstatus VARCHAR(10),
    orderdate DATETIME,
    orderuserid INT,
    PRIMARY KEY (orderid)
);

-- Insert data into ecborder
INSERT INTO ecborder (ordercode, itemcode, orderstatus, orderdate, orderuserid) VALUES
('ORDER0327010305', 'item001', 'ordered', NOW(), 1),
('ORDER0426020406', 'item002', 'prepare', NOW(), 2);

-- Create ecbqna table
CREATE TABLE ecbqna (
    qnaid INT AUTO_INCREMENT,
    itemcode VARCHAR(15),
    username VARCHAR(15),
    question VARCHAR(255),
    answer VARCHAR(255),
    PRIMARY KEY (qnaid)
);

-- Insert data into ecbqna
INSERT INTO ecbqna (itemcode, username, question, answer) VALUES
('item001', 'user1', 'What is the warranty?', '1 year warranty'),
('item002', 'user2', 'Is this item in stock?', 'Yes, 30 units available');
