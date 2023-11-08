<?php
session_start();
include ("dbconnection.php");
?>
<html>
    <head>
        <title>Transcript</title>
        <h1 style="text-align:center">TRANSCRIPT</h1>
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
        $query12 = "select c.courseCode, e.lettergrade
                    from enrollment e, course c
                    where sssn='$_SESSION[ssn]' and e.courseCode=c.courseCode";
        $result12= mysqli_query($conn, $query12);
        
        echo "<table style='border: solid lpx green;'>";
        echo "<tr><th>Course Code</th><th>Letter Grade</th></tr>";
        

        if (mysqli_num_rows($result12)) {
            while($row = mysqli_fetch_assoc($result12)) {  
                echo "<tr><td>" . $row["courseCode"] . "</td><td>" . $row["lettergrade"] . "</td></tr>";
                
            }
        }
$conn->close();
?>
    </body>
</html>




