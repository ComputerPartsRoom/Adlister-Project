use ComputerPartsRoom_db;

# SET GLOBAL FOREIGN_KEY_CHECKS=0;

INSERT INTO users(username, email, password, img)
VALUES ('Admin', 'Admin@email.com', 'pass', 'https://cdn3.vectorstock.com/i/thumb-large/86/82/profile-picture-with-a-crown-placeholder-vector-38978682.jpg'),
       ('User1', 'User1@email.com', 'pass', 'https://cdn3.vectorstock.com/i/thumb-large/86/82/profile-picture-with-amustache-placeholder-vector-38978682.jpg'),
       ('User2', 'User2@email.com', 'pass', 'https://cdn3.vectorstock.com/i/thumb-large/86/82/profile-picture-placeholder-vector-38978682.jpg')

;
INSERT INTO categories (name)
VALUES ('Memory'),
       ('Peripherals'),
       ('Processors'),
       ('Motherboards'),
       ('Graphics Cards'),
       ('Storage');

INSERT INTO posts(user_id, title, content, price, cat_id, img, username)
VALUES (1, 'Admin post', 'This post is always displayed in case you wish to message the Admin.', 0, 1, '../Assets/PlaceHolder.jpeg', 'Admin'),
       (2, 'User1 post', 'SunDisk 500GB SSD', 150, 6, '../Assets/PlaceHolder.jpeg', 'User1'),
       (3, 'User2 post', 'Corsair Pro RGB Keyboard', 100, 2, '../Assets/PlaceHolder.jpeg', 'User2')
;



INSERT INTO messages (id, sent_user, received_user, content)
VALUES (1, 'Admin', 'Admin', 'Good morning Admin, here is your report....'),
       (2, 'User2', 'User1', 'I would like to buy your SSD'),
       (3, 'User1', 'User2', 'I would like to buy your Keyboard')
;




SELECT *
FROM users;
SELECT *
FROM messages;
SELECT *
FROM posts;
