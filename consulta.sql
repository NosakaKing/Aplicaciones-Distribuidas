-- Usamos la base de datos Jardineria
-- En mi caso uso la tabla llamada gama_producto


-- Primero debemos de eliminar la relacion que tiene la tabla producto con gama_producto

ALTER TABLE jardineria.producto DROP FOREIGN KEY producto_ibfk_1;

-- Por la Relacion que tiene gama_producto con producto se debe de eliminar el indice de la tabla producto
ALTER TABLE `producto` DROP INDEX `gama`;

-- Eliminamos la llave primaria de la tabla gama_producto ahora que no tiene relacion con producto
ALTER TABLE `gama_producto` DROP PRIMARY KEY;


-- Ahora debemos añadir la llave primaria a la tabla gama_producto que sea autoincremental
ALTER TABLE `gama_producto` ADD `id_gama` INT NOT NULL AUTO_INCREMENT PRIMARY KEY;


-- Eliminamos la columna gama como clave primaria de la tabla gama_producto
ALTER TABLE `gama_producto` ADD UNIQUE(`gama`);

-- Ahora agregamos la relacion de la tabla producto con gama_producto
ALTER TABLE producto
ADD CONTRAINT `fk_gama_producto`
FOREIGN KEY (`gama`)
REFERENCES `gama_producto` (`gama`)


--Con esto hemos finalizado la normalizacion de la base de datos y hemos creado la relacion entre las tablas gama_producto y producto ya que esta tenia como llave primaria el nombre de la gama y no un id autoincremental