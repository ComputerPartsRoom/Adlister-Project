use ComputerPartsRoom_db;

INSERT INTO users(username, email, password)
VALUES ( 'bob', 'bvcyuwd@email.com', 'bcwiuvbc'),
       ('tom', 'vebrver@email.com', 'cenruic')
;
INSERT INTO categories(name)
 VALUES ( 'books')
;
INSERT INTO posts(user_id, title, content, cat_id)
VALUES (1, 'book', 'for sale', 1 )
;

INSERT INTO postCategories(post_id, cat_id)
VALUES (1, 1 )
;
INSERT INTO profPhoto(url, user_id)
VALUES ('Assets/PlaceHolder.jpeg', 1 )
;
INSERT INTO messages(sent_id, received_id, content)
VALUES ( 1, 2, 'hello')
;

SELECT * FROM users;
SELECT * FROM posts;
SELECT * FROM profPhoto;
SELECT * FROM categories;
SELECT * FROM postCategories;
SELECT * FROM messages;