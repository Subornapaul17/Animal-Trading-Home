<?php include('login_action.php'); ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="ThemeBucket">
    <link rel="shortcut icon" href="images/favicon.png">

    <title>Login</title>

    <!--Core CSS -->
    <link href="bs3/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-reset.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet" />

    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet" />

    <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]>
    <script src="js/ie8-responsive-file-warning.js"></script><![endif]-->

   
</head>

  <body class="login-body">

    <div class="container">

      <form class="form-signin" action="" method="post">
        <h2 style="background-color:harlequin" class="form-signin-heading">Admin sign in</h2>
        <div class="login-wrap"style="background-color:harlequin">
            <div class="user-login-info" style="background-color:Prussian blue">
                <p class="error_message"><?=$mgs?></p>
                <input type="text" id="" name="username" class="form-control" placeholder="User ID" autofocus>
                <p class="error_message" id="username_mgs"></p>
                <input type="password" id="" name="password" class="form-control" placeholder="Password">
                <p class="error_message" id="password_mgs"></p>
            </div>
            
            <button style="background-color:harlequin" class="btn btn-lg btn-login btn-block" name="submit" type="submit" id="login">Sign in</button>

            

        </div>

          <!-- Modal -->
          <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
              <div class="modal-dialog">
                  <div class="modal-content">
                      <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                          <h4 class="modal-title">Forgot Password ?</h4>
                      </div>
                      <div class="modal-body">
                          <p>Enter your e-mail address below to reset your password.</p>
                          <input type="text" name="email" placeholder="Email" autocomplete="off" class="form-control placeholder-no-fix">

                      </div>
                      <div class="modal-footer">
                          <button data-dismiss="modal" class="btn btn-default" type="button">Cancel</button>
                          <button class="btn btn-success" type="button">Submit</button>
                      </div>
                  </div>
              </div>
          </div>
          <!-- modal -->

      </form>

    </div>



    <!-- Placed js at the end of the document so the pages load faster -->

    <!--Core js-->
    <script src="js/jquery.js"></script>
    <script src="bs3/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/custom/login.js"></script>
    <script type="text/javascript" src="js/custom/message.js"></script>
    <link href="css/custom/style.css" rel="stylesheet">

  </body>
</html>
