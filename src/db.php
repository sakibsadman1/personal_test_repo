<?php
// PostgreSQL connection details
$host = "db"; // The service name in docker-compose
$username = "user";
$password = "password";
$dbname = "user_management";
$port = 5432; // PostgreSQL default port (changed from MySQL port 3307)

// Create PostgreSQL connection
$conn_string = "host=$host port=$port dbname=$dbname user=$username password=$password";
$conn = pg_connect($conn_string);

if (!$conn) {
    die("Connection failed: " . pg_last_error());
}

// Optional function to handle queries more easily
function pg_query_safe($conn, $query, $params = []) {
    $result = pg_query_params($conn, $query, $params);
    if (!$result) {
        die("Query failed: " . pg_last_error($conn));
    }
    return $result;
}
?>