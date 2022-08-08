<?php

  include('db_connection.php');

if(isset($_POST['submit'])){

  $contact_name = $_POST['contact_name'];
  $contact_email = $_POST['contact_email'];
  $contact_phone = $_POST['contact_phone'];
  $contact_address = $_POST['contact_address'];
  $message = $_POST['message'];
  $buyer_active_from=date('Y-m-d H:i:s');
 
	$login_query = "INSERT INTO contact(contact_name, contact_email, contact_phone, contact_address,message, created_on) VALUES ('$contact_name', '$contact_email', '$contact_phone', '$contact_address','$message','$buyer_active_from')";
  $login = mysqli_query($con,$login_query);

    echo "<script> alert(' Successfully Messaged. Soon we will contact you. Thank you !!') </script>";
   echo "<script> window.open('contact.php','_self'); </script>";
 
}
  else{
      echo "<script> alert(' Incorrect information, try again !!') </script>";
      echo "<script> window.open('contact.php','_self'); </script>";
    }
?>         