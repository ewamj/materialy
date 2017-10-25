# OWASP Top 10

### OWASP WebGoat (dla pasjonatów Javy)

[OWASP WebGoat](https://www.owasp.org/index.php/Category:OWASP_WebGoat_Project) to aplikacja Webowa zawierająca szereg dziur, które można wykorzystać w celach pokazowych. Do zabawy będą nam potrzebna Java i Maven.

### Klonujemy repozytorium z serwerem i lekcjami

```
git clone https://github.com/WebGoat/WebGoat.git
git clone https://github.com/WebGoat/WebGoat-Lessons.git
```

### Kompilujemy serwer

```
cd WebGoat
git checkout -b v7.1 tags/7.1
mvn clean install
```

### Budujemy i kopiujemy lekcje

```
cd WebGoat-Lessons
git checkout develop
mvn package
cp target/plugins/*.jar ../WebGoat/webgoat-container/src/main/webapp/plugin_lessons/
```

#### Uruchamiamy serwer

```
cd WebGoat
mvn package
java -jar webgoat-container/target/webgoat-container-7.1-war-exec.jar http://localhost:8080/WebGoat
```

### Zaczynamy zabawę

Kierujemy przeglądarki pod adres `http://localhost:8080/WebGoat`.
