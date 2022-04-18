use ComputerPartsRoom_db;


INSERT INTO users(username, email, password, img)
VALUES ('Admin', 'Admin@email.com', 'pass', 'https://cdn3.vectorstock.com/i/thumb-large/86/82/profile-picture-with-a-crown-placeholder-vector-38978682.jpg')
;
INSERT INTO categories (name)
VALUES ('Memory'),
       ('Peripherals'),
       ('Processors'),
       ('Motherboards'),
       ('Graphics Cards'),
       ('Storage');

INSERT INTO posts(user_id, title, content, price, cat_id, img, username)
VALUES (1, 'Admin post', 'This post is always displayed in case you wish to message the Admin.', 0, 1, 'https://i.postimg.cc/YCTfrX6J/conditions-New.png', 'Admin')
;



INSERT INTO messages (id, sent_user, received_user, content, user_id, received_id)
VALUES (1, 'Admin', 'Admin', 'Good morning Admin, here is your report....', 1, 1)

;




SELECT *
FROM users;
SELECT *
FROM messages;
SELECT *
FROM posts;
