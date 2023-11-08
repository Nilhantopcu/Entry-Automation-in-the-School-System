<?php
session_start();
include ("dbconnection.php");
?>
<html>
    <head>
        <title>Leading Of Project</title>
        <h1 style="text-align:center">LEADING OF PROJECT</h1>
        
        <style>
        table {
        border-collapse: collapse;
        width: 50%;
        }
        
        th, td {
        text-align: left;
        padding: 8px;
        }

        tr:nth-child(even) {
        background-color: #D6EEEE;
        }
        </style>
        </head>
        <body>
        <?php
$query3 = "SELECT DISTINCT P.pName, P.subject
          FROM project P
          WHERE P.leadSsn='$_SESSION[ssn]'"; 
$result3= mysqli_query($conn, $query3);
echo "<table style='border: solid lpx green;'>";
echo "<tr><th>Lead of Project Name</th><th>Subject</th></tr>";


        if (mysqli_num_rows($result3)) {
            while($row = mysqli_fetch_assoc($result3)) {  
                echo "<tr><td>" . $row["pName"] . "</td><td>" . $row["subject"] . "</td></tr>";
                
            }
        }

mysqli_close($conn);

?>