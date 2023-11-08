<?php
session_start();
include ("dbconnection.php");
?>
<!DOCTYPE html>
<html>
<head>
	<title>Teacher Home</title>
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<div class="row">
   		<?php if(isset($_REQUEST['error'])) { ?>
   		<div class="col-lg-12">.col-lg-12
   			<span class="alert alert-danger" style="display: block;">
   				<?php echo $_REQUEST['error']; ?>	
			</span>
   		</div>
	   	<?php } ?>
	 </div>
	 <div class="row">
   		<?php if(isset($_REQUEST['success'])) { ?>
   		<div class="col-lg-12">.col-lg-12
   			<span class="alert alert-success" style="display: block;">
   				<?php echo $_REQUEST['success']; ?>	
			</span>
   		</div>
	   	<?php } ?>
	 </div>
	<div class="row">
		<a href="course.php" class="btn btn-success" style="margin:10px;">Course Name and Student Name</a>
		<a href="weeklyschedule.php" class="btn btn-success" style="margin:10px;">Weekly Schedule</a>
                <a href="projectlead.php" class="btn btn-success" style="margin:10px;">Leading Of Project</a>
                <a href="projectworking.php" class="btn btn-success" style="margin:10px;">Working Of Project</a>
                <a href="advising.php" class="btn btn-success" style="margin:10px;">Advising Student</a>
                <a href="supervising.php" class="btn btn-success" style="margin:10px;">Graduate Student Supervises</a>
                <a href="freehourreport.php" class="btn btn-success" style="margin:10px;">Free Hour Report</a>
                <a href="Exam.php" class="btn btn-success" style="margin:10px;">Exam</a>
	</div>
	
</div>
</body>
</html>
