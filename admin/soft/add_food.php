<?php include 'include/header.php';?>
<?php $table_heading = "Food Setup";?>
<?php include 'include/sidebar.php';?>
<?php include 'include/body-top.php';?>
 <?php
        $tbl_name="food";        //your table name
        $targetpage = "add_food.php";  //your file name  (the name of this file)
    $user_no =$_SESSION['user']['user_no'];
    $CURR_TIME = date('Y-m-d :H:i:s'); 
        $mgs = '';
    if(isset($_GET['delete']))
    {
        $ID = $_GET['delete'];
       $sql = "DELETE FROM $tbl_name WHERE food_no = $ID";
        $result = mysqli_query($con,$sql);
        if($result)
        {
            $mgs = "Data Delete Successfully!";
            $class = "green_color alert alert-success col-md-6 alert-dismissable";
        }
        else
        {
            $mgs = "Data Delete Fail!";
            $class = "red_color alert alert-warning alert-dismissable col-md-6";
        }
    }
    if(isset($_POST['submit']))
    {
              $animal_no = $_POST['animal_no'];
			  $food = $_POST['food'];
           $day_time = $_POST['day_time'];
           $from_time = $_POST['from_time'];
           $to_time = $_POST['to_time'];
           $quantity = $_POST['quantity'];
           $age_wise_food = $_POST['age_wise_food'];
		   if ($_FILES["food_pic"]["error"] > 0) {
                    $food_pic = "No .jpg";
                    
                } else {
                    $food_pic = time().$_FILES["food_pic"]["name"];
                    move_uploaded_file($_FILES["food_pic"]["tmp_name"],"upload/" . $food_pic);
                }
               
            $sql = "INSERT INTO $tbl_name (`animal_no`, `food` ,`food_pic`, `day_time`, `from_time`, `to_time`, `quantity`, `age_wise_food`,  `created_by` , `created_on`) VALUES('$animal_no','$food','$food_pic','$day_time','$from_time','$to_time','$quantity','$age_wise_food', '$user_no', '$CURR_TIME')";
                $result = mysqli_query($con,$sql);
                if($result)
                {
                    $mgs = "Data Insert Successfully!";
                    $class = "green_color alert alert-success col-md-6 alert-dismissable";
                }
                else
                {
                    $mgs = "Data Insert Fail!";
                    $class = "red_color alert alert-warning alert-dismissable col-md-6";
                }
    }
    if(isset($_POST['update']))
    {
			$animal_no = $_POST['animal_no'];
			$food_no = $_POST['food_no'];
			$food = $_POST['food'];
           $day_time = $_POST['day_time'];
           $from_time = $_POST['from_time'];
           $to_time = $_POST['to_time'];
           $quantity = $_POST['quantity'];
           $age_wise_food = $_POST['age_wise_food'];
		   if ($_FILES["food_pic"]["error"] > 0) {
                    $food_pic = "No .jpg";
                    
                } else {
                    $food_pic = time().$_FILES["food_pic"]["name"];
                    move_uploaded_file($_FILES["food_pic"]["tmp_name"],"upload/" . $food_pic);
                }
         
                $sql = "UPDATE $tbl_name SET `animal_no`='$animal_no', `food` = '$food',`food_pic`='$food_pic', `day_time` = '$day_time', `from_time` = '$from_time', `to_time` = '$to_time',`quantity`='$quantity', `age_wise_food` = '$age_wise_food', `is_updated` = 1, `updated_by` = $user_no ,`updated_on` = '$CURR_TIME'  WHERE food_no = $food_no";
                $result = mysqli_query($con,$sql);
                if($result)
                {
                    $mgs = "Data Update Successfully!";
                    $class = "green_color alert alert-success col-md-6 alert-dismissable";
                }
                else
                {
                    $mgs = "Data Update Fail!";
                    $class = "red_color alert alert-warning alert-dismissable col-md-6";
                }
           
    }
