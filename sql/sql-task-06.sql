-- ZADANIE 6
-- 	- wyświetl dostępne produkty w kolejności od najtańszego
-- 	- wyświetl nazwy trzech najdroższych produktów

SELECT * FROM Products WHERE stock>0 ORDER BY price ASC;

SELECT * FROM Products;
SELECT name, price FROM Products ORDER BY price DESC LIMIT 3;