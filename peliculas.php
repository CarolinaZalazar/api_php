<?php

header('Content-Type: application/json');
// Evitar error de CORS
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: *"); // GET, POST, PUT, DELETE
header("Access-Control-Allow-Headers: Content-Type"); // Cabeceras permitidas

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "codo_films";
$puerto = "3306";

$conn = new mysqli($servername, $username, $password, $dbname, $puerto);

if ($conn->connect_error) {
    // Si hay un error de conexión, devolver código de respuesta 500 (Error interno del servidor)
    http_response_code(500);
    die(json_encode(array("message" => "Error interno del servidor: " . $conn->connect_error)));
}

// Manejar la petición POST para insertar una nueva película
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Obtener y escapar los valores recibidos por POST para prevenir inyecciones SQL
    $postBody = file_get_contents("php://input");
    $data = json_decode($postBody, true);
    $titulo = $data['titulo'];
    $emision = $data['emision'];
    $genero = $data['genero'];
    $duracion = $data['duracion'];
    $direccion = $data['direccion'];
    $sinopsis = $data['sinopsis'];
    $imagen = $data['imagen'];

    if ($titulo && $emision && $genero && $duracion && $direccion && $sinopsis && $imagen) {
        // Construir la consulta SQL para insertar una nueva película en la base de datos
        $query = "INSERT INTO peliculas (id_pelicula, titulo, emision, genero, duracion, direccion, sinopsis,imagen) VALUES (NULL, '$titulo', '$emision','$genero', '$duracion', '$direccion', '$sinopsis', '$imagen')";

        if ($conn->query($query) === TRUE) {
            $last_insert_id = $conn->insert_id;
            http_response_code(201);
            echo json_encode(array("message" => $last_insert_id));
        } else {
            http_response_code(500);
            echo json_encode(array("message" => "Error al crear la película: " . $conn->error));
        }
    } else {
        http_response_code(400);
        echo json_encode(array("message" => "Debe completar todos los campos"));
    }
}

if ($_SERVER['REQUEST_METHOD'] == 'GET') {

    $idParam = isset($_GET['id']) ? $_GET['id'] : null;

    if ($idParam !== null) {
        $query = "SELECT * FROM peliculas WHERE id_pelicula = ?";
        $statement = $conn->prepare($query);
        $statement->bind_param("i", $idParam); 
    } else {
        $query = "SELECT * FROM peliculas";
        $statement = $conn->prepare($query);
    }

    $statement->execute();
    $result = $statement->get_result();

    if ($result->num_rows > 0) {
        http_response_code(200);
        $peliculas = array();
        while ($row = $result->fetch_assoc()) {
            $peliculas[] = $row;
        }
        echo json_encode($peliculas);
    } else {
        http_response_code(404);
        echo json_encode(array("message" => "No se encontraron películas"));
    }
}

if ($_SERVER['REQUEST_METHOD'] == 'PUT') {
    $postBody = file_get_contents("php://input");
    $data = json_decode($postBody, true);
    $idPelicula = $data['idPelicula'];
    $titulo = $data['titulo'];
    $emision = $data['emision'];
    $genero = $data['genero'];
    $duracion = $data['duracion'];
    $direccion = $data['direccion'];
    $sinopsis = $data['sinopsis'];
    $imagen = $data['imagen'];

    if ($idPelicula && $titulo && $emision && $genero && $duracion && $direccion && $sinopsis && $imagen) {
        $query = "UPDATE peliculas SET titulo = '$titulo', emision = '$emision', genero = '$genero', duracion = '$duracion', direccion = '$direccion', sinopsis = '$sinopsis', imagen = '$imagen' WHERE id_pelicula = $idPelicula";

        if ($conn->query($query) === TRUE) {
            http_response_code(200);
            echo json_encode(array("message" => "Pelicula actualizada put exitosamente."));
        } else {
            http_response_code(500);
            echo json_encode(array("message" => "Error al actualizar la película: " . $conn->error));
        }
    } else {
        http_response_code(400);
        echo json_encode(array("message" => "Debe completar todos los campos"));
    }
}

if ($_SERVER['REQUEST_METHOD'] == 'DELETE') {
    $idParam = $_GET['id'];

    if ($idParam) {
        $query = "DELETE FROM peliculas WHERE id_pelicula = $idParam";
        if ($conn->query($query) === TRUE && $conn->affected_rows > 0) {
            http_response_code(200);
            echo json_encode(array("message" => "Pelicula eliminada exitosamente."));
        } else {
            http_response_code(404);
            echo json_encode(array("message" => "Pelicula no encontrada."));
        }
    } else {
        http_response_code(400);
        echo json_encode(array("message" => "ID de película no proporcionado."));
    }
}

$conn->close();
?>