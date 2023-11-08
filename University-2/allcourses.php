<?php
session_start();
include ("dbconnection.php");
?>
<html>
    <head>
        <title>Courses Suppose To Take</title>
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
        $query16 = "select cc.courseCode
                    from student s, curricula c, curriculacourses cc
                    where s.ssn='$_SESSION[ssn]' and s.currCode=c.currCode and c.currCode=cc.currCode";
        $result16= mysqli_query($conn, $query16);
        
        echo "<table style='border: solid lpx green;'>";
        echo "<tr><th>Course Code</th></tr>";
        

        if (mysqli_num_rows($result16)) {
            while($row = mysqli_fetch_assoc($result16)) {  
                echo "<tr><td>" . $row["courseCode"] . "</td></tr>";
                
            }
        }
$conn->close();
?>
    </body>
</html>





