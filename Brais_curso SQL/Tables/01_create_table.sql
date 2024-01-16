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
