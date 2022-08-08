<?php

  include('admin/config/db_connection.php');

if(isset($_POST['submit'])){
  $services = $_POST['services'];
  $consul_name = $_POST['consul_name'];
  $consul_email = $_POST['consul_email'];
  $consul_date = $_POST['consul_date'];
  $consul_time = $_POST['consul_time'];
  $consul_message = $_POST['consul_message'];
  $buyer_active_from=date('Y-m-d H:i:s');

  $login_query = "INSERT INTO consul_data(services, consul_name, consul_email, consul_date,consul_time, consul_message,created_on) VALUES ('$services', '$consul_name', '$consul_email', '$consul_date','$consul_time','$consul_message','$buyer_active_from')";

  $login = mysqli_query($con,$login_query);

   echo "<script> alert(' Successfully Messaged. Soon we will contact you. Thank you !!') </script>";
   echo "<script> window.open('disease.php','_self'); </script>";
 
}
  else{
      echo "<script> alert(' Incorrect information, try again !!') </script>";
      echo "<script> window.open('disease.php','_self'); </script>";
    }
?>         