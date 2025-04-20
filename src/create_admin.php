<?php
require 'db.php';

$query = "SELECT id FROM users WHERE username = 'admin'";
$result = $conn->query($query);

if ($result->num_rows === 0) {
    $username = 'admin';
    $email = 'admin@example.com';
    $password = 'admin123';
    $hashed_password = password_hash($password, PASSWORD_DEFAULT);
    $role_id = 1;
    
    $query = "INSERT INTO users (username, email, password, role_id) VALUES (?, ?, ?, ?)";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("sssi", $username, $email, $hashed_password, $role_id);
    
    if ($stmt->execute()) {
        echo "Admin user created successfully!<br>";
        echo "Username: admin<br>";
        echo "Email: admin@example.com<br>";
        echo "Password: admin123<br>";
        echo "<a href='login.php'>Go to login page</a>";
    } else {
        echo "Failed to create admin user: " . $conn->error;
    }
} else {
    echo "Admin user already exists.<br>";
    echo "<a href='login.php'>Go to login page</a>";
}
?>