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
	if(isset($_GET['disease_name:'])){
	$disease_name = $_GET['disease_name:'];
?>
  <?php 
	$sql = (mysqli_query($con,"SELECT * FROM animal_disease WHERE disease_name = '$disease_name' "));
				while($row = mysqli_fetch_assoc($sql)){
					$disease_name = $row['disease_name'];				
		?>
<title><?php echo $row['disease_name']; ?></title>
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
	        	<li class="nav-item active"><a href="disease.php" class="nav-link">Diseases</a></li>
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
          	<p class="breadcrumbs mb-2"><span class="mr-2"><a href="index.php">Home <i class="ion-ios-arrow-forward"></i></a></span> <span class="mr-2"><a href="blog.html">View Disease Info <i class="ion-ios-arrow-forward"></i></a></span></p>
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
						
						$sql = (mysqli_query($con,"SELECT * FROM animal_disease LEFT JOIN add_animal ON add_animal.animal_no=animal_disease.animal_no WHERE disease_name='$disease_name' "));
						while($row = mysqli_fetch_assoc($sql)){
							$disease_name = $row['disease_name'];
							$disease_pic = $row['disease_pic'];
						   $description = $row['description'];
						   $causes = $row['causes'];
						   $affected_animal = $row['affected_animal'];
						   $symptom = $row['symptom'];
						   $impacts = $row['impacts'];
						   $prevention = $row['prevention'];
						   $animal_disease_no = $row['animal_disease_no'];
						
					?>
          	<!--p>
              <img src="images/image_1.jpg" alt="" class="img-fluid">
            </p!-->
			
            <h1 class="mb-3"><?php echo $row['disease_name']; ?></h1>
			<p>
              <img src="admin/soft/upload/<?php echo $row['disease_pic']; ?>" alt="" class="img-fluid">
            </p>
            <h2>Description:</h2> <p><?php echo $row['description']; ?></p>
            <h2>Causes:</h2><p><?php echo $row['causes']; ?></p>
            <h2>Affected Animal:</h2><p><?php echo $row['affected_animal']; ?></p>
            <h2>Symptom:</h2><p><?php echo $row['symptom']; ?></p>
            <h2>Impacts:</h2><p><?php echo $row['impacts']; ?></p>
            <h2>Prevention:</h2><p><?php echo $row['prevention']; ?></p>
            

            <div class="pt-5 mt-5">
			<div class="comment-form-wrap pt-5">
                <h3 class="mb-5">Leave a comment</h3>
                <form action="#" method="post" class="p-5 bg-light">

                  <div class="form-group">
                    <label for="message">Comment</label>
                    <textarea id="d_messages" name="d_messages" cols="30" rows="10" class="form-control"></textarea>
                  </div>
                  <div class="form-group">
                    <input type="submit" value="Post Comment" name="submit" class="btn py-3 px-4 btn-primary">
                  </div>
				  
                </form>
              </div>
			  
              <h3 class="mb-5">6 Comments</h3>
              <ul class="comment-list">
			  <?php 
			
						$sql = (mysqli_query($con," SELECT * FROM disease_comments LEFT JOIN buyer_user ON buyer_user.buyer_user_no=disease_comments.buyer_user_no WHERE animal_disease_no=$animal_disease_no ORDER BY id DESC"));
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
                    <p><?php echo $row['d_messages'];?></p>
                    <!--p><a href="#" class="reply">Reply</a></p!-->
                  </div>
                </li>
				<?php } ?>
              </ul>
              <!-- END comment-list -->
              
              
            </div>
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