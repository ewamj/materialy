-- ZADANIE 12
--   - wyświetl listę wszystkich kategorii i odpowiadającą im liczbę produktów w sklepie
--   - wyświetl listę wszystkich produktów i odpowiadające im kategorie, jeśli są przypisane
--   - średnia cena produktu w każdej kategori (lista: ŚREDNIA CENA + NAZWA KATEGORII)

SELECT c.name, COUNT(p.id) FROM Categories c
  LEFT JOIN Products p ON c.id=p.category_id GROUP BY c.name; --  HAVING count(p.id)>0;

SELECT p.name AS "Nazwa produktu", c.name AS "Nazwa kategorii" FROM Products p
  LEFT JOIN Categories c ON p.category_id = c.id;

SELECT c.name, ROUND(AVG(p.price), 2) FROM Categories c
  JOIN Products p ON c.id = p.category_id GROUP BY c.name;

