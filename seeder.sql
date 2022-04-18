use ComputerPartsRoom_db;

# SET GLOBAL FOREIGN_KEY_CHECKS=0;

INSERT INTO users(username, email, password, img)
VALUES ('Admin', 'Admin@email.com', 'pass', 'https://cdn3.vectorstock.com/i/thumb-large/86/82/profile-picture-with-a-crown-placeholder-vector-38978682.jpg'),
       ('User1', 'User1@email.com', 'pass', 'https://cdn3.vectorstock.com/i/thumb-large/86/82/profile-picture-with-amustache-placeholder-vector-38978682.jpg'),
       ('User2', 'User2@email.com', 'pass', 'https://cdn3.vectorstock.com/i/thumb-large/86/82/profile-picture-placeholder-vector-38978682.jpg'),
       ('User3', 'User3@email.com', 'pass', 'https://cdn3.vectorstock.com/i/thumb-large/86/82/profile-picture-with-a-crown-placeholder-vector-38978682.jpg'),
       ('User4', 'User4@email.com', 'pass', 'https://cdn3.vectorstock.com/i/thumb-large/86/82/profile-picture-placeholder-vector-38978682.jpg')

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
       (2, 'User1 post', 'SunDisk 500GB SSD', 150, 6, 'https://i.postimg.cc/k4Wd1hs9/conditions-Open.png', 'User1'),
       (3, 'User2 post', 'Corsair Pro RGB Keyboard', 100, 2, 'https://i.postimg.cc/6Qvsq1DR/conditions-Used.png', 'User2'),
       (4, 'User3 post', 'Gaming Mouse', 150, 2, 'https://i.postimg.cc/6Qvsq1DR/conditions-Used.png', 'User3'),
       (5, 'User4 post', '27" Monitor', 100, 2, 'https://i.postimg.cc/6Qvsq1DR/conditions-Used.png', 'User4'),
       (1, 'Admin post', 'Mousepad', 100, 2, 'https://i.postimg.cc/6Qvsq1DR/conditions-Used.png', 'Admin'),
       (2, 'User1 post', 'i9 17k', 100, 2, 'https://i.postimg.cc/6Qvsq1DR/conditions-Used.png', 'User1')
;



INSERT INTO messages (id, sent_user, received_user, content, user_id, received_id)
VALUES (1, 'Admin', 'Admin', 'Good morning Admin, here is your report....', 1, 1),
       (2, 'User1', 'User4', 'I would like to buy your SSD', 2, 5),
       (3, 'User2', 'User3', 'I would like to buy your Keyboard', 3, 4),
       (4, 'User3', 'User2', 'I would like to buy your Keyboard', 4, 3),
       (5, 'User4', 'User1', 'I would like to buy your Keyboard', 5, 2)
;




SELECT *
FROM users;
SELECT *
FROM messages;
SELECT *
FROM posts;
