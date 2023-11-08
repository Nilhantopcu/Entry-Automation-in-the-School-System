<?php
$dbname="university_son";
$conn= mysqli_connect("localhost", "root", "", $dbname, 3306);
if (!$conn){
    die("Failed to connect to MySQL:");
    exit();
    }
?>

 