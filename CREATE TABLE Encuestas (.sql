CREATE TABLE Encuestas (
    NumeroEncuesta INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL,
    Edad INT CHECK (Edad >= 18 AND Edad <= 50) NOT NULL,
    CorreoElectronico VARCHAR(255) UNIQUE NOT NULL,
    PartidoPolitico ENUM('PLN', 'PUSC', 'PAC') NOT NULL
);
DELIMITER //
CREATE PROCEDURE AgregarEncuesta(
    IN p_Nombre VARCHAR(255),
    IN p_Edad INT,
    IN p_CorreoElectronico VARCHAR(255),
    IN p_PartidoPolitico ENUM('PLN', 'PUSC', 'PAC')
)
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
