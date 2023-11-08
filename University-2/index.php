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
        <h1 style="text-align:center">Işık University E-campus</h1>
        <div class="container">
            <div class="row">
                <div class="row">
   	        </div>
                
                <div class="col-md-4 col-sm-4 col-xs-4 col-padding">
                </div>
                <div class="col-md-4 col-sm-4 col-xs-4 col-padding">
                 <form class="form_signin" action="login.php" method="post">
                    <div class="form-group">
                    <h2 class="form-signin-heading text-center"> Please Login in</h2>
                    </div>
                    <div class="form-group">
                    <label for="inputSsn" class="sr-only">Ssn Number</label>
                    <input type ="text" name="ssn" id="inputSsn" class="form-control" placeholder="Ssn Number" required autofocus>
                    </div>
                    <div class="form-group">
                    <label for="inputPassword" class="sr-only">Password</label>
                    <input type ="password" name="password" id="inputPassword" class="form-control" placeholder="Password" required>
                    </div>
                    <div class="form-group">
                    <button class="btn btn-lg btn-primary btn-block" type="submit">Login in</button> 
                    </div>
                    <span> <?php
                    if (isset($_SESSION['message'])){
                        echo $_SESSION['message'];
                    }
                    unset($_SESSION['message']);
                    ?></span>
                </form>
                </div>
                <div class="col-md-4 col-sm-4 col-xs-4 col-padding">
                </div>
            </div>            
        </div>
    </body>
</html>