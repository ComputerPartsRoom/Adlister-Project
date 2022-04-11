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


INSERT INTO posts(user_id, title, content, cat_id)
VALUES (1, '500GB SSD', 'SunDisk $500', 1 ),
     (1, '2TB HD', 'SunDisk $300', 1 );

INSERT INTO postCategories(post_id, cat_id)
VALUES (1, 1 ),
(2, 1 ),
(2, 2 ),
(1, 5 ) ;


INSERT INTO profPhoto(url, user_id)
VALUES ('Assets/PlaceHolder.jpeg', 1 ) ;


INSERT INTO messages(sent_id, received_id, content)
VALUES ( 1, 2, 'hello') ;

SELECT *
FROM users;
SELECT *
FROM posts;
SELECT *
FROM profPhoto;
SELECT *
FROM categories;
SELECT *
FROM postCategories;
SELECT *
FROM messages;