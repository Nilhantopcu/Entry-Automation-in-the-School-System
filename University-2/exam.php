<?php
session_start();
include ("dbconnection.php");
?>
<html>
    <head>
        <title>Exam</title>
        <h1 style="text-align:center">EXAM INFORMATION</h1>
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
        $query8 = "Select distinct c.courseName, e.coursecode, e.eName, e.edate, e.yearr, e.semester, e.sectionId
                  From exam e, sectionn s, course c
                  Where c.courseCode=s.courseCode and s.courseCode=e.courseCode and s.issn='$_SESSION[ssn]'";
        
             
        $result8= mysqli_query($conn, $query8);
 
        echo "<table style='border: solid lpx green;'>";
        echo "<tr><th>Course Name</th><th>Course Code</th><th>Exam Name</th><th>Exam Date</th><th>Year</th><th>Semester</th><th>Section Id</th></tr>";
        

        if (mysqli_num_rows($result8)) {
            while($row = mysqli_fetch_assoc($result8)) {  
                echo "<tr><td>" . $row["courseName"] . "</td><td>" . $row["coursecode"] . "</td><td>" . $row["eName"] . "</td><td>" . $row["edate"] . "</td><td>" . $row["yearr"] . "</td><td>" . $row["semester"] . "</td><td>" . $row["sectionId"] . "</td></tr>";
                
            }
        }
$conn->close();
?>
        
            <form class="form_signin" action="addexam.php" method="post">
                <tr><td>
                <div class="form-group">
                <button class="btn btn-lg btn-primary btn-block" type="submit">Add An Exam</button> 
            </div>
            </td></tr>
            </form>
    </body>
</html>

