use ComputerPartsRoom_db;

INSERT INTO users(username, email, password)
VALUES ('User1', 'bvcyuwd@email.com', 'pass'),
       ('User2', 'vebrver@email.com', 'pass'),
       ('User3', 'bbhubnih@email.com', 'pass'),
       ('User4', 'niunbhbgu@email.com', 'pass')
;
INSERT INTO categories (name)
VALUES ( 'Memory'),
    ('Peripherals'),
    ('Processors'),
    ('Motherboards'),
    ('Graphics Cards'),
    ('Storage') ;

INSERT INTO posts(user_id, title, content, price, cat_id, img, username)
VALUES (1, '500GB SSD', 'SunDisk $500', 500,  1, '../Assets/PlaceHolder.jpeg', 'User1'),
       (1, '2TB HD', 'SunDisk $300', 300,  1, '../Assets/Placeholder.jpeg', 'User1' ),
       (1, '2TB HD', 'SunDisk $300', 300,  2, '../Assets/Placeholder.jpeg', 'User1' ),
       (2, '500GB SSD', 'SunDisk $500', 500,  1, '../Assets/PlaceHolder.jpeg', 'User2'),
       (2, '2TB HD', 'SunDisk $300', 300,  1, '../Assets/Placeholder.jpeg', 'User2' ),
       (2, '2TB HD', 'SunDisk $300', 300,  2, '../Assets/Placeholder.jpeg', 'User2' ),
       (3, '500GB SSD', 'SunDisk $500', 500,  1, '../Assets/PlaceHolder.jpeg', 'User3'),
       (3, '2TB HD', 'SunDisk $300', 300,  1, '../Assets/Placeholder.jpeg', 'User3' ),
       (3, '2TB HD', 'SunDisk $300', 300,  2, '../Assets/Placeholder.jpeg', 'User3' ),
       (4, '500GB SSD', 'SunDisk $500', 500,  1, '../Assets/PlaceHolder.jpeg', 'User4'),
       (4, '2TB HD', 'SunDisk $300', 300,  1, '../Assets/Placeholder.jpeg', 'User4' ),
       (4, '2TB HD', 'SunDisk $300', 300,  2, '../Assets/Placeholder.jpeg', 'User4' );




INSERT INTO messages (id, sent_user, received_user, content)
VALUES (1,'User3', 'User1', 'Message from User1 to User2'),
       (1,'User2', 'User1', 'Message from User2 to User1'),
       (1,'User3', 'User1', 'Message from User1 to User2'),
       (2,'User1', 'User2', 'Message from User2 to User1'),
       (2,'User1', 'User2', 'Message from User1 to User2'),
       (2,'User3', 'User2', 'Message from User2 to User1'),
       (2,'User1', 'User3', 'Message from User1 to User2'),
       (3,'User2', 'User3', 'Message from User2 to User1'),
       (3,'User1', 'User3', 'Message from User1 to User2'),
       (3,'User2', 'User4', 'Message from User2 to User1'),
       (3,'User1', 'User4', 'Message from User1 to User2'),
       (3,'User2', 'User4', 'Message from User2 to User1'),
       (3,'User3', 'User1', 'Message from User1 to User2'),
       (2,'User2', 'User1', 'Message from User1 to User2'),
       (3,'User3', 'User2', 'Message from User2 to User1');



INSERT INTO profPhoto(url, user_id)
VALUES ('Assets/PlaceHolder.jpeg', 1 ) ;


# SELECT posts.id, posts.user_id, posts.title, posts.content, posts.price, posts.img, posts.cat_id, categories.name
# FROM posts
#          INNER JOIN categories on posts.cat_id = categories.id;


SELECT *
FROM users;

SELECT *
FROM profPhoto;
SELECT *
FROM categories;
SELECT *
FROM messages;
SELECT *
FROM posts;