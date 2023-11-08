<?php
session_start();
include ("dbconnection.php");
?>
<html>
    <head>
        <title>Exam Grade</title>
        <h1 style="text-align:center">EXAM GRADE</h1>
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
        $query13 = "select distinct a.courseCode, a.sectionId,a.eName , a.score
                    from enrollment e, attends a
                    where a.sssn='$_SESSION[ssn]' and e.courseCode=a.courseCode";
        $result13= mysqli_query($conn, $query13);
        
        echo "<table style='border: solid lpx green;'>";
        echo "<tr><th>Course Code</th><th>Section Id</th><th>Exam Name</th><th>Score</th></tr>";
        

        if (mysqli_num_rows($result13)) {
            while($row = mysqli_fetch_assoc($result13)) {  
                echo "<tr><td>" . $row["courseCode"] . "</td><td>" . $row["sectionId"] . "</td><td>" . $row["eName"] . "</td><td>" . $row["score"] . "</td></tr>";
                
            }
        }
$conn->close();
?>
    </body>
</html>




