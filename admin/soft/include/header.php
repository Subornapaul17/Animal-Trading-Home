<?php session_start();
if(empty($_SESSION['user'])){
    header('Location:../index.php');
    exit;
}
?>
<?php include('../config/db_connection.php');?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="ThemeBucket">
    <link rel="shortcut icon" href="../images/favicon.png">
    <title>Animal-Farm-Admin</title>
    <!--Core CSS -->
    <link href="../bs3/css/bootstrap.min.css" rel="stylesheet">
    <link href="../js/jquery-ui/jquery-ui-1.10.1.custom.min.css" rel="stylesheet">

    <link href="../css/bootstrap-reset.css" rel="stylesheet">
    <link href="../font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="../js/jvector-map/jquery-jvectormap-1.2.2.css" rel="stylesheet">
    <link href="../css/clndr.css" rel="stylesheet">
    <!--clock css-->
    <link href="../js/css3clock/css/style.css" rel="stylesheet">
    <!--Morris Chart CSS -->
    <link rel="stylesheet" href="../js/morris-chart/morris.css">
    <!-- Custom styles for this template -->
    <link href="../css/custom/style.css" rel="stylesheet">
    <link href="../css/style.css" rel="stylesheet">
    <link href="../css/style-responsive.css" rel="stylesheet" />
    <!-- rich text -->
    <script src="https://cdn.tiny.cloud/1/jiw1qps0d29603yegbh6nxnftjfhfjelturftc8dasuy6p8s/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
	
    <script type="text/javascript">
            tinymce.init({selector:'textarea'});
    </script>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
   
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap.min.css"/>
   
    <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]>
    <script src="js/ie8-responsive-file-warning.js"></script><![endif]-->
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>

<body>
    <section id="container">
        <!--header start-->
        <header class="header fixed-top clearfix">
            <!--logo start-->
            <div class="brand">

                <a href="#" class="logo img-responsive">
                    <img src="../images/logo.png" height="50px" width="100%" alt="">
                </a>
                <h1 class="logo_name">The DAFMS</h1>
                <div class="sidebar-toggle-box">
                    <div class="fa fa-bars"></div>
                </div>
            </div>
            <!--logo end-->

            <div class="nav notify-row" id="top_menu">
                <!--  notification start -->
                <ul class="nav top-menu">
                    <!-- settings start -->

                    <!-- settings end -->
                    <!-- inbox dropdown start-->
                    
                    <!-- inbox dropdown end -->
                    <!-- notification dropdown start-->
                    
                    <!-- notification dropdown end -->
                </ul>
                <!--  notification end -->
            </div>
            <div class="top-nav clearfix">
                <!--search & user info start-->
                <ul class="nav pull-right top-menu">

                    <!-- user login dropdown start-->
                    <li class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <i class="fa fa-user"></i>
                            <span class="username"><?=$_SESSION['user']['user_name']?><span>
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu extended logout">
                            <li><a href="../logout.php"><i class="fa fa-key"></i> Log Out</a></li>
                        </ul>
                    </li>
                    <!-- user login dropdown end -->

                </ul>
                <!--search & user info end-->
            </div>
        </header>
        <!--header end-->