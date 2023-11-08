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
$query5 = "SELECT s.studentname, s.ssn
           from student s
           where advisorSsn='$_SESSION[ssn]'";
$result5= mysqli_query($conn, $query5);
echo "<table style='border: solid lpx green;'>";
echo "<tr><th>Student Name</th><th>Student Ssn</th></tr>";


        if (mysqli_num_rows($result5)) {
            while($row = mysqli_fetch_assoc($result5)) {  
                echo "<tr><td>" . $row["studentname"] . "</td><td>" . $row["ssn"] . "</td></tr>";
                
            }
        }

mysqli_close($conn);

?>


