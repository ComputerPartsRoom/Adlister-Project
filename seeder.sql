use ComputerPartsRoom_db;

INSERT INTO users(username, email, password)
VALUES ('User1', 'bvcyuwd@email.com', 'pass'),
       ('User2', 'vebrver@email.com', 'pass')
;
INSERT INTO categories (name)
VALUES ( 'Memory'),
    ('Peripherals'),
    ('Processors'),
    ('Motherboards'),
    ('Graphics Cards'),
    ('Storage') ;

INSERT INTO posts(user_id, title, content, price, cat_id, img)
VALUES (1, '500GB SSD', 'SunDisk $500', 500,  1, '../Assets/PlaceHolder.jpeg'),
       (1, '2TB HD', 'SunDisk $300', 300,  1, '../Assets/Placeholder.jpeg' ),
       (1, '2TB HD', 'SunDisk $300', 300,  2, '../Assets/Placeholder.jpeg' ),
       (2, '500GB SSD', 'SunDisk $500', 500,  1, '../Assets/PlaceHolder.jpeg'),
       (2, '2TB HD', 'SunDisk $300', 300,  1, '../Assets/Placeholder.jpeg' ),
       (2, '2TB HD', 'SunDisk $300', 300,  2, '../Assets/Placeholder.jpeg' );




INSERT INTO messages (sent_id, received_id, content)
VALUES (1, 2, 'Message from User1 to User2'),
       (2, 1, 'Message from User2 to User1'),
       (1, 2, 'Message from User1 to User2'),
       (2, 1, 'Message from User2 to User1');



INSERT INTO profPhoto(url, user_id)
VALUES ('Assets/PlaceHolder.jpeg', 1 ) ;


# SELECT posts.id, posts.user_id, posts.title, posts.content, posts.price, posts.img, posts.cat_id, categories.name
# FROM posts
#          INNER JOIN categories on posts.cat_id = categories.id;


SELECT *
FROM users;
SELECT *
FROM posts;
SELECT *
FROM profPhoto;
SELECT *
FROM categories;
SELECT *
FROM messages;
