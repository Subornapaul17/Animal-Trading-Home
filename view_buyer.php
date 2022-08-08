<?php

 require_once('admin/config/db_connection.php');


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
   <link href="ex/sweetalert.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/style.css">
	
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
	          <li class="nav-item"><a href="food.php" class="nav-link">Foods</a></li>
	          <li class="nav-item"><a href="contact.php" class="nav-link">Contact</a></li>
			  <li class="nav-item"><a href="user_seller.php" style="margin-top: 10px;" class="btn btn-primary">Sell your Animal</a></li>
			  
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
          	<p class="breadcrumbs mb-2"><span class="mr-2"><a href="index.php">Home <i class="ion-ios-arrow-forward"></i></a></span> <span class="mr-2"><a href="blog.html">View Animal Info <i class="ion-ios-arrow-forward"></i></a></span></p>
            <h1 class="mb-0 bread">View Animal Info</h1>
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
						   
						
					?>
          	<p>
              <img src="admin/soft/upload/<?php echo $row['gallery_pic']; ?>" alt="" class="img-fluid">
            </p>
			
            <h1 class="mb-3"><?php echo $row['image_title']; ?></h1>
			<h2>Price of Animal:</h2> <p><?php echo $row['price']; ?></p>
			
            <h2>Animal Tag:</h2><p><?php echo $row['animal_tag']; ?></p>
            <h2>description:</h2><p><?php echo $row['description']; ?></p>

            <div class="pt-5 mt-5">
			<div class="comment-form-wrap pt-5">
                <h3 class="mb-5">Leave a comment</h3>
                <form action="#" method="post" class="p-5 bg-light">

                  <div class="form-group">
                    <label for="message">Comment</label>
                    <textarea id="messages" name="messages" cols="30" rows="10" class="form-control"></textarea>
                  </div>
                  <div class="form-group">
                    <input type="submit" value="Post Comment" name="submit" class="btn py-3 px-4 btn-primary">
                  </div>
				  
                </form>
              </div>
              <h3 class="mb-5"></h3>
              <ul class="comment-list">
			  <?php 
			
						$sql = (mysqli_query($con," SELECT * FROM comments LEFT JOIN buyer_user ON buyer_user.buyer_user_no=comments.buyer_user_no WHERE animal_type_no=$animal_type_no ORDER BY id DESC"));
						while($row = mysqli_fetch_assoc($sql)){
						
						//$created_time = date("Y-m-d H:i:s", strtotime($created_times));				
				?>
                <li class="comment">
                  <div class="vcard bio">
                    <img src="images/<?php echo $row['buyer_image']; ?>" alt="">
                  </div>
                  <div class="comment-body">
                    <h3><?php echo $row['buyer_name']; ?></h3>
                    <div class="meta"><?php echo $row['created_time']; ?></div>
                    <p><?php echo $row['messages'];?></p>
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
            <div class="sidebar-box ftco-animate">
              <div class="categories">
                <h3>Services</h3>
                <li><a href="#">Pet Sitting <span class="fa fa-chevron-right"></span></a></li>
                <li><a href="#">Pet Daycare <span class="fa fa-chevron-right"></span></a></li>
                <li><a href="#">Pet Grooming <span class="fa fa-chevron-right"></span></a></li>
                <li><a href="#">Pet Spa <span class="fa fa-chevron-right"></span></a></li>
              </div>
            </div>

            <div class="sidebar-box ftco-animate">
              <h3>Recent Blog</h3>
              <div class="block-21 mb-4 d-flex">
                <a class="blog-img mr-4" style="background-image: url(images/image_1.jpg);"></a>
                <div class="text">
                  <h3 class="heading"><a href="#">Animal Care Attendants are responsible for the day-to-day care of medical boarding and Stay-the-Day pets.</a></h3>
                  <div class="meta">
                    <div><a href="#"><span class="icon-calendar"></span> April 7, 2020</a></div>
                    <div><a href="#"><span class="icon-person"></span> Admin</a></div>
                    <div><a href="#"><span class="icon-chat"></span> 19</a></div>
                  </div>
                </div>
              </div>
              <div class="block-21 mb-4 d-flex">
                <a class="blog-img mr-4" style="background-image: url(images/image_2.jpg);"></a>
                <div class="text">
                  <h3 class="heading"><a href="#">monitor animals' health,clean out kennels or cages,prepare food and help out at feeding times,clean and groom animals.</a></h3>
                  <div class="meta">
                    <div><a href="#"><span class="icon-calendar"></span> April 7, 2020</a></div>
                    <div><a href="#"><span class="icon-person"></span> Admin</a></div>
                    <div><a href="#"><span class="icon-chat"></span> 19</a></div>
                  </div>
                </div>
              </div>
              <div class="block-21 mb-4 d-flex">
                <a class="blog-img mr-4" style="background-image: url(images/image_3.jpg);"></a>
                <div class="text">
                  <h3 class="heading"><a href="#">CAT_CARE:Provide plenty of human companionship,Provide regular, suitable meals with a constant supply of fresh water.Provide a clean and comfortable bed.</a></h3>
                  <div class="meta">
                    <div><a href="#"><span class="icon-calendar"></span> April 7, 2020</a></div>
                    <div><a href="#"><span class="icon-person"></span> Admin</a></div>
                    <div><a href="#"><span class="icon-chat"></span> 19</a></div>
                  </div>
                </div>
              </div>
            </div>

            <div class="sidebar-box ftco-animate">
              <h3>Tag Cloud</h3>
              <div class="tagcloud">
                <a href="#" class="tag-cloud-link">cat</a>
                <a href="#" class="tag-cloud-link">dog</a>
                <a href="#" class="tag-cloud-link">pet</a>
                <a href="#" class="tag-cloud-link">bird</a>
                <a href="#" class="tag-cloud-link">husky</a>
                <a href="#" class="tag-cloud-link">bulldog</a>
                <a href="#" class="tag-cloud-link">food</a>
              </div>
            </div>

            <div class="sidebar-box ftco-animate">
              <h3>Paragraph</h3>
              <p>Animals have been human's closest companions for a very long time. We have depended on them for food labor and security. Every animal needs to be taken good care of, given food, shelter and veterinary care, this way humans show commitment towards animals.</p>
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
							
							$messages  = $_POST['messages'];

							$sql = mysqli_query($con,"INSERT INTO `comments`(`buyer_user_no`,`messages`, `animal_type_no`) 
							VALUES 
							('$buyer_user_no','$messages','$animal_type_no')");
							
							$gfsr = mysqli_fetch_assoc(mysqli_query($con,"SELECT * FROM animal_type WHERE animal_type_no = '$animal_type_no'"));
								
								$comments_count = $gfsr['comments_count'];
								$new_count = $comments_count + 1;
								
								$sgevd = mysqli_query($con,"UPDATE animal_type SET comments_count = '$new_count' WHERE animal_type_no = '$animal_type_no'"); 
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
								echo "<script> window.open('view_animal.php?ear_tag:=$ear_tag&&id=$animal_type_no','_self'); </script>";
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