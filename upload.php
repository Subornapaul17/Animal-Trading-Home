 <html>
 <head>
 </head>
<body>

  <?php
  include ('db_connection.php') ;
 if(isset($_POST['useremail'])){}
     $buyer_email = $_GET['useremail'];
        $sql = mysqli_query($con,"SELECT * FROM buyer_user WHERE buyer_email = '$buyer_email' ");
          while($row= mysqli_fetch_assoc($sql))
    {   
      $buyer_email = $row['buyer_email'];
   ?>
 <form  enctype="multipart/form-data" method="POST" role="form" action="">
                     <div class="form-group col-lg-6 col-md-6 col-xs-12">
                        <label for="exampleInputFile">Upload Image Face</label>
                        <input type="file" name="file">
                        <p class="help-block">Input A Medium Size Photo</p>
                     </div>
                
                  <div style="margin-top:42px;" class="form-group col-lg-6 col-md-6 col-xs-12">
                  <button type="submit" name="submit" class="btn btn-info">Submit</button>
                  </div>
 </form>
</body>
</html>


<?php 
     if(isset($_POST['submit']))
     // $email = $_REQUEST['useremail'];
    {   
    if((($_FILES["file"]["type"]=="image/jpeg") || ($_FILES["file"]["type"]=="image/png") || ($_FILES["file"]["type"]=="image/gif"))&&($_FILES["file"]["size"] < 1048576)) {
    $filename = $_FILES['file']['name'];
    $file_basename = substr($filename, 0, strripos($filename, '.')); // get file name
    $file_ext = substr($filename, strripos($filename, '.')); // get file format
    $size = $_FILES['file']['size'];
    $type = $_FILES['file']['type'];
    $tmp_name = $_FILES['file']['tmp_name'];
    $error = $_FILES['file']['error'];
    $location = 'images/'; 
    // Rename file
    $newfilename = substr(str_shuffle(md5($file_basename)), 0, 25) . $file_ext;
    if (move_uploaded_file($tmp_name, $location.$newfilename)) {
        $ins=mysqli_query($con,"UPDATE buyer_user SET
                          buyer_image = '$newfilename' WHERE buyer_email= '$buyer_email' ");
        if($ins)
        {
      $link="animal_list.php?useremail=$buyer_email";
              
              //header('Location:' . $link . '');
            echo "<script> alert(' Successfully Uploaded!!') </script>";
      echo "<script> window.open('$link','_self'); </script>";
    }
  }

else {
  $link1="upload.php?useremail=$email";
     echo "<script> alert(' Failed!!') </script>";
      echo "<script> window.open('$link1','_self'); </script>";

 }}}} ?>
