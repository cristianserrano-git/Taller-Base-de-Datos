-- 1. Borrar la tabla Notas que depende de usuarios
DROP TABLE IF EXISTS Notas;

-- 2. Vaciar la tabla usuarios (ahora sí te dejará sin error)
TRUNCATE TABLE usuarios;

-- 3. Volver a crear tu tabla Notas con su respectiva Foreign Key
CREATE TABLE Notas (
    ID int(11) NOT NULL AUTO_INCREMENT,
    Autor_ID int(11) NOT NULL,
    Titulo varchar(150) NOT NULL,
    Texto text NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (Autor_ID) REFERENCES usuarios(ID)
);
INSERT INTO usuarios (Nombre, Apellido, Fecha_Nacimiento, telefono)
VALUES ('Pedro', 'Perez', '2000-01-23 18:00:00', '3192663020');
INSERT INTO Notas (Autor_ID, Titulo, Texto)
VALUES (1, 'Prueba Nota', 'mi primera nota');
SELECT * FROM usuarios;
SELECT n.ID, n.Titulo, n.Texto,
       CONCAT(u.Nombre, ' ', u.Apellido) as 'Autor'
FROM Notas n, usuarios u
WHERE n.Autor_ID = u.ID;


