<?php
  include('db_connection.php');
  
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
    <title>Services</title>
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
  </head>
  <body>

    <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	    	<a class="navbar-brand" href="index.php"><span class="flaticon-pawprint-1 mr-2"></span>Domestic</a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="fa fa-bars"></span> Menu
	      </button>
	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	     
			  
			  <li class="nav-item"><a href="index.php" class="nav-link">Home</a></li>
	        	<li class="nav-item active"><a href="services.php" class="nav-link">Services</a></li>
	        	<li class="nav-item"><a href="disease.php" class="nav-link">Diseases</a></li>
	        	<li class="nav-item"><a href="doctors.php" class="nav-link">Doctors</a></li>
	        	<li class="nav-item"><a href="animal_list.php" class="nav-link">Animals</a></li>
	          <li class="nav-item"><a href="gallery.php" class="nav-link">Gallery</a></li>
	          <li class="nav-item"><a href="food.php" class="nav-link">Foods</a></li>
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
            <li style="color: blue;" class="nav"><a href="user_seller.php" class="btn btn-primary nav-link">Buy This Farm</a></li>
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
          	<p class="breadcrumbs mb-2"><span class="mr-2"><a href="index.html">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Services <i class="ion-ios-arrow-forward"></i></span></p>
            <h1 class="mb-0 bread">Services</h1>
          </div>
        </div>
      </div>
    </section>

    <section class="ftco-section ftco-no-pt ftco-no-pb">
    	<div class="container">
    		<div class="row d-flex no-gutters">
    			<div class="col-md-5 d-flex">
    				<div class="img img-video d-flex align-self-stretch align-items-center justify-content-center justify-content-md-center mb-4 mb-sm-0" style="background-image:url(images/about-1.jpg);">
    				</div>
    			</div>
    			<div class="col-md-7 pl-md-5 py-md-5">
    				<div class="heading-section pt-md-5">
	            <h2 class="mb-4">Our services</h2>
    				</div>
    				<div class="row">
	    				<div class="col-md-6 services-2 w-100 d-flex">
	    					<div class="icon d-flex align-items-center justify-content-center"><span class="flaticon-stethoscope"></span></div>
	    					<div class="text pl-3">
	    						<h4>You Can Contact Veterinary</h4>
	    						<p></p>
	    					</div>
	    				</div>
	    				<div class="col-md-6 services-2 w-100 d-flex">
	    					<div class="icon d-flex align-items-center justify-content-center"><span class="flaticon-customer-service"></span></div>
	    					<div class="text pl-3">
	    						<h4>Food Information</h4>
	    						<p></p>
	    					</div>
	    				</div>
	    				<div class="col-md-6 services-2 w-100 d-flex">
	    					<div class="icon d-flex align-items-center justify-content-center"><span class="flaticon-emergency-call"></span></div>
	    					<div class="text pl-3">
	    						<h4>Buy and Sell Animal</h4>
	    						<p></p>
	    					</div>

	    				</div>
	    				<div class="col-md-6 services-2 w-100 d-flex">
	    					<div class="icon d-flex align-items-center justify-content-center"><span class="flaticon-veterinarian"></span></div>
	    					<div class="text pl-3">
	    						<h4>Disease Information</h4>
	    						<p></p>
	    					</div>
	    				</div>
						<div class="col-md-6 services-2 w-100 d-flex">
	    					<div class="icon d-flex align-items-center justify-content-center"><span class="flaticon-emergency-call"></span></div>
	    					<div class="text pl-3">
	    						<h4>You can contact us aytime</h4>
	    						<p></p>
	    					</div>
	    			</div>
	        </div>
        </div>
    	</div>
    </section>

    <section class="ftco-section bg-light">
    	<div class="container">
    		<div class="row mb-5 pb-5">
			<?php 
			$sql = (mysqli_query($con, "SELECT * FROM add_services WHERE add_services.is_deleted !='1' ORDER BY service_id DESC "));
			while($row=mysqli_fetch_assoc($sql)){
				$date=$row['created_on'];
				$date=$row['service_name'];
				$date=$row['details'];
				
				$today=date("Y-m-d");
			
			?>
          <div class="col-md-4 d-flex align-self-stretch px-4 ftco-animate">
            <div class="d-block services text-center">
              <div class="icon d-flex align-items-center justify-content-center">
            		<span class="flaticon-blind"></span>
              </div>
              <div class="media-body p-4">
                <h3 class="heading"><?php echo $row['service_name']; ?></h3>
                <p><?php echo $row['details']; ?></p>
                <a href="#" class="btn-custom d-flex align-items-center justify-content-center"><span class="fa fa-chevron-right"></span><i class="sr-only">Read more</i></a>
              </div>
            </div>      
          </div>
		  
		  <?php } ?>
		  
        </div>
        
    	</div>
    </section>

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

    
  </body>
</html>