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
    PRIMARY KEY (id),
    FOREIGN KEY (cat_id) REFERENCES categories (id),
    FOREIGN KEY (user_id) REFERENCES users (id)
);


CREATE TABLE IF NOT EXISTS profPhoto
(
    id      INT UNSIGNED NOT NULL DEFAULT 1,
    url     VARCHAR(1000),
    user_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users (id)
);


CREATE TABLE IF NOT EXISTS messages
(
    sent_id     INT UNSIGNED NOT NULL,
    received_id INT UNSIGNED NOT NULL,
    content     VARCHAR(500),
    FOREIGN KEY (sent_id) REFERENCES users (id),
    FOREIGN KEY (received_id) REFERENCES users (id)
);