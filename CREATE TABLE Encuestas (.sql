-- Crear tabla para almacenar la información de las encuestas
CREATE TABLE Encuestas (
    NumeroEncuesta INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(255) NOT NULL,
    Edad INT CHECK (Edad >= 18 AND Edad <= 50) NOT NULL,
    CorreoElectronico VARCHAR(255) UNIQUE NOT NULL,
    PartidoPoliticoId INT FOREIGN KEY REFERENCES PartidosPoliticos(PartidoId) NOT NULL
);

-- Crear tabla para almacenar la información de los partidos políticos
CREATE TABLE PartidosPoliticos (
    PartidoId INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(255) NOT NULL
);

--partidos políticos 
INSERT INTO PartidosPoliticos (Nombre) VALUES ('PLN'), ('PUSC'), ('PAC');

BEGIN
    INSERT INTO Encuestas (Nombre, Edad, CorreoElectronico, PartidoPolitico)
    VALUES (p_Nombre, p_Edad, p_CorreoElectronico, p_PartidoPolitico);
END //
DELIMITER ;
DELIMITER //
CREATE PROCEDURE ObtenerReporteEncuestas()
BEGIN
    SELECT * FROM Encuestas;
END //
DELIMITER ;
