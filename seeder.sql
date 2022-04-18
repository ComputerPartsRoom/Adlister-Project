use ComputerPartsRoom_db;

SET GLOBAL FOREIGN_KEY_CHECKS=0;

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
VALUES (1, 'Admin post', 'This post is always displayed in case you wish to message the Admin.', 0, 1, '../Assets/PlaceHolder.jpeg', 'Admin')
;



INSERT INTO messages (id, sent_user, received_user, content)
VALUES (1, 'Admin', 'Admin', 'Good morning Admin, here is your report....')
;




SELECT *
FROM users;
SELECT *
FROM messages;
SELECT *
FROM posts;


SELECT *
FROM categories;