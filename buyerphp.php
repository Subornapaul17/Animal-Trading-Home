<?php

  include('db_connection.php');

if(isset($_POST['submit'])){

  $buyer_name = $_POST['buyer_name'];
  $buyer_email = $_POST['buyer_email'];
  $buyer_phone = $_POST['buyer_phone'];
  $buyer_address = $_POST['buyer_address'];
  $animal_gallery_no = $_POST['animal_gallery_no'];
  $buyer_active_from=date('Y-m-d H:i:s');
 
	$login_query = "INSERT INTO buyer_info(buyer_name, buyer_email, buyer_phone, buyer_address,animal_gallery_no, created_on) VALUES ('$buyer_name', '$buyer_email', '$buyer_phone', '$buyer_address','$animal_gallery_no','$buyer_active_from')";
  $login = mysqli_query($con,$login_query);

	echo "<script> alert(' Thanks for willing to buy our animals. We will contact you very soon! ') </script>";
   echo "<script> window.open('buyer.php','_self'); </script>";
 
}
  else{
      echo "<script> alert(' Incorrect information, try again !!') </script>";
      echo "<script> window.open('buyer.php','_self'); </script>";
    }
?>         