<?php
session_start();
include ("dbconnection.php");
?>
<html>
    <head>
        <title>Student Information</title>
        <h1 style="text-align:center">Student Information</h1>
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
        $query10 = "select I.dName, S.gradorUgrad, I.iname
                   from student S, instructor I
                   where S.ssn='$_SESSION[ssn]' and S.advisorSsn=I.ssn ";
        $result10= mysqli_query($conn, $query10);
        
        echo "<table style='border: solid lpx green;'>";
        echo "<tr><th>Department Name</th><th>Graduate or Undergraduate</th><th>Advisor Name</th></tr>";
        

        if (mysqli_num_rows($result10)) {
            while($row = mysqli_fetch_assoc($result10)) {  
                echo "<tr><td>" . $row["dName"] . "</td><td>" . $row["gradorUgrad"] . "</td><td>" . $row["iname"] . "</td></tr>";
                
            }
        }
$conn->close();
?>
    </body>
</html>

