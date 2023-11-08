<?php
session_start();
include ("dbconnection.php");
?>
<html>
    <head>
        <title>Weekly Schedule</title>
        <h1 style="text-align:center">WEEKLY SCHEDULE</h1>
        
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
$query2 = "SELECT * FROM weeklyschedule WHERE issn='$_SESSION[ssn]'";
$result2= mysqli_query($conn, $query2);
echo "<table style='border: solid lpx green;'>";
echo "<tr><th>Course Code</th><th>Section Id</th><th>Year</th><th>Semester</th><th>Day</th><th>Hour</th></tr>";


        if (mysqli_num_rows($result2)) {
            while($row = mysqli_fetch_assoc($result2)) {  
                echo "<tr><td>" . $row["courseCode"] . "</td><td>" . $row["sectionId"] . "</td><td>" . $row["yearr"] . "</td><td>" . $row["semester"] . "</td><td>" . $row["dayy"] . "</td><td>" . $row["hourr"] . "</td></tr>";
                
            }
        }

mysqli_close($conn);

?>

                  
        

