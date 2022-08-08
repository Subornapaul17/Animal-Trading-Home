<?php
   include('db_connection.php');

  if (isset($_POST['submit'])) {
    $seller_name = $_POST['seller_name'];
  $seller_email = $_POST['seller_email'];
  $seller_phone = $_POST['seller_phone'];
  $seller_address = $_POST['seller_address'];
  $price = $_POST['price'];
	$seller_active_from=date('Y-m-d H:i:s'); 
	
    if ($_FILES["animal_pic"]["error"] > 0) {
                    $animal_pic = "No .jpg";
                    
                } else {
                    $animal_pic = time().$_FILES["animal_pic"]["name"];
                    move_uploaded_file($_FILES["animal_pic"]["tmp_name"],"admin/soft/upload/" . $animal_pic);
                }
    

 $login_query = "INSERT INTO seller_info(seller_name, seller_email, seller_phone, seller_address,animal_pic, price,created_on) VALUES ('$seller_name', '$seller_email', '$seller_phone', '$seller_address','$animal_pic','$price','$seller_active_from')";
  $login = mysqli_query($con,$login_query);

    echo "Successfully submitted!!!";
	echo "<script> alert('Thanks for willing to sell your animals. We will contact you very soon! !!') </script>";
   echo "<script> window.open('user_seller.php','_self'); </script>";
 
  
}
  else{
      echo "<script> alert(' Incorrect information, try again !!') </script>";
      echo "<script> window.open('signup.php','_self'); </script>";
    }
?>         