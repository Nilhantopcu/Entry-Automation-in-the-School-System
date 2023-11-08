<?php
session_start();
include ("dbconnection.php");
?>
<html>
    <head>
        <title>Advising Student</title>
        <h1 style="text-align:center">ADVISING STUDENT</h1>
        
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
$query6 = "SELECT g.ssn
           from gradstudent g
           where supervisorSsn='$_SESSION[ssn]'";
$result6= mysqli_query($conn, $query6);
echo "<table style='border: solid lpx green;'>";
echo "<tr><th>Student Ssn</th></tr>";


        if (mysqli_num_rows($result6)) {
            while($row = mysqli_fetch_assoc($result6)) {  
                echo "<tr><td>" . $row["ssn"] . "</td></tr>";
                
            }
        }

mysqli_close($conn);

?>



