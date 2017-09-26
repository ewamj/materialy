-- @title infoShare Academy - kurs SQL
-- @author Mateusz Marmołowski
-- www.cta.ai
-- www.professor-why.pl
-- www.edu-sense.pl



-- 1. wprowadzenie
-- SQL = Structured Query Language
-- Relational databases
-- DBMS



-- 2. setup
-- sudo docker run -it -e MYSQL_ROOT_PASSWORD=pass -p 3306 -d mysql
-- sudo docker ps
-- wprowadzenie InteliJ i Workbench

-- 3. dokumentacja MySQL
-- https://dev.mysql.com/doc/refman/5.7/en/

-- 4. rodzaje danych
-- https://dev.mysql.com/doc/refman/5.7/en/data-types.html

-- https://dev.mysql.com/doc/refman/5.7/en/integer-types.html
-- https://dev.mysql.com/doc/refman/5.7/en/fixed-point-types.html
-- https://dev.mysql.com/doc/refman/5.7/en/date-and-time-types.html
-- https://dev.mysql.com/doc/refman/5.7/en/char.html


CREATE DATABASE isa;
USE isa;

-- 5. tworzenie nowej tabeli "User" (CREATE TABLE + DESCRIBE)

CREATE TABLE User (
    id INT UNSIGNED,
    name VARCHAR(100),
    age TINYINT UNSIGNED
);

DESCRIBE User;



-- ZADANIE 1

-- 6. zmiana nazwy i rozszerzanie tabeli (RENAME TABLE oraz ALTER TABLE ADD/DROP/RENAME TO)

DESCRIBE Users;
RENAME TABLE User TO Users;

ALTER TABLE Users ADD pesel CHAR(9) NOT NULL AFTER age;
ALTER TABLE Users DROP pesel;
ALTER TABLE Users MODIFY phone CHAR(20) NOT NULL;
ALTER TABLE Users CHANGE phone telefon VARCHAR(20);

DROP TABLE Users;

-- ZADANIE 2


-- 7. usuwanie tabeli (DROP TABLE)


-- 8. dodawanie nowych rekordów (INSERT)

DESCRIBE Users;


# INSERT INTO [table] VALUES (..values..)
# INSERT INTO [table] (..columns..) VALUES (..values..)
# INSERT INTO [table] (..columns..) VALUES (..values..), (..values..), (..values..)

INSERT INTO Users VALUES (null, 'Jan2', 30, '123123123');
INSERT INTO Users (id, age, name, telefon) VALUES (1, 30, 'Jan', '123123123');
INSERT INTO Users (name) VALUE ('Kasia8');
INSERT INTO Users (id, name) VALUE (2, 'Marcin');
INSERT INTO Users (id, name) VALUE (100, 'Marcin');
INSERT INTO Users (id, name) VALUE (101, 'Marcin2');
INSERT INTO Users (id, name) VALUE (6, 'Jurek');

INSERT INTO Users (id, name) VALUE (200, 'Marcin3');
INSERT INTO Users (name) VALUE ('Kasia8');
INSERT INTO Users (id, name) VALUE (null, 'Kasia9');

INSERT INTO Users (id, name) VALUES
    (null, 'Kasia10'),
    (null, 'Kasia11'),
    (null, 'Kasia12'),
    (null, 'Kasia13'),
    (null, 'Kasia14'),
    (null, 'Kasia15')
;
INSERT INTO Users VALUES
    (null, 'Kasia20', 20, '12331231'),
    (null, 'Kasia21', 20, '12331231'),
    (null, 'Kasia22', 20, '12331231'),
    (null, 'Kasia23', 20, '12331231'),
    (null, 'Kasia24', 20, '12331231'),
    (null, 'Kasia25', 20, '12331231')
;


DROP TABLE Users;
CREATE TABLE Users (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE,
    age TINYINT UNSIGNED,
    telefon VARCHAR(20)
);



-- ZADANIE 3

-- 9. wyświetlanie rekordów (SELECT)
-- 	- pokaż wszystkie lub wybrane kolumny
-- 	- ustawianie aliasow na kolumnach
-- 	- obliczenia na kolumnach
-- 	- użycie DISTINCT

DESCRIBE Users;
# select [kolumny] from [tabela]

SELECT * FROM Users;

# wybieranie poszczegolnych kolumn i zmiana ich nazwy w raporcie
SELECT id, name FROM Users;
SELECT id as "IDENTYFIKATOR", name as "NAZWISKO UZYTKOWNIKA", age as "WIEK" FROM Users;

# kalkulacje w ramach kolumny
SELECT id, name, age, 2017-age AS "birth" FROM Users;

