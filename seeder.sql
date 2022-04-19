use ComputerPartsRoom_db;


INSERT INTO users(username, email, password, img)
VALUES ('Admin', 'Admin@email.com', 'pass', 'https://cdn3.vectorstock.com/i/thumb-large/86/82/profile-picture-with-a-crown-placeholder-vector-38978682.jpg'),
       ('User1', 'User1@email.com', 'pass', 'https://cdn3.vectorstock.com/i/thumb-large/86/82/profile-picture-with-a-mustache-placeholder-vector-38978682.jpg'),
       ('User2', 'User2@email.com', 'pass', 'https://cdn3.vectorstock.com/i/thumb-large/86/82/profile-picture-placeholder-vector-38978682.jpg'),
       ('User3', 'User3@email.com', 'pass', 'https://cdn3.vectorstock.com/i/thumb-large/86/82/profile-picture-with-a-mustache-placeholder-vector-38978682.jpg')
;
INSERT INTO categories (name)
VALUES ('Memory'),
       ('Peripherals'),
       ('Processors'),
       ('Motherboards'),
       ('Graphics Cards'),
       ('Storage');

INSERT INTO posts(user_id, title, content, price, cat_id, img, username)
VALUES (1, 'Admin post', 'This post is always displayed in case you wish to message the Admin.', 0, 1, 'https://i.postimg.cc/YCTfrX6J/conditions-New.png', 'Admin'),
       (2, 'Sundisk 2TB SSD', 'Up to 2000MB/s - USB-C, USB 3.2 Gen 2x2', 250, 6, 'https://i.postimg.cc/YCTfrX6J/conditions-New.png', 'User1'),
       (3, 'GeForce RTX 3090', 'astronomical amounts of VRAM, 12GB of next-generation GDDR6X video memory.', 1800, 5, 'https://i.postimg.cc/YCTfrX6J/conditions-Open.png', 'User2'),
       (4, 'Apple Magic Keyboard', '*Wireless Bluetooth Connectivity *Built-In Rechargeable Battery *Touch ID Sensor *Numeric Keypad', 120, 2, 'https://i.postimg.cc/YCTfrX6J/conditions-Used.png', 'User3')
;



INSERT INTO messages (id, sent_user, received_user, content, user_id, received_id)
VALUES (3, 'User1', 'User2', 'I would like to nuy your Graphics Card!', 2, 3),
       (4, 'User1', 'User3', 'Would you take $100 for the keyboard?', 2, 4),
       (2, 'User2', 'User1', 'Still available?', 3, 2),
       (3, 'User3', 'User2', 'I will buy this Graphics Card today!', 4, 3)

;




SELECT *
FROM users;
SELECT *
FROM messages;
SELECT *
FROM posts;
