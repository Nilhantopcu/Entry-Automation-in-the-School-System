<?php
session_start();
include ("dbconnection.php");
?>
<html>
    <head>
        <title>Working Of Project</title>
        <h1 style="text-align:center">WORKING OF PROJECT</h1>
        
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
$query4 = "SELECT DISTINCT Pr.pName, Pr.workinghour
          FROM project_has_instructor Pr 
          WHERE Pr.issn='$_SESSION[ssn]'";
$result4= mysqli_query($conn, $query4);
echo "<table style='border: solid lpx green;'>";
echo "<tr><th>Lead of Project Name</th><th>Subject</th></tr>";


        if (mysqli_num_rows($result4)) {
            while($row = mysqli_fetch_assoc($result4)) {  
                echo "<tr><td>" . $row["pName"] . "</td><td>" . $row["workinghour"] . "</td></tr>";
                
            }
        }

mysqli_close($conn);

?>