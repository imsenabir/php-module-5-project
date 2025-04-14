
-- This SQL script creates a database and tables for a simple blog application.
CREATE DATABASE blog ;

-- Use the created database
USE blog ;

 -- creating users table
CREATE TABLE users(
    id INT PRIMARY KEY AUTO_INCREMENT, 
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- creating posts table
CREATE TABLE posts(
    id INT PRIMARY KEY AUTO_INCREMENT, 
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    user_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- creating comments table
CREATE TABLE comments(
    id INT PRIMARY KEY AUTO_INCREMENT, 
    content TEXT NOT NULL,

    post_id INT NOT NULL,
    user_id INT NOT NULL,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    FOREIGN KEY (post_id) REFERENCES posts(id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- iserting data into users table
INSERT INTO users(email,password) VALUE ('lazy-panda@project.com','@!PANDA!@') ;

-- inserting data into posts table
INSERT INTO posts(title,content,user_id) VALUE ('My first Panda post','This is the content of my first Panda post.','1') ;

-- inserting data into comments table
INSERT INTO comments(content,post_id,user_id) VALUE ('This is a comment on the first post.','1','1') ;

-- getting all post with user info

-- This SQL script creates a database and tables for a simple blog application.
CREATE DATABASE blog ;

-- Use the created database
USE blog ;

 -- creating users table
CREATE TABLE users(
    id INT PRIMARY KEY AUTO_INCREMENT, 
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- creating posts table
CREATE TABLE posts(
    id INT PRIMARY KEY AUTO_INCREMENT, 
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    user_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- creating comments table
CREATE TABLE comments(
    id INT PRIMARY KEY AUTO_INCREMENT, 
    content TEXT NOT NULL,

    post_id INT NOT NULL,
    user_id INT NOT NULL,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    FOREIGN KEY (post_id) REFERENCES posts(id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- iserting data into users table
INSERT INTO users(email,password) VALUE ('lazy-panda@project.com','@!PANDA!@') ;

-- inserting data into posts table
INSERT INTO posts(title,content,user_id) VALUE ('My first Panda post','This is the content of my first Panda post.','1') ;

-- inserting data into comments table
INSERT INTO comments(content,post_id,user_id) VALUE ('This is a comment on the first post.','1','1') ;

--getting all post with user info

SELECT user.id AS UserID, user.email AS UserEmail,
       post.id AS PostID, post.title AS PostTitle,
       comment.id AS comment_id, comment.comment AS comment
FROM users AS user
JOIN posts AS post ON user.id = post.user_id
JOIN comments AS comment ON post.id = comment.post_id
WHERE comment.user_id = user.id;



