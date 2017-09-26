-- ZADANIE 11
--   - wyświetl listę produktów w formie trzech kolumn
--     (nazwa produktu, kategoria, cena netto) posortowaną po nazwie kategorii
--   - ogranicz tę listę tylko do klawiatur i myszy
--   - wyświetl stan magazygnowy dla każdej kategorii - lista w formie
--     (nazwa kategorii, liczba sztuk)

SELECT p.name, p.price, c.name FROM Products p JOIN Categories c ON p.category_id=c.id;
SELECT p.name, p.price, c.name FROM Products p, Categories c WHERE p.category_id=c.id;

SELECT p.name, p.price, c.name FROM Products p JOIN Categories c ON p.category_id=c.id WHERE c.name LIKE '%klawiatur%' OR c.name LIKE '%mysz%';

SELECT c.name, sum(p.stock) FROM Products p JOIN Categories c ON p.category_id = c.id GROUP BY c.name;