# usuwanie duplikatów
SELECT DISTINCT age FROM Users;
SELECT DISTINCT vat, stock FROM Products;


-- ZADANIE 4

-- 10. warunkowy SELECT:

# select [kolumny] from [tabela] where [warunki]

-- 	- dodanie WHERE i operatory =, <, >, !=. <>, <= ,>=
SELECT * FROM Users WHERE age>=30;
SELECT * FROM Users WHERE age<>30;
SELECT * FROM Users WHERE name='Jan';

-- 	- between + and
SELECT * FROM Users WHERE age BETWEEN 30 AND 40;

-- 	- in (...) not in (...)
SELECT * FROM Users WHERE age IN (20,23,30,31);
SELECT * FROM Users WHERE age NOT IN (23,30,31);

-- 	- like, not like, _,  %
SELECT * FROM Users WHERE name LIKE '%J_n_';

-- 	- operatory OR + AND
SELECT * FROM Users WHERE name='Jan' OR name='Jurek';
-- SELECT * FROM Users WHERE age BETWEEN 30 AND 40;
SELECT * FROM Users WHERE age>=30 AND age<=40;

SELECT name FROM Users WHERE age=30;

-- ZADANIE 5


-- 11. kolejność i podzbiory SELECT:
-- 	- ORDER BY
-- 	- LIMIT i OFFSET

# select [kolumny] from [tabela] where [warunek]
# order by [kolumna] [kierunek=ASC/DESC] LIMIT [liczba] OFFSET [liczba]

SELECT * FROM Users ORDER BY name DESC;
SELECT * FROM Users ORDER BY name, age DESC;


SELECT name FROM Users;
SELECT Users.name FROM Users;
SELECT u.name FROM Users u;

SELECT * FROM Users ORDER BY 1 DESC LIMIT 5;
SELECT * FROM (SELECT * FROM Users LIMIT 5) u2 ORDER BY name;

SELECT * FROM Users LIMIT 5 OFFSET 5;



-- ZADANIE 6


-- 11. grupowanie i agregacje w SELECT:
-- 	- agregaty sum, avg, count, count(*), max, min

SELECT * FROM Users;
SELECT MIN(age), MAX(age), AVG(age), COUNT(*) FROM Users;

ALTER TABLE Users ADD role TINYINT UNSIGNED AFTER name;

-- 	- GROUP BY (użytkownicy z różnych miast)
SELECT role, name, AVG(age) FROM Users GROUP BY role;

-- 	- HAVING (pokazuj tylko te skąd pochodzi więcej niż 2 użytkowników)
-- SELECT role, AVG(age) as avg FROM Users WHERE age>25 GROUP BY role; # co innego
SELECT role, AVG(age) as avg FROM Users GROUP BY role HAVING avg>25;


# role = 1 - admnistrator
# role = 2 - uzytkownik

# select [kolumny] from [tabela] where [warunek] group by [kolumna]
#   order by [kolumna] [kierunek=ASC/DESC] LIMIT [liczba] OFFSET [liczba]



-- ZADANIE 7


-- 12. aktualizacja (UPDATE) - modyfikujemy dane poszczególnych użytkowników

# update [tabela] set [kolumny z wartosciami] where [warunek];

SELECT * FROM Users;

UPDATE Users SET age=40 WHERE name LIKE 'Jan%';
UPDATE Users SET age=20 WHERE id BETWEEN 200 AND 210;

UPDATE Users SET name='Jan' WHERE name LIKE 'Jan%';


-- ZADANIE 8


-- 13. usuwanie (DELETE)
SELECT * FROM Users;

DELETE FROM Users WHERE id=4;

DELETE FROM Users;
TRUNCATE Users;

INSERT INTO Users VALUES (null, 'Jan', 1, 20, '123123132');
INSERT INTO Users VALUES (null, 'Kasia', 1, 23, '123123132');
INSERT INTO Users VALUES (null, 'Jurek', 2, 24, '123123132');
INSERT INTO Users VALUES (null, 'Wojtek', 2, 27, '123123132');

CREATE TABLE imiona (
    name VARCHAR(100)
);

INSERT INTO imiona VALUES ('Jan'), ('Kasia'), ('Jurek');
SELECT * FROM imiona;
INSERT INTO imiona SELECT age FROM Users;


-- ZADANIE 9

SELECT * FROM Users;


-- 14. tworzymy drugą tabelę Posts (id, date, title, body) i wprowadzamy Foreign Key "user_id", np. FOREIGN KEY (PersonID) REFERENCES Persons(ID)

DESCRIBE Users;

