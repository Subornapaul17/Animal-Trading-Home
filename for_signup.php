<?php

  include('db_connection.php');

if(isset($_POST['submit'])){

  $buyer_name = $_POST['buyer_name'];
  $buyer_email = $_POST['buyer_email'];
  $buyer_phone = $_POST['buyer_phone'];
  $buyer_address = $_POST['buyer_address'];
  $buyer_active_from=date('Y-m-d H:i:s'); 
  $password = $_POST['password'];
  $password2 = $_POST['password2'];
  
 if($password==$password2 && strlen($password) > 5){
  $password = ($password);
 
  $login_query = "INSERT INTO buyer_user(buyer_name, buyer_email, buyer_phone, buyer_address, password) VALUES ('$buyer_name', '$buyer_email','$buyer_phone','$buyer_address','$password')";
  $login = mysqli_query($con,$login_query);

	echo "<script> alert('Successfully Registered!!!!!') </script>";
   echo "<script> window.open('homepage.php','_self'); </script>";
 
  }
}
  else{
      echo "<script> alert(' Incorrect information, try again !!') </script>";
      echo "<script> window.open('signup.php','_self'); </script>";
    }
?>         