-- ZADANIE 1 - utwórz tablicę Products z kolumnami jakie uważasz za konieczne

CREATE TABLE Products (
  id INT UNSIGNED PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  price DECIMAL(7,2) DEFAULT '10.00'
);

DESCRIBE Products;