CREATE TABLE Posts (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    date DATETIME,
    title VARCHAR(255),
    body MEDIUMTEXT,
    user_id INT UNSIGNED,
    FOREIGN KEY (user_id) REFERENCES Users(id)
);

DESCRIBE Posts;

SELECT * FROM Users;
INSERT INTO Posts VALUES (null, '2017-10-10 12:00', 'tytul 1 posta', 'tresc 1 posta', null);
INSERT INTO Posts VALUES (null, '2017-10-10 12:00', 'tytul 2 posta', 'tresc 2 posta', 2);
INSERT INTO Posts VALUES (null, '2017-10-10 12:00', 'tytul 3 posta', 'tresc 3 posta', 3);
SELECT * FROM Posts;

DELETE FROM Posts WHERE user_id=2;
DELETE FROM Users WHERE id=2;


-- ZADANIE 10


-- 15. próba naruszenia klucza obcego (błędny klucz, usunięcie rekordu zależnego)

-- 16. INNER JOIN / JOIN - wspólny podzbiór rekordów + alternatywny zapis (bez JOIN)

# select [kolumny] from [tabela1] inner join [tabela2] on [warunek -> tabela1.pole=tabela2.pole]
SELECT * FROM Users;
SELECT * FROM Posts;

SELECT Users.name FROM Users;
SELECT u.name FROM Users u;

SELECT u.name, u.age, p.title FROM Users u INNER JOIN Posts p ON p.user_id=u.id;
SELECT u.name, u.age, p.title FROM Users u JOIN Posts p ON p.user_id=u.id;


# select [kolumny] from [tabela1], [tabela2] where [warunek -> tabela1.pole=tabela2.pole]
SELECT u.name, u.age, p.title FROM Users u JOIN Posts p ON p.user_id=u.id;
SELECT u.name, u.age, p.title FROM Users u, Posts p WHERE p.user_id=u.id;



-- ZADANIE 11


-- 17. (LEFT, RIGHT) [OUTER] JOIN / LEFT JOIN - asymetryczne dane (indywidualny i wspólny podzbiór)
SELECT u.name, u.age, p.title FROM Users u LEFT JOIN Posts p ON p.user_id=u.id;
SELECT u.name, u.age, p.title FROM Posts p LEFT JOIN Users u  ON p.user_id=u.id;

SELECT u.name, u.age, p.title FROM Users u RIGHT JOIN Posts p ON p.user_id=u.id;


# select [kolumny] from [tabela1] left join [tabela2] on [warunek -> tabela1.pole=tabela2.pole]




-- ZADANIE 12


-- 18. posługiwanie się operatorem NULL i dobre praktyki (IS NULL / IS NOT NULL)

-- ZADANIE 13


-- 19. wyrażenia i obliczenia w ramach zapytań

-- ZADANIE 14

#
# select [kolumny] from [tabela] where [warunek]
#   order by [kolumna] [kierunek=ASC/DESC] LIMIT [liczba] OFFSET [liczba]



-- 20. kolejność przetwarzania  w zapytaniu SQL
--     1. FROM and JOINs
--     2. WHERE
--     3. GROUP BY
--     4. HAVING
--     5. SELECT
--     6. DISTINCT
--     7. ORDER BY
--     8. LIMIT / OFFSET


-- 21. kodowanie znaków CHARACTER SET i COLLATION

SHOW CHARACTER SET;

SELECT @@character_set_database, @@collation_database;

ALTER DATABASE isa CHARACTER SET utf8;
ALTER TABLE Users CONVERT TO CHARACTER SET utf8;
ALTER TABLE Products CONVERT TO CHARACTER SET utf8;
-- ALTER TABLE Categories CONVERT TO CHARACTER SET utf8;


-- ALTER DATABASE [dbname] .. CHARACTER SET utf8 COLLATE utf8_general_ci;

-- ALTER TABLE [tabela] CONVERT TO CHARACTER SET utf8 COLLATE utf8_polish_ci;

CREATE TABLE polska_tabela (
    name VARCHAR(100)
) DEFAULT CHARSET=utf8;

INSERT INTO polska_tabela VALUES ('śśśśśś');
SELECT * FROM polska_tabela;

ALTER TABLE polska_tabela CONVERT TO CHARACTER SET utf8 COLLATE utf8_polish_ci;

-- DEFAULT CHARSET=latin1;

CREATE DATABASE isa2 CHARACTER SET utf8;

-- CREATE DATABASE [db_name] CHARACTER SET [charset_name] COLLATE [collation_name]



-- 22. PROJEKT - budowa struktury danych od początku




-- INTERAKTYWNY KURS SQL
-- https://sqlbolt.com
