CREATE DATABASE IF NOT EXISTS personal_blog;

USE personal_blog;

DROP DATABASE personal_blog;

CREATE TABLE IF NOT EXISTS users (
	user_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    user_name VARCHAR(60),
    user_age INT,
    CONSTRAINT user unique(user_id)
);
    
CREATE TABLE IF NOT EXISTS blogs (
	blog_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    blog_theme VARCHAR(60),
    FOREIGN KEY (blog_id) REFERENCES users(user_id)
); 

CREATE TABLE IF NOT EXISTS articles (
	article_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    title VARCHAR(60),
    text VARCHAR(500),
    blog_id INT NOT NULL,
    FOREIGN KEY (blog_id) REFERENCES blogs(blog_id)
);   

CREATE TABLE IF NOT EXISTS tags (
	tag_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    text VARCHAR(60)
);

CREATE TABLE IF NOT EXISTS articles_tags (
	article_id INT NOT NULL,
    tag_id INT NOT NULL,
    FOREIGN KEY (article_id) REFERENCES articles(article_id),
    FOREIGN KEY (tag_id) REFERENCES tags(tag_id)
);