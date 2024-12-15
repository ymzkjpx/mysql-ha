-- MySQL初期構築

-- my_testデータベースの作成
CREATE DATABASE IF NOT EXISTS my_test ;

-- my_testスキーマを利用
USE my_test;

-- usersを定義
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL
);

INSERT INTO users (name, email) VALUES
('Alice Smith', 'alice.smith@example.com'),
('Bob Johnson', 'bob.johnson@example.com'),
('Charlie Brown', 'charlie.brown@example.com'),
('Diana Prince', 'diana.prince@example.com'),
('Evan Wright', 'evan.wright@example.com');

