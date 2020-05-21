<?php
    $servername = "localhost";
    $username = "root";
    $password = "1234";
    // $port = "3306";
    // Create connection
    $conn = new mysqli($servername, $username, $password, $port);
    // Check connection
    if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
    }

    // Create database
    $sql = "CREATE DATABASE b2b";
    if ($conn->query($sql) === TRUE) {
    echo "Database created successfully";
    } else {
    echo "Error creating database: " . $conn->error;
    }

$conn->close();
?>