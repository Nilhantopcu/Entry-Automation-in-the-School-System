<?php
session_start();
include ("dbconnection.php");
?>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>E-campus</title>
        
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
    <style type="text/css">
        .container{
            margin-top: 30px;    
        }       
    </style>


    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="row">
   	        </div>
                
                <div class="col-md-4 col-sm-4 col-xs-4 col-padding">
                </div>
                <div class="col-md-4 col-sm-4 col-xs-4 col-padding">
                 <form class="form_signin" method="post">
                    <div class="form-group">
                    <h2 class="form-signin-heading text-center"> Add Exam Information</h2>
                    </div>
                    <div class="form-group">
                    <label for="inputcourseCode" class="sr-only">Course Code</label>
                    <input type ="text" name="courseCode" id="inputcourseCode" class="form-control" placeholder="Course Code" required autofocus>
                    </div>
                    <div class="form-group">
                    <label for="inputeName" class="sr-only">Exam Name</label>
                    <input type ="text" name="eName" id="inputeName" class="form-control" placeholder="Exam Name" required autofocus>
                    </div>
                     <div class="form-group">
                    <label for="inputedate" class="sr-only">Exam Date</label>
                    <input type ="date" name="edate" id="inputedate" class="form-control" placeholder="Exam Date" required autofocus>
                    </div>
                    <div class="form-group">
                    <label for="inputyearr" class="sr-only">Year</label>
                    <input type ="number" name="yearr" id="inputyearr" class="form-control" placeholder="Yearr" required autofocus>
                    </div>
                    <div class="form-group">
                    <label for="inputsemester" class="sr-only">Semester</label>
                    <input type ="text" name="semester" id="inputsemester" class="form-control" placeholder="Semester" required autofocus>
                    </div>
                    <div class="form-group">
                    <label for="inputsectionId" class="sr-only">Section Id</label>
                    <input type ="number" name="sectionId" id="inputsectionId" class="form-control" placeholder="Section Id" required>
                    </div>
                    <div class="form-group">
                    <input type="submit" name="submitbtn" value="submit" class="btn btn-lg btn-primary btn-block">
                    </div>
                </form>
                </div>
                <div class="col-md-4 col-sm-4 col-xs-4 col-padding">
                </div>
            </div>            
        </div>
    </body>
</html>
<?php
if(isset($_POST['submitbtn'])){
    $ename=$_POST["eName"]; 
    $edate=$_POST["edate"];
    $courseCode=$_POST["courseCode"];
    $yearr=$_POST["yearr"];
    $semester=$_POST["semester"]; 
    $sectionId=$_POST["sectionId"]; 


    
    $query9= "insert into exam(eName,edate,issn,courseCode,yearr,semester,sectionId) values ('$ename','$edate','$_SESSION[ssn]','$courseCode','$yearr','$semester','$sectionId')";
    $result9= mysqli_query($conn, $query9);
        if($result9){
            echo "<br>The new exam has saved.<br><a href=exam.php>See All Exam.</a>";
        } else{ 
            echo "Error: " . $query9 . "<br>" . mysqli_error($conn);
        }
mysqli_close($conn);
}


?>
