<?php
session_start();
  include ("dbconnection.php");

$_SESSION['ssn']=$_POST['ssn'];
$query = "SELECT * FROM userr WHERE ssn='$_SESSION[ssn]'";
$result= mysqli_query($conn, $query);

	if(mysqli_num_rows($result)>0){
		$data=mysqli_fetch_assoc($result);
		$_SESSION['user_data']=$data;
		if($data['role']=='instructor'){
			header("Location:instructor.php");	
		}else{
	            header("Location:student.php");
		} 
        }else{
            $_SESSION['message']="Login Failed. User Not Found!";
            header("Location:index.php");		
	}
?>