<?php
  include('db_connection.php');

if(isset($_POST['submit'])){

  $buyer_email = $_POST['buyer_email'];
  $password = $_POST['password'];

  $login_query = mysqli_query($con,"SELECT * FROM buyer_user WHERE buyer_email = '$buyer_email' AND password = '$password' LIMIT 1");
  //$login = mysqli_query($con,$login_query);

  $count = mysqli_num_rows($login_query);

  if($count == 1){

    $row= mysqli_fetch_assoc($login_query);
    
      $buyer_email = $row['buyer_email'];
      $buyer_user_no = $row['buyer_user_no'];
    
          echo "<script> window.open('index.php','_self'); </script>";

    session_start();
    $_SESSION['buyer_email'] = $buyer_email;
    $_SESSION['buyer_user_no'] = $buyer_user_no;
    //echo $USER_ID ;
    exit();
  }
  else{
      echo "<script> alert(' Incorrect information, try again !!') </script>";
      echo "<script> window.open('login.php','_self'); </script>";
    }


}
?>



