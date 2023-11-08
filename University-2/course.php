<?php
session_start();
include ("dbconnection.php");
?>
<html>
    <head>
        <title>Course Name and Student Name</title>
        <h1 style="text-align:center">COURSES</h1>
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
        $query1 = "SELECT C.courseName, C.courseCode, S.studentname
        FROM course C, enrollment E, Student S 
        WHERE E.issn='$_SESSION[ssn]' and E.courseCode=C.courseCode and E.sssn=S.ssn";
        $result1= mysqli_query($conn, $query1);
        
        echo "<table style='border: solid lpx green;'>";
        echo "<tr><th>Course Name </th><th>Course Code</th><th>Student Name</th></tr>";
        

        if (mysqli_num_rows($result1)) {
            while($row = mysqli_fetch_assoc($result1)) {  
                echo "<tr><td>" . $row["courseName"] . "</td><td>" . $row["courseCode"] . "</td><td>" . $row["studentname"] . "</td></tr>";
                
            }
        }
$conn->close();
?>
    </body>
</html>
