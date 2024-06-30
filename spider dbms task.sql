CREATE DATABASE inventoryDB; /*database is created*/

USE inventoryDB; /*our database is set as the deafult schema*/

CREATE TABLE products (
    name VARCHAR(100),
    description VARCHAR(1000),
    price INT,
    quantity INT,
    category VARCHAR(50)
); /*the required collection is created with the different fields*/

INSERT INTO products (name, description, price, quantity, category) 
VALUES
    ("Samsung Galaxy M34 5G" , "8-128GB storage, amoled display, 120hz refresh rate", "16,000","12", "smart phone"),
    ("HP Pavillon", "1TB SSD, i7 11th gen processor, flipbook", "70,000" ,"4","laptop"),
    ("Honda Activa", "125CC with digital lock system" , "1,08,000","1", "scooter"),
    ("Flash hockey sticks", "composite high quality 32 inches with formidable grip", "6,000","16", "sports equipment"),
    ("Boat buds pro", "5.2 bluetooth, 20m range, 48 hr battery backup" ,"3,000","11","earphones");
/*5 sample products are recorded.*/

SELECT * FROM products; /*this retrieves all products from the products table*/

SELECT * FROM products
WHERE price < 20,000; /*this retreives products with a price less than a specified amount*/

SELECT * FROM products
WHERE quantity > 10; /*this retreives products with more than a specified quantity in stocks*/

UPDATE products
SET price = 80,000
WHERE name = "HP Pavillon"; /*this updates price of a specified product*/

DELETE FROM products
WHERE name = "Boat buds pro"; /*this deletes a product from the products table*/
/*if you are using a version which has a safe mode on, then use the following command to enable delete permmission*/
SET SQL_SAFE_UPDATES = 0;




