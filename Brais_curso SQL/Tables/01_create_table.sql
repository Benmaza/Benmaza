#crear tabla
CREATE TABLE personas (
id int,
name varchar(100),
age int,
email varchar(30),
created date
);

#eliminar tabla
DROP TABLE personas;

#actualizar tabla
ALTER TABLE personas 
ADD surname varchar(100), #agregar columna, RENAME, MODIFY, DROP
MODIFY COLUMN name varchar(50); #modificar columna

# agregando restricciones a las tablas
CREATE TABLE personas (
id int NOT NULL AUTO_INCREMENT,
name varchar(100) NOT NULL,
age int,
email varchar(30),
created datetime DEFAULT CURRENT_TIMESTAMP(), #fecha y hora actual
PRIMARY KEY (id),
UNIQUE (id)
CHECK (age) >=18 #restriccion de edad
);

# Relacion entre tablas 1:1
CREATE TABLE dni (
	dni_id INT AUTO_INCREMENT PRIMARY KEY,
    dni_number INT NOT NULL,
    user_id int, 
    UNIQUE (dni_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

# relacion entre tablas 1:N
ALTER TABLE users
ADD CONSTRAINT fk_companies
FOREIGN KEY (company_id) REFERENCES companies(company_id)

# relacion entre tablas N:M paso 1
CREATE TABLE languages (
	leng_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL    
);

# se debe crear una tabla intermedia paso 2
CREATE TABLE users_languages (
	users_lang INT AUTO_INCREMENT PRIMARY KEY,
    user_id int,
    lang_id int,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (lang_id) REFERENCES languages(lang_id),
     UNIQUE(user_id, lang_id)
);


