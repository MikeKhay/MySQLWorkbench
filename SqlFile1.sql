CREATE DATABASE IF NOT EXISTS mini_shop;

DROP DATABASE mini_shop;

USE mini_shop;

CREATE TABLE IF NOT EXISTS products(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(70) NOT NULL,
    description TEXT,
    category VARCHAR(50) NOT NULL,
    code VARCHAR(15) NOT NULL UNIQUE,
    scale VARCHAR(6) DEFAULT '1:10',
    qty_in_stock SMALLINT NOT NULL,
    price DECIMAL(6,2) NOT NULL, #999,99
    created_at DATE NOT NULL # 2020-01-01
);

DROP TABLE products;

INSERT INTO products(name, description, category, code, scale, qty_in_stock, price, created_at)
VALUES("apple","green apple","fruit","0001","0004","15","5.5","2021-08-07"),
	("banana","good banana","fruit","0023","0046","23","7.2","2021-08-06"),
	("bread","white bread","baking","0034","0054","12","4.0","2021-08-07"),
	("orange","large orange","fruit","00034","0006","12","8.5","2021-08-5");

INSERT INTO products(name, description, category, code, scale, qty_in_stock, price, created_at)
values("cake","chokolate cake","baking","0087","4456","7","13.5","2021-08-06"),
("potato","potato","vegetable","0432","0326","40","2.2","2021-08-01"),
("tomato","red tomato","vegetable","0353","0234","35","3.5","2021-08-04"),
("cookies","cookies with cream","baking","0846","0543","27","4.2","2021-08-05");

SELECT * FROM products;
SELECT id, name, price FROM products;
SELECT * FROM products WHERE id=1;
SELECT id, name, price FROM products WHERE id=3;
SELECT * FROM products WHERE price>6;
SELECT * FROM products WHERE price<8;
SELECT * FROM products WHERE description is null;
SELECT * FROM products WHERE description is not null;
SELECT * FROM products WHERE description is not null AND price>7;
SELECT * FROM products WHERE category = 'baking' OR category = 'fruit';
SELECT * FROM products WHERE category = 'vegetable' ORDER BY name ASC;
SELECT * FROM products WHERE category = 'vegetable' ORDER BY name DESC;
SELECT DISTINCT description FROM products;
SELECT DISTINCT description AS des_product FROM products;