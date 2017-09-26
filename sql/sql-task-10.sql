-- ZADANIE 10
--   - stwórz tabelę Categories z kolumnami (id, name, desc)
--   - dodaj kategorie: monitory, dyski twarde, pamięci ram, klawiatury,
--      myszy bezprzewodowe, obudowy, drukarki
--   - dodaj kolumnę w Products, która będzie łączyć produkt z
--      odpowiednią kategorią za pomocą klucza obcego (FOREIGN KEY)

CREATE TABLE Categories (
  id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  `desc` TEXT
);

DESCRIBE Categories;

INSERT INTO Categories (name) VALUES
  ('monitory'),
  ('dyski twarde'),
  ('pamięci ram'),
  ('klawiatury'),
  ('myszy bezprzewodowe'),
  ('obudowy'),
  ('drukarki');

SELECT * FROM Categories;

DESCRIBE Products;

ALTER TABLE Products ADD category_id INT UNSIGNED;

ALTER TABLE Products ADD CONSTRAINT `fk_category_id` FOREIGN KEY (category_id) REFERENCES Categories(id);
ALTER TABLE Products ADD FOREIGN KEY (category_id) REFERENCES Categories(id);

