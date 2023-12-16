<?php
$nombre = $_POST['nombre'];
$edad = $_POST['edad'];
$correo = $_POST['correo'];
$partido = $_POST['partido'];

// Conectar a la base de datos 
$conexion = new mysqli("localhost", "usuario", "contraseña", "basededatos");

// Verificar la conexión
if ($conexion->connect_error) {
    die("Error de conexión: " . $conexion->connect_error);
}

// Llamar al procedimiento almacenado para agregar encuesta
$sql = "CALL AgregarEncuesta('$nombre', $edad, '$correo', '$partido')";
$conexion->query($sql);

// Cerrar la conexión
$conexion->close();

// Redirigir a una página 
header("Location: exito.php");
?>
