<?php
session_start();
include ("dbconnection.php");
?>
<html>
    <head>
        <title>Free Hour Report</title>
        <h1 style="text-align:center">FREE HOUR REPORT</h1>
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
        $query7 = "SELECT C.courseCode, C.numHours 
                   FROM course C, enrollment E
                   WHERE E.issn='$_SESSION[ssn]' and E.courseCode=C.courseCode";
        $result7= mysqli_query($conn, $query7);
 
        echo "<table style='border: solid lpx green;'>";
        echo "<tr><th>Course Code</th><th>Number of Hours</th></tr>";
        

        if (mysqli_num_rows($result7)) {
            while($row = mysqli_fetch_assoc($result7)) {  
                echo "<tr><td>" . $row["courseCode"] . "</td><td>" . $row["numHours"] . "</td></tr>";
                
            }
        }
$conn->close();
?>
    </body>
</html>
