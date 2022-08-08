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
	if(isset($_GET['image_title:'])){
	$image_title = $_GET['image_title:'];
?>
  <?php 
	$sql = (mysqli_query($con,"SELECT * FROM animal_gallery WHERE image_title = '$image_title' "));
				while($row = mysqli_fetch_assoc($sql)){
					$image_title = $row['image_title'];				
		?>
<title><?php echo $row['image_title']; ?></title>
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
	        	<li class="nav-item"><a href="disease.php" class="nav-link">Diseases</a></li>
	        	<li class="nav-item "><a href="Doctors.php" class="nav-link">Doctors</a></li>
	        	<li class="nav-item active"><a href="animal_list.php" class="nav-link">Animals</a></li>
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
          	<p class="breadcrumbs mb-2"><span class="mr-2"><a href="index.html">Home <i class="ion-ios-arrow-forward"></i></a></span> <span class="mr-2"><a href="blog.html">View Disease Info <i class="ion-ios-arrow-forward"></i></a></span></p>
            <h1 class="mb-0 bread">View Disease Info</h1>
          </div>
        </div>
      </div>
    </section>

    <section class="ftco-section ftco-degree-bg">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 ftco-animate">
		  
					<?php 
						
						$sql = (mysqli_query($con,"SELECT * FROM animal_gallery WHERE image_title='$image_title' "));
						while($row = mysqli_fetch_assoc($sql)){
							$image_title = $row['image_title'];
						   $price = $row['price'];
						   $animal_tag = $row['animal_tag'];
						   $description = $row['description'];
						   $gallery_pic = $row['gallery_pic'];
						   $animal_gallery_no = $row['animal_gallery_no'];
						
					?>
          	<p>
              <img src="admin/soft/upload/<?php echo $row['gallery_pic']; ?>" alt="" class="img-fluid">
            </p>
			
            <h1 class="mb-3"><?php echo $row['image_title']; ?></h1>
			<h2>Tag No. </h2><p><?php echo $row['animal_tag']; ?></p>
            <h2>Description:</h2> <p><?php echo $row['description']; ?></p>
            <h2>Price:</h2><p><?php echo $row['price']; ?></p>
            
			<?php } ?>
          </div> <!-- .col-md-8 -->
          <div class="col-lg-4 sidebar pl-lg-5 ftco-animate">
            <div class="sidebar-box">
              <form action="#" class="search-form">
                <div class="form-group">
                  <span class="fa fa-search"></span>
                  <input type="text" class="form-control" placeholder="Type a keyword and hit enter">
                </div>
              </form>
            </div>
            <div class="sidebar-box ftco-animate">
              <div class="categories">
                <h3>Services</h3>
                <li><a href="#">Pet Sitting <span class="fa fa-chevron-right"></span></a></li>
                <li><a href="#">Pet Daycare <span class="fa fa-chevron-right"></span></a></li>
                <li><a href="#">Pet Grooming <span class="fa fa-chevron-right"></span></a></li>
                <li><a href="#">Pet Spa <span class="fa fa-chevron-right"></span></a></li>
              </div>
            </div>
        </div>
      </div>
    </section> <!-- .section -->
	
					<?php 
						date_default_timezone_set("Asia/Dhaka");
							$date    = date('Y-m-d'); 
							$time    = date('h:i:s A');
						//====================================Add sport
						if(isset($_POST['submit'])){
							
							$d_messages  = $_POST['d_messages'];

							$sql = mysqli_query($con,"INSERT INTO `disease_comments`(`buyer_user_no`,`d_messages`, `animal_disease_no`) 
							VALUES 
							('$buyer_user_no','$d_messages','$animal_disease_no')");
							
							$gfsr = mysqli_fetch_assoc(mysqli_query($con,"SELECT * FROM animal_disease WHERE animal_disease_no = '$animal_disease_no'"));
								
								$comments_count = $gfsr['comments_count'];
								$new_count = $comments_count + 1;
								
								$sgevd = mysqli_query($con,"UPDATE animal_disease SET comments_count = '$new_count' WHERE animal_disease_no = '$animal_disease_no'"); 
							if($sql == true){
								echo '<script>
									setTimeout(function() {
										swal({
										title: "Successfully",
										text: "Commented!!! ",
										type: "success"
										}, function() {
										window.location = "";
										});
									}, 1000);
									</script>';
							}
							
							elseif($sql == true){
								echo "<script> window.open('view_disease.php?disease_name:=$disease_name&&id=$animal_disease_no','_self'); </script>";
							}
							
						}
					?>

     <?php
  include('include/footer.php');

  ?>

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


 <script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/4.4.0/bootbox.min.js" type="text/javascript"></script>
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