?> 
    <?php
        if(isset($_GET['edit'])):
        $id = $_GET['edit'];
        $sql = "SELECT * FROM $tbl_name WHERE `food_no` = '$id' ";
        $result = mysqli_fetch_array(mysqli_query($con,$sql));
    ?>
     <form class="cmxform form-horizontal " id="signupForm" method="post" enctype="multipart/form-data" >
     <div class="form-group " <?php if($mgs=='')echo "style='display:none;'" ?>>
            <div class=" col-md-6 col-md-offset-2 <?=$class?>"><a href="#" class="close" data-dismiss="alert" aria-label="close">x</a><?=$mgs?></div>
            <div>
                <input type="hidden" name="food_no" value="<?=$result['food_no']?>" />
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
            <label for="food" class="control-label col-lg-3">Food </label>
            <div class="col-lg-5">
                <input class=" form-control" id="" name="food" type="text" value="<?=$result['food']?>" required />
            </div>
            
        </div>
		<div class="form-group ">
            <label for="food_pic" class="control-label col-lg-3">Food Image</label>
            <div class="col-lg-5">
                <input class=" form-control" id="" name="food_pic" type="file" value="<?=$result['food_pic']?>" required />
            </div>
            
        </div>
		
      <div class="form-group ">
            <label for="day_time" class="control-label col-lg-3">Day Time</label>
            <div class="col-lg-5">
                <input class=" form-control" id="" name="day_time" type="text" value="<?=$result['day_time']?>" required />
            </div>
            
        </div>

        <div class="form-group ">
            <label for="from_time" class="control-label col-lg-3">From Time </label>
            <div class="col-lg-5">
                <input class=" form-control" id="" name="from_time" type="text" value="<?=$result['from_time']?>" required />
            </div>
            
        </div>
		<div class="form-group ">
            <label for="to_time" class="control-label col-lg-3">To Time </label>
            <div class="col-lg-5">
                <input class=" form-control" id="" name="to_time" type="text" value="<?=$result['to_time']?>" required />
            </div>
            
        </div>
		<div class="form-group ">
            <label for="quantity" class="control-label col-lg-3">Quantity </label>
            <div class="col-lg-5">
                <input class=" form-control" id="" name="quantity" type="text" value="<?=$result['quantity']?>" required />
            </div>
            
        </div>
		<div class="form-group ">
        <label for="age_wise_food" class="control-label col-lg-3">Age wise food</label>
        <div class="col-lg-5">
             <select class="form-control" name="age_wise_food">
               <option>---Select Age---</option>
               <option <?php if($result['age_wise_food'] == '0-1 year') {echo "selected";} ?> value="0-1 year">0-1 year</option>
               <option <?php if($result['age_wise_food'] == '1-2 years') {echo "selected";} ?> value="1-2 years">1-2 years</option>
               <option <?php if($result['age_wise_food'] == '2-5 years') {echo "selected";} ?> value="2-5 years">2-5 years</option>
               <option <?php if($result['age_wise_food'] == '5+years') {echo "selected";} ?> value="5+years">5+years</option>

              </select>  
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
            <label for="food" class="control-label col-lg-3">Food</label>
            <div class="col-lg-5">
                <input class=" form-control" id="" name="food" type="text"  required />
            </div>
            
        </div>
		<div class="form-group ">
            <label for="food_pic" class="control-label col-lg-3">Food Image</label>
            <div class="col-lg-5">
                <input class=" form-control" id="" name="food_pic" type="file"  required />
            </div>
            
        </div>
       
        <div class="form-group ">
            <label for="day_time" class="control-label col-lg-3">Day Time </label>
            <div class="col-lg-5">
                <input class=" form-control" id="" name="day_time" type="text"  required />
            </div>
            
        </div>
        <div class="form-group ">
            <label for="from_time" class="control-label col-lg-3">From Time </label>
            <div class="col-lg-5">
                <input class=" form-control" id="" name="from_time" type="text"  required />
            </div>
            
        </div>
		<div class="form-group ">
            <label for="to_time" class="control-label col-lg-3">To Time</label>
            <div class="col-lg-5">
                <input class=" form-control" id="" name="to_time" type="text"  required />
            </div>
            
        </div>
		<div class="form-group ">
            <label for="to_time" class="control-label col-lg-3">Quantity</label>
            <div class="col-lg-5">
                <input class=" form-control" id="" name="quantity" type="text"  required />
            </div>
            
        </div>
		<div class="form-group ">
            <label for="age_wise_food" class="control-label col-lg-3">Age wise food</label>
            <div class="col-lg-5">
                 <select class="form-control" name="age_wise_food">
					 <option>---Select Age---</option>
					 <option value="0-1 year">0-1 year</option>
					 <option value="1-2 years">1-2 years</option>
					 <option value="2-5 years">2-5 years</option>
					 <option value="5+years">5+years</option>
                 </select>  
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
    
    // How many adjacent pages should be shown on each side?
    $adjacents = 3;
    
    /* 
       First get total number of rows in data table. 
       If you have a WHERE clause in your query, make sure you mirror it here.
    */
    $query = "SELECT COUNT(*) as num FROM $tbl_name";
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
    
    /* Get data. */
    $sql = "SELECT * FROM $tbl_name LEFT JOIN `add_animal` ON `add_animal`.`animal_no`=$tbl_name.`animal_no` ORDER BY `food_no` DESC LIMIT $start, $limit";
    $result = mysqli_query($con,$sql);
    
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

    <table   class="table table-bordered table-hover table-responsive table-condensed table-striped dataTable col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
        <tr>
            <th><center>Sl</center></th>
            <th><center>Animal</center></th>
            <th><center>Food</center></th>
            <th><center>Food Image</center></th>
            <th><center>Day Time</center></th>
            <th><center>From Time</center></th>
            <th><center>To Time</center></th>
            <th><center>Quantity</center></th>
            <th><center>Age Wise Food</center></th>
            <th><center>Action</center></th>
         </tr>
    <?php $i=$page*$limit-$limit+1; while($row = mysqli_fetch_array($result)):?>
        <tr>
            <td><center><?=$i++?></center></td>
            <td><?=$row['animal_name']?></td>
            <td><?=$row['food']?></td>
            <td><a class="btn btn-primary" target="_blank" href="upload/<?=$row['food_pic']?>"><i class="fa fa-eye" aria-hidden="true"></i> View</a></td>
            <td><?=$row['day_time']?></td>
            <td><?=$row['from_time']?></td>
            <td><?=$row['to_time']?></td>
            <td><?=$row['quantity']?></td>
            <td><?=$row['age_wise_food']?></td> 	
           <td>
               <center> <a onclick="return confirm('Are you Sure Want to Edit?');" href="<?=$targetpage.'?edit='.$row['food_no']?>" class="btn btn-primary"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
                <a onclick="return confirm('Are you Sure Want to Delete?');" href="<?=$targetpage.'?delete='.$row['food_no']?>" class="btn btn-danger"><i class="fa fa-trash-o" aria-hidden="true"></i></a></center>
            </td>
        </tr>
    <?php endwhile;?>
    </table>

<?=$pagination?>
    
    <!---main content end---->
<?php include 'include/footer.php';?>