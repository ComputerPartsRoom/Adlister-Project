use ComputerPartsRoom_db;

CREATE DATABASE IF NOT EXISTS ComputerPartsRoom_db;

DROP TABLE IF EXISTS messages;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS profPhoto;
DROP TABLE IF EXISTS users;




CREATE TABLE IF NOT EXISTS users
(
    id       INT UNSIGNED NOT NULL AUTO_INCREMENT,
    username VARCHAR(100),
    email    VARCHAR(100),
    password varchar(100),
    img VARCHAR(500),
    PRIMARY KEY (id),
    UNIQUE (username),
    UNIQUE (email)
);


CREATE TABLE IF NOT EXISTS categories
(
    id   INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(50),
    PRIMARY KEY (id)
);


CREATE TABLE IF NOT EXISTS posts
(
    id      INT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    title   VARCHAR(100),
    content VARCHAR(500),
    price INT UNSIGNED NOT NULL,
    img VARCHAR(500),
    cat_id  INT UNSIGNED NOT NULL,
    username VARCHAR(100),
    PRIMARY KEY (id),
    FOREIGN KEY (cat_id) REFERENCES categories (id),
    FOREIGN KEY (user_id) REFERENCES users (id),
#         ON UPDATE CASCADE,
    FOREIGN KEY (username) REFERENCES users (username)
#         ON UPDATE CASCADE

);




CREATE TABLE IF NOT EXISTS messages
(
    id INT UNSIGNED,
    sent_user     VARCHAR(100),
    received_user VARCHAR(100),
    content     VARCHAR(500),
    user_id INT UNSIGNED NOT NULL,
    received_id INT UNSIGNED NOT NULL
#     FOREIGN KEY (id) REFERENCES posts (id)
#     FOREIGN KEY (user_id) REFERENCES posts (user_id)
#     FOREIGN KEY (received_id) REFERENCES
#         ON UPDATE CASCADE
#     FOREIGN KEY (sent_user) REFERENCES users (username),
#     FOREIGN KEY (received_user) REFERENCES users (username)

);