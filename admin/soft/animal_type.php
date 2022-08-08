<?php include 'include/header.php';?>
<?php $table_heading = "Animal Type Setup";?>
<?php include 'include/sidebar.php';?>
<?php include 'include/body-top.php';?>
<?php
    $tbl_name="animal_type";        //your table name
    $targetpage = "animal_type.php";  //your file name  (the name of this file)
    $user_no =$_SESSION['user']['user_no'];
    $CURR_TIME = date('Y-m-d H:i:s'); 
        $mgs = '';
        

    if(isset($_GET['delete']))
    {
        $ID = $_GET['delete'];
        $sql = "UPDATE $tbl_name SET `is_deleted` = 1 ,`deleted_by` = '$user_no', `deleted_on` = '$CURR_TIME' WHERE animal_type_no = $ID";
        $result = mysqli_query($con,$sql);
        if($result)
        {
            $mgs = "Data Delete Successfully!";
            $class = "green_publisher_name alert alert-success col-md-6 alert-dismissable";
        }
        else
        {
            $mgs = "Data Delete Fail!";
            $class = "red_publisher_name alert alert-warning alert-dismissable col-md-6";
        }
    }
    if(isset($_POST['submit']))
    {		$animal_no = $_POST['animal_no'];
           $ear_tag = mysqli_real_escape_string($con,trim($_POST['ear_tag']));
		   $dob = $_POST['dob'];
           $age = mysqli_real_escape_string($con,trim($_POST['age']));
           $color = mysqli_real_escape_string($con,trim($_POST['color']));
           $breed = mysqli_real_escape_string($con,trim($_POST['breed']));
           $weight = trim($_POST['weight']);

           $SQL = "SELECT * FROM $tbl_name WHERE `is_deleted` = 0 AND `ear_tag` = '$ear_tag'  AND `animal_no` = '$animal_no'";
            $COUNT = mysqli_num_rows(mysqli_query($con,$SQL));
            if($COUNT < 1):
                if ($_FILES["image_animal"]["error"] > 0) {
                    $image_animal = "No .jpg";
                    
                } else {
                    $image_animal = time().$_FILES["image_animal"]["name"];
                    move_uploaded_file($_FILES["image_animal"]["tmp_name"],"upload/" . $image_animal);
                }
                
                
      $sql = "INSERT INTO $tbl_name ( `animal_no` , `ear_tag`,`dob`, `age`,`color`,`breed`,`weight`,`image_animal`, `created_by` , `created_on`) 
	  VALUES( '$animal_no','$ear_tag' , '$dob','$age','$color','$breed','$weight','$image_animal','$user_no', '$CURR_TIME')";
                $result = mysqli_query($con,$sql);
                if($result)
                {
                    $mgs = "Data Insert Successfully!";
                    $class = "green_publisher_name alert alert-success col-md-6 alert-dismissable";
                }
                else
                {
                    $mgs = "Data Insert Fail!";
                    $class = "red_publisher_name alert alert-warning alert-dismissable col-md-6";
                }
            else:
                $mgs = "Duplicate Entry!";
                $class = "red_publisher_name alert alert-warning alert-dismissable col-md-6 alert alert-warning alert-dismissable col-md-6";
            endif;
    }
    if(isset($_POST['update']))
    {
            $animal_type_no = $_POST['animal_type_no'];
            $animal_no = $_POST['animal_no'];
           $ear_tag = mysqli_real_escape_string($con,trim($_POST['ear_tag']));
		   $dob = $_POST['dob'];
           $age = mysqli_real_escape_string($con,trim($_POST['age']));
           $color = mysqli_real_escape_string($con,trim($_POST['color']));
           $breed = mysqli_real_escape_string($con,trim($_POST['breed']));
           $weight = trim($_POST['weight']);
           
           $SQL = "SELECT * FROM $tbl_name WHERE `is_deleted` = 0 AND `ear_tag` = '$ear_tag'  AND  `animal_no` = '$animal_no'  AND `animal_type_no` != '$animal_type_no'";
            $COUNT = mysqli_num_rows(mysqli_query($con,$SQL));
            if($COUNT < 1): 
                 if ($_FILES["image_animal"]["error"] > 0) {
                    $image_animal =$_POST['image_animal'];
                    
                } else {
                    $image_animal = time().$_FILES["image_animal"]["name"];
                    move_uploaded_file($_FILES["image_animal"]["tmp_name"],"upload/" . $image_animal);
                }
                
            $sql = "UPDATE $tbl_name SET `animal_no` = '$animal_no' , `ear_tag` = '$ear_tag' ,`dob` = '$dob' ,`age`='$age', `color`='$color', 
			  `breed`='$breed', `weight`='$weight',`image_animal`='$image_animal', `is_updated` = 1, `updated_by` = '$user_no' ,`updated_on` = '$CURR_TIME'
			  WHERE animal_type_no = $animal_type_no";
                $result = mysqli_query($con,$sql);
                if($result)
                {
                    $mgs = "Data Update Successfully!";
                    $class = "green_publisher_name alert alert-success col-md-6 alert-dismissable";
                }
                else
                {
                    $mgs = "Data Update Fail!";
                    $class = "red_publisher_name alert alert-warning alert-dismissable col-md-6";
                }
            else:
                $mgs = "Duplicate Entry!";
                $class = "red_publisher_name alert alert-warning alert-dismissable col-md-6";
            endif;
    }
?> 
    <?php
        if(isset($_GET['edit'])):
        $id = $_GET['edit'];
        $sql = "SELECT * FROM $tbl_name WHERE `animal_type_no` = '$id' ";
        $result = mysqli_fetch_array(mysqli_query($con,$sql));
    ?>
     <form class="cmxform form-horizontal " id="signupForm" method="post" enctype="multipart/form-data">
     <div class="form-group " <?php if($mgs=='')echo "style='display:none;'" ?>>
            <div class=" col-md-6 col-md-offset-2 <?=$class?>"><a href="#" class="close" data-dismiss="alert" aria-label="close">x</a><?=$mgs?></div>
            <div>
                <input type="hidden" name="animal_type_no" value="<?=$result['animal_type_no']?>" />
            </div>
        </div>
        <div class="form-group ">
            <label for="animal_no" class="control-label col-lg-3"> Animal</label>
            <div class="col-lg-5">
                 <select class="form-control" name="animal_no" id="animal_no">
                    <option value="-1">--Select Animal--</option>
                        <?php
                            $sql = "SELECT * FROM `add_animal` where is_deleted=0 ";
                            $query = mysqli_query($con,$sql);
                            while($row = mysqli_fetch_array($query)):
                        ?>
                            <option value="<?=$row['animal_no']?>" <?php if($result['animal_no'] == $row['animal_no'])  echo 'selected'; ?>><?=$row['animal_name']?></option>
                        <?php endwhile;?>
                    </select>  
            </div>
             
        </div>
		<div class="form-group ">
            <label for="ear_tag" class="control-label col-lg-3">Ear Tag</label>
            <div class="col-lg-5">
                <input class=" form-control" id="" name="ear_tag" type="text" value="<?=$result['ear_tag']?>"  />
            </div>
            
        </div>
		<div class="form-group ">
            <label for="dob" class="control-label col-lg-3">Date Of Birth</label>
            <div class="col-lg-5">
                <input class=" form-control" id="" name="dob" type="date" value="<?=$result['dob']?>"  />
            </div>
            
        </div>
       <div class="form-group ">
            <label for="age" class="control-label col-lg-3">Age</label>
            <div class="col-lg-5">
                <input class=" form-control" id="" name="age" type="text" value="<?=$result['age']?>"  />
            </div>
            
        </div>
		<div class="form-group ">
            <label for="color" class="control-label col-lg-3">Color</label>
            <div class="col-lg-5">
                <input class=" form-control" id="" name="color" type="text" value="<?=$result['color']?>"  />
            </div>
            
        </div>
		<div class="form-group ">
            <label for="breed" class="control-label col-lg-3">Breed</label>
            <div class="col-lg-5">
                <input class=" form-control" id="" name="breed" type="text" value="<?=$result['breed']?>"  />
            </div>
            
        </div>
		<div class="form-group ">
            <label for="weight" class="control-label col-lg-3">Weight</label>
            <div class="col-lg-5">
                <input class=" form-control" id="" name="weight" type="text" value="<?=$result['weight']?>"  />
            </div>
            
        </div>
		<div class="form-group ">
            <label for="image_animal" class="control-label col-lg-3"> Image </label>
            <div class="col-lg-5">
                <input type="file"  name="image_animal" id="" value="<?=$result['image_animal']?>">
                <img src="upload/<?=$result['image_animal']?>" height="60" width="60"/> 
            </div>
           <div>
                <input type="hidden" name="image_animal" value="<?=$result['image_animal']?>" />
            </div>
        
            
        </div>
     <div class="form-group">
            <div class="col-lg-offset-3 col-md-offset-2 col-sm-offset-3 col-xs-offset-3 col-lg-5">
                <input type="submit" class="btn btn-primary" name="update" value="Update" />
                
            </div>
        </div>
    </form>
    
    <?php
        else:
    ?>

    <form class="cmxform form-horizontal " id="signupForm" method="post" enctype="multipart/form-data">
        <div class="form-group " <?php if($mgs=='')echo "style='display:none;'" ?>>
            <div class=" col-md-6 col-md-offset-2 <?=$class?>"><a href="#" class="close" data-dismiss="alert" aria-label="close">x</a><?=$mgs?></div>
            
        </div>
		
      <div class="form-group ">
            <label for="animal_no" class="control-label col-lg-3">Animal</label>
            <div class="col-lg-5">
                 <select class="form-control" name="animal_no">
				 <option>---Select Animal---</option>
                        <?php
                            $sql = "SELECT * FROM `add_animal` where is_deleted=0 ";
                            $result = mysqli_query($con,$sql);
                            while($row = mysqli_fetch_array($result)):
                        ?>
                            <option value="<?=$row['animal_no']?>" ><?=$row['animal_name']?></option>
                        <?php endwhile;?>
                    </select>  
            </div>
             
        </div>
         <div class="form-group ">
            <label for="ear_tag" class="control-label col-lg-3">Ear Tag </label>
            <div class="col-lg-5">
                <input class=" form-control" id="" name="ear_tag" type="text"  required />
            </div>
            
        </div>
		
        <div class="form-group ">
            <label for="dob" class="control-label col-lg-3">Date of Birth</label>
            <div class="col-lg-5">
                <input class=" form-control" id="" name="dob" type="date"  required />
            </div>
            
        </div>

      <div class="form-group ">
            <label for="age" class="control-label col-lg-3">Age</label>
            <div class="col-lg-5">
                <input class=" form-control" id="" name="age" type="text" required />
            </div>
            
        </div>
		
		
        <div class="form-group ">
            <label for="color" class="control-label col-lg-3">Color</label>
            <div class="col-lg-5">
                <input class=" form-control" id="" name="color" type="text"  required />
            </div>
            
        </div>
		
        <div class="form-group ">
            <label for="breed" class="control-label col-lg-3">Breed</label>
            <div class="col-lg-5">
                <input class=" form-control" id="" name="breed" type="text"  required />
            </div>
            
        </div>
		
        <div class="form-group ">
            <label for="weight" class="control-label col-lg-3">Weight </label>
            <div class="col-lg-5">
                <input class=" form-control" id="" name="weight" type="text"  required />
            </div>
            
        </div>
		
        <div class="form-group ">
            <label for="image_animal" class="control-label col-lg-3">Image </label>
            <div class="col-lg-5">
                <input class=" form-control" id="" name="image_animal" type="file"  required />
            </div>
            
        </div>
        
        
       <div class="form-group">
            <div class="col-lg-offset-3 col-md-offset-2 col-sm-offset-3 col-xs-offset-3 col-lg-5">
                <input type="submit" class="btn btn-primary" name="submit" value="Add" />
                
            </div>
        </div>
    </form>
    
    <?php
        endif;
    ?>
        
    <?php
    // How many adjacent pages should be shown on each side?
    $adjacents = 3;
    
    /* 
       First get total number of rows in data table. 
       If you have a WHERE clause in your query, make sure you mirror it here.
    */
    $query = "SELECT COUNT(*) as num FROM $tbl_name WHERE is_deleted = 0";
    $total_pages = mysqli_fetch_array(mysqli_query($con,$query));
    $total_pages = $total_pages['num'];
    
    /* Setup vars for query. */
    $limit = 15; 
    if(isset($_GET['page']))
    {                               //how many items to show per page
        $page = $_GET['page'];
    }
    else
    $page = 1;
    
    if($page) 
        $start = ($page - 1) * $limit;          //first item to display on this page
    else
        $start = 0;                             //if no page var is given, set start to 0
    
   /*data list*/

            $sql = "SELECT * FROM $tbl_name LEFT JOIN `add_animal` ON `add_animal`.`animal_no`=$tbl_name.`animal_no` WHERE $tbl_name.is_deleted = 0  ORDER BY  `animal_type_no` DESC 
                LIMIT $start, $limit";
            $query_list = mysqli_query($con,$sql);
        
    
    /* Setup page vars for display. */
    if ($page == 0) $page = 1;                  //if no page var is given, default to 1.
    $prev = $page - 1;                          //previous page is page - 1
    $next = $page + 1;                          //next page is page + 1
    $lastpage = ceil($total_pages/$limit);      //lastpage is = total pages / items per page, rounded up.
    $lpm1 = $lastpage - 1;                      //last page minus 1
    
    /* 
        Now we apply our rules and draw the pagination object. 
        We're actually saving the code to a variable in case we want to draw it more than once.
    */
    $pagination = "";
    if($lastpage > 1)
    {   
        $pagination .= "<div class=\"pagination\">";
        //previous button
        if ($page > 1) 
            $pagination.= "<a href=\"$targetpage?page=$prev\"><< previous</a>";
        else
            $pagination.= "<span class=\"disabled\"><< previous</span>";    
        
        //pages 
        if ($lastpage < 7 + ($adjacents * 2))   //not enough pages to bother breaking it up
        {   
            for ($counter = 1; $counter <= $lastpage; $counter++)
            {
                if ($counter == $page)
                    $pagination.= "<span class=\"current\">$counter</span>";
                else
                    $pagination.= "<a href=\"$targetpage?page=$counter\">$counter</a>";                 
            }
        }
        elseif($lastpage > 5 + ($adjacents * 2))    //enough pages to hide some
        {
            //close to beginning; only hide later pages
            if($page < 1 + ($adjacents * 2))        
            {
                for ($counter = 1; $counter < 4 + ($adjacents * 2); $counter++)
                {
                    if ($counter == $page)
                        $pagination.= "<span class=\"current\">$counter</span>";
                    else
                        $pagination.= "<a href=\"$targetpage?page=$counter\">$counter</a>";                 
                }
                $pagination.= "...";
                $pagination.= "<a href=\"$targetpage?page=$lpm1\">$lpm1</a>";
                $pagination.= "<a href=\"$targetpage?page=$lastpage\">$lastpage</a>";       
            }
            //in middle; hide some front and some back
            elseif($lastpage - ($adjacents * 2) > $page && $page > ($adjacents * 2))
            {
                $pagination.= "<a href=\"$targetpage?page=1\">1</a>";
                $pagination.= "<a href=\"$targetpage?page=2\">2</a>";
                $pagination.= "...";
                for ($counter = $page - $adjacents; $counter <= $page + $adjacents; $counter++)
                {
                    if ($counter == $page)
                        $pagination.= "<span class=\"current\">$counter</span>";
                    else
                        $pagination.= "<a href=\"$targetpage?page=$counter\">$counter</a>";                 
                }
                $pagination.= "...";
                $pagination.= "<a href=\"$targetpage?page=$lpm1\">$lpm1</a>";
                $pagination.= "<a href=\"$targetpage?page=$lastpage\">$lastpage</a>";       
            }
            //close to end; only hide early pages
            else
            {
                $pagination.= "<a href=\"$targetpage?page=1\">1</a>";
                $pagination.= "<a href=\"$targetpage?page=2\">2</a>";
                $pagination.= "...";
                for ($counter = $lastpage - (2 + ($adjacents * 2)); $counter <= $lastpage; $counter++)
                {
                    if ($counter == $page)
                        $pagination.= "<span class=\"current\">$counter</span>";
                    else
                        $pagination.= "<a href=\"$targetpage?page=$counter\">$counter</a>";                 
                }
            }
        }
        
        //next button
        if ($page < $counter - 1) 
            $pagination.= "<a href=\"$targetpage?page=$next\">next >></a>";
        else
            $pagination.= "<span class=\"disabled\">next >></span>";
        $pagination.= "</div>\n";       
    }
?>
<div style="overflow: auto">
    <table   class="table table-bordered table-hover table-responsive table-condensed table-striped dataTable col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
        <tr>
            <th><center>Sl</center></th>
            <th><center>Animal</center></th>
            <th><center>Ear Tag</center></th>
            <th><center>Date Of Birth</center></th>
             <th><center>Age</center></th>
             <th><center>Color</center></th>
             <th><center>Breed</center></th>
             <th><center>Weight </center></th>
             <th><center>Image</center></th>
             <th><center>Action</center></th>
         </tr>
    <?php $i=$page*$limit-$limit+1; while($row = mysqli_fetch_array($query_list)):?>
        <tr>
            <td><center><?=$i++?></center></td>
            <td><center><?=$row['animal_name']?></center></td>
           <td><center><?=$row['ear_tag']?></center></td>
            <td><center><?=$row['dob']?></center></td>
           <td><center><?=$row['age']?></center></td>
           <td><center><?=$row['color']?></center></td>
           <td><center><?=$row['breed']?></center></td>
           <td><center><?=$row['weight']?></center></td>

          <td><a class="btn btn-primary" target="_blank" href="upload/<?=$row['image_animal']?>"><i class="fa fa-eye" aria-hidden="true"></i> View</a></td>
           <td>
               <center> <a onclick="return confirm('Are you Sure Want to Edit?');" href="<?=$targetpage.'?edit='.$row['animal_type_no']?>" class="btn btn-primary"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
                <a onclick="return confirm('Are you Sure Want to Delete?');" href="<?=$targetpage.'?delete='.$row['animal_type_no']?>" class="btn btn-danger"><i class="fa fa-trash-o" aria-hidden="true"></i></a></center>
            </td>
             
           
        </tr>
    <?php endwhile;?>
    </table>

<?=$pagination?>
    
    <!---main content end---->
<?php include 'include/footer.php';?>
<script type="text/javascript">
    $(document).ready(function(){
        $("#category_no").on("change",function(){
            var category_no = $(this).val();
            if(category_no!= -1){
                $.post("ajax/get_departments.php",{category_no:category_no},function(data){
                   // console.log(data.trim().length);
                    if(data.trim().length > 0){
                        $("#department_no").html(data);
                       
                    }
                });


            }else{
                $("#department_no").html("<option value='-1'>--Select Department--</option>");
                
            }
        });

        

        
    });
</script>
