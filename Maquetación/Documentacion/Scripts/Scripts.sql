-- SELECT

SELECT * FROM `datask-db`.usuario;
SELECT * FROM `datask-db`.articulo;
SELECT * FROM `datask-db`.categoria;
SELECT id, Email FROM usuario WHERE id=1;
SELECT id, Email, Contraseña from usuario where email='admin@programaelfuturo.com';

-- INSERT

insert into usuario (nombre,apellido,username,descripcion,ciudad,contraseña,email) 
values ('AdminMatias','Boiero','Maty_Boiero987','Desarrollador','Buenos Aires','Admin123*','admin123@gmail.com');
insert into usuario (nombre,apellido,username,descripcion,ciudad,contraseña,email) 
values ('AdminGonzalo','Bruzzo','Gonza_Bruzzo1989','Desarrollador','Buenos Aires','Admin123*','admin123@gmail.com');
insert into usuario (nombre,apellido,username,descripcion,ciudad,contraseña,email) 
values ('AdminJonatan','Acuña','Joni_Acuña1987','Desarrollador','Cordoba','Admin123*','admin123@gmail.com');
insert into usuario (nombre,apellido,username,descripcion,ciudad,contraseña,email) 
values ('AdminFlavia','Pieroni','Fla_Pieroni1990','Desarrolladora','Cordoba','Admin123*','admin123@gmail.com');
insert into usuario (nombre,apellido,username,descripcion,ciudad,contraseña,email) 
values ('AdminGabi','Farias','Gabi_Farias1981','Desarrollador','Cordoba','Admin123*','admin123@gmail.com');
insert into categoria (nombre,usuario_id_usuario) values ('Fundamentos de la programacion', 3);
insert into categoria (nombre,usuario_id_usuario) values ('Lenguajes de programacion', 2);
insert into categoria (nombre,usuario_id_usuario) values ('Patrones de diseño de software', 1);
insert into categoria (nombre,usuario_id_usuario) values ('Ciberseguridad', 4);
insert into categoria (nombre,usuario_id_usuario) values ('Desarrollo Web', 3);
insert into categoria (nombre,usuario_id_usuario) values ('Marketing Digital', 1);
insert into categoria (nombre,usuario_id_usuario) values ('Redes', 5);
insert into categoria (nombre,usuario_id_usuario) values ('Ciencia de datos', 2);
insert into categoria (nombre,usuario_id_usuario) values ('Devops', 5);

-- UPDATE

UPDATE usuario
SET contraseña='pbkdf2:sha256:260000$YFhg8ci3rRRB9b1e$95a67fe6307a53289312c13927e8120138f43f19f50e1cb274d2511cbe98a939' WHERE id_Usuario=1;
UPDATE usuario
SET email='admin@programaelfuturo.com' WHERE id_Usuario=1;
UPDATE usuario
SET email='admin@programaelfuturo.com' WHERE id=2;
UPDATE usuario
SET email='admin@programaelfuturo.com' WHERE id=3;
UPDATE usuario
SET email='admin@programaelfuturo.com' WHERE id=4;
UPDATE usuario
SET email='admin@programaelfuturo.com' WHERE id=5;
UPDATE usuario
SET username='Administrador_GF' WHERE id=5;

-- DELETE

delete from articulo where Id_Articulo=4;

-- JOIN
SELECT articulo.id_articulo,articulo.titulo, categoria.nombre
FROM articulo
INNER JOIN categoria ON articulo.Categoria_Id_categoria = categoria.Id_Categoria



