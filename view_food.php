<?php

 require_once('admin/config/db_connection.php');

       session_start();
$buyer_email = $_SESSION['buyer_email'];
 $buyer_user_no = $_SESSION['buyer_user_no'];

if(!isset($_SESSION['buyer_email'])){
    header("location: login.php");
}
 ?>
<!DOCTYPE html>
<html lang="en">
  <head>
  <?php
	
	if(isset($_GET['food:'])){
	$food = $_GET['food:'];
?>
  <?php 
	
	$sql = (mysqli_query($con,"SELECT * FROM food WHERE food = '$food' "));
				while($row = mysqli_fetch_assoc($sql)){
			
						  $food = $row['food'];
						   $day_time = $row['day_time'];
						   $from_time = $row['from_time'];
						   $to_time = $row['to_time'];
						   $age_wise_food = $row['age_wise_food'];				
		?>
<title><?php echo $row['food']; ?></title>
				<?php } ?>
				
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Montserrat:200,300,400,500,600,700,800&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
 
    <link rel="stylesheet" href="css/animate.css">
    
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">


    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">

    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="ex/sweetalert.css">
	
  </head>
  <body>

		<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	    	<a class="navbar-brand" href="index.php"><span class="flaticon-pawprint-1 mr-2"></span>TDAF</a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="fa fa-bars"></span> Menu
	      </button>
	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	        	<li class="nav-item"><a href="index.php" class="nav-link">Home</a></li>
	        	<li class="nav-item"><a href="about.php" class="nav-link">About</a></li>
	        	<li class="nav-item"><a href="disease.php" class="nav-link">Diseases</a></li>
				<li class="nav-item"><a href="doctors.php" class="nav-link">Doctors</a></li>
	        	<li class="nav-item"><a href="animal_list.php" class="nav-link">Animals</a></li>
	          <li class="nav-item"><a href="gallery.php" class="nav-link">Gallery</a></li>
	          <li class="nav-item active"><a href="food.php" class="nav-link">Foods</a></li>
	          <li class="nav-item"><a href="contact.php" class="nav-link">Contact</a></li>
			  <div class="dropdown">
                            <?php 
                                $sql = mysqli_query($con,"SELECT * FROM buyer_user WHERE buyer_email = '$buyer_email' ");
                               while($row= mysqli_fetch_assoc($sql))

                                {   
                                  $buyer_image = $row['buyer_image'];
                                   $buyer_name = $row['buyer_name'];
                                  
                                  $r = '';
                                  $w = ' ';
                                  ?>
                              <div class="nav-item" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 
                                <?php 
                                  if ($buyer_image == $r){

                                  echo '<a class="nav-link waves-effect waves-dark" href="#"><img style="height:45px;width:45px; margin-right: -60px; margin-bottom: -50px;"" class="profile-pic img-circle" src="images/user.jpg"></a>'; ?><a class="nav-link" style="color:red; padding-left:60px; margin-top: -30px;"><?php echo $buyer_name ;?></a>
                                  <?php 

                              }
                               else{ echo 
                               '<a class="nav-link waves-effect waves-dark" href="#"><img style="height:45px; width:45px; margin-right: -60px; margin-bottom: -50px;" class="profile-pic img-circle" src="images/'?><?php echo $buyer_image;?>"> <a class="nav-link" style="color:red; padding-left:60px; margin-top: -30px;"><?php echo $buyer_name ;?></a><?php '</a>'; }}?>
                                  
                              
                              </div>
                              <div class="dropdown-menu" aria-labelledby="dropdownMenuButton" style="margin-top: -29px;">

                                <?php
                                    $getcontacts = mysqli_query($con,"SELECT * FROM buyer_user WHERE buyer_email= '$buyer_email'");
                                    while ($contacts=mysqli_fetch_array($getcontacts)) {
                                    ?>
                                <a class="dropdown-item" href="upload.php?useremail=<?php echo $contacts['buyer_email'] ; }?>">Add Picture</a><br>
                                <a class="dropdown-item" style="margin-top:-25px" href="profile.php">View Profile</a><br>
                                <a class="dropdown-item" style="margin-top:-25px" href="logout.php">Logout</a>
                              </div>
                        </div>
	        </ul>
	      </div>
	    </div>
	  </nav>
    <!-- END nav -->
    <section class="hero-wrap hero-wrap-2" style="background-image: url('images/bg_2.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs mb-2"><span class="mr-2"><a href="index.php">Home <i class="ion-ios-arrow-forward"></i></a></span> <span class="mr-2"><a href="blog.html">View Food Info <i class="ion-ios-arrow-forward"></i></a></span></p>
            <h1 class="mb-0 bread">View Food Info</h1>
          </div>
        </div>
      </div>
    </section>

    <section class="ftco-section ftco-degree-bg">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 ftco-animate">
		  
					<?php 
						
						$sql = (mysqli_query($con,"SELECT * FROM food WHERE food='$food' "));
						while($row = mysqli_fetch_assoc($sql)){
							$food = $row['food'];
						   $day_time = $row['day_time'];
						   $from_time = $row['from_time'];
						   $to_time = $row['to_time'];
						   $food_pic = $row['food_pic'];
						   $age_wise_food = $row['age_wise_food'];
						   $food_no = $row['food_no'];
						   $quantity = $row['quantity'];
						
					?>
          	<p>
              <img src="admin/soft/upload/<?php echo $row['food_pic']; ?>" alt="" class="img-fluid">
            </p>
			
            <h1 class="mb-3"><?php echo $row['food']; ?></h1>
            <h2>Day Time:</h2> <p><?php echo $row['day_time']; ?></p>
            <h2>From Time :</h2><p><?php echo $row['from_time']; ?></p>
            <h2>To Time:</h2><p><?php echo $row['to_time']; ?></p>
            <h2>Quantity:</h2><p><?php echo $row['quantity']; ?></p>
            <h2>Age Wise Food:</h2><p><?php echo $row['age_wise_food']; ?></p>
            
            

            <div class="pt-5 mt-5">
			<div class="comment-form-wrap pt-5">
                <h3 class="mb-5">Leave a comment</h3>
                <form action="#" method="post" class="p-5 bg-light">
				
                  <div class="form-group">
                    <label for="message">Message</label>
                    <textarea id="f_messages" name="f_messages" cols="30" rows="10" class="form-control"></textarea>
                  </div>
                  <div class="form-group">
                    <input type="submit" value="Post Comment" name="submit" class="btn py-3 px-4 btn-primary">
                  </div>
				  

                </form>
              </div>
              <h3 class="mb-5">6 Comments</h3>
              <ul class="comment-list">
			  
                <?php 
			
						$sql = (mysqli_query($con," SELECT * FROM food_comments LEFT JOIN buyer_user ON buyer_user.buyer_user_no=food_comments.buyer_user_no WHERE food_no=$food_no ORDER BY id DESC"));
						while($row = mysqli_fetch_assoc($sql)){
						
						//$created_time = date("Y-m-d H:i:s", strtotime($created_times));				
				?>
                <li class="comment">
                  <div class="vcard bio">
                    <img src="images/<?php echo $row['buyer_image']; ?>" alt="Image placeholder">
                  </div>
                  <div class="comment-body">
                    <h3><?php echo $row['buyer_name']; ?></h3>
                    <div class="meta"><?php echo $row['created_time']; ?></div>
                    <p><?php echo $row['f_messages'];?></p>
                    <!--p><a href="#" class="reply">Reply</a></p!-->
                  </div>
                </li>
				<?php } ?>
              </ul>
              <!-- END comment-list -->
              
            </div>
						<?php } ?>
          </div> <!-- .col-md-8 -->
          

        </div>
      </div>
    </section> <!-- .section -->
					<?php 
						date_default_timezone_set("Asia/Dhaka");
							$date    = date('Y-m-d'); 
							$time    = date('h:i:s A');
						//====================================Add sport
						if(isset($_POST['submit'])){
							
							$f_messages  = $_POST['f_messages'];

							$sql = mysqli_query($con,"INSERT INTO `food_comments`(`buyer_user_no`,`f_messages`, `food_no`) 
							VALUES 
							('$buyer_user_no','$f_messages','$food_no')");
							
							$gfsr = mysqli_fetch_assoc(mysqli_query($con,"SELECT * FROM food WHERE food_no = '$food_no'"));
								
								$comments_count = $gfsr['comments_count'];
								$new_count = $comments_count + 1;
								
								$sgevd = mysqli_query($con,"UPDATE food SET comments_count = '$new_count' WHERE food_no = '$food_no'"); 
							if($sql == true){
								echo '<script>
									setTimeout(function() {
										swal({
										title: "Item",
										text: "Has Been Added! ",
										type: "success"
										}, function() {
										window.location = "";
										});
									}, 1000);
									</script>';
							}
							
							elseif($sql == true){
								echo "<script> window.open('view_food.php?food:=$food&&id=$food_no','_self'); </script>";
							}
							
						}
					?>

     <?php
  include('include/footer.php');

  ?>
    
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="js/jquery.min.js"></script>
  <script src="js/jquery-migrate-3.0.1.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/jquery.waypoints.min.js"></script>
  <script src="js/jquery.stellar.min.js"></script>
  <script src="js/jquery.animateNumber.min.js"></script>
  <script src="js/bootstrap-datepicker.js"></script>
  <script src="js/jquery.timepicker.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="js/google-map.js"></script>
  <script src="js/main.js"></script>

 <!-- Sweet Alert Plugin Js -->
    <script src="ex/sweetalert.min.js"></script>
    
  </body>
</html>
<?php } ?>