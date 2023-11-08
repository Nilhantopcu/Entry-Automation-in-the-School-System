<?php
session_start();
include ("dbconnection.php");
?>
<html>
    <head>
        <title>Project</title>
        <h1 style="text-align:center">Working Of Project </h1>
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
        $query15 = "select P.pName, P.workingHour
                    from project_has_gradstudent P
                    where P.Gradssn='$_SESSION[ssn]'";
        $result15= mysqli_query($conn, $query15);
        
        echo "<table style='border: solid lpx green;'>";
        echo "<tr><th>Project Name</th><th>Working Hour</th></tr>";
        

        if (mysqli_num_rows($result15)) {
            while($row = mysqli_fetch_assoc($result15)) {  
                echo "<tr><td>" . $row["pName"] . "</td><td>" . $row["workingHour"] . "</td></tr>";
                
            }
        }
$conn->close();
?>
    </body>
</html>








