
<?php include 'include/header.php';?>
<?php $table_heading = "বাংলাদেশ সংবাদ আপলোড";?>
<?php include 'include/sidebar.php';?>
<?php include 'include/body-top.php';?>

<?php
	
    $tbl_name="photo_gallery";        //your table name
    $targetpage = "photo_gallery.php";  //your file name  (the name of this file)
    $user_no =$_SESSION['user']['user_no'];
    date_default_timezone_set("Asia/Dhaka");
	$CURR_TIME = date('Y-m-d h:i:s');  
	date_default_timezone_set("Asia/Dhaka");
			$times = date('h:i:s A');   
			$dates = date('Y-m-d');   
        $mgs = '';
        
       if(isset($_GET['delete']))
    {
        $ID = $_GET['delete'];
        $sql = "UPDATE $tbl_name SET `is_deleted` = 1 ,`deleted_by` = '$user_no', `deleted_on` = '$CURR_TIME' WHERE photo_gallery_no = $ID";
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
		
    {		$rest_no = $_POST['rest_no'];
		   
		    if ($_FILES["rest_image"]["error"] > 0) {
                    $rest_image = "No .jpg";
                    
                } else {
                    $rest_image = time().$_FILES["rest_image"]["name"];
                    move_uploaded_file($_FILES["rest_image"]["tmp_name"],"upload/" . $rest_image);
                }
		 
     $sql = "INSERT INTO $tbl_name ( `rest_no`, `rest_image`,`created_by` , `created_on`, `created_date`, `created_time`) VALUES('$rest_no','$rest_image','$user_no', '$CURR_TIME', '$dates' ,'$times')";
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
            
    }
    if(isset($_POST['update']))
    {	
            $photo_gallery_no = $_POST['photo_gallery_no'];
			$rest_no = $_POST['rest_no'];
           
             if ($_FILES["rest_image"]["error"] > 0) {
                    $rest_image =$_POST['rest_image'];
                    
                } else {
                    $rest_image = time().$_FILES["rest_image"]["name"];
                    move_uploaded_file($_FILES["rest_image"]["tmp_name"],"upload/" . $rest_image);
                }
				
               $sql = "UPDATE $tbl_name SET `rest_no` = '$rest_no' ,`rest_image` = '$rest_image' , `is_updated` = 1, `updated_by` = $user_no ,`updated_on` = '$CURR_TIME'  WHERE photo_gallery_no = $photo_gallery_no";
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
            
    }
?> 
    <?php
        if(isset($_GET['edit'])):
        $id = $_GET['edit'];
        $sql = "SELECT * FROM $tbl_name WHERE `photo_gallery_no` = '$id' ";
        $result = mysqli_fetch_array(mysqli_query($con,$sql));
    ?>
     <form class="cmxform form-horizontal " id="signupForm" method="post" enctype="multipart/form-data">
     <div class="form-group " <?php if($mgs=='')echo "style='display:none;'" ?>>
            <div class=" col-md-6 col-md-offset-2 <?=$class?>"><a href="#" class="close" data-dismiss="alert" aria-label="close">x</a><?=$mgs?></div>
            <div>
                <input type="hidden" name="photo_gallery_no" value="<?=$result['photo_gallery_no']?>" />
            </div>
        </div>
		
		 <div class="form-group ">
            <label for="rest_no" class="control-label col-lg-3">Restaurant Name</label>
            <div class="col-lg-5">
                <select class="form-control" name="rest_no" id="rest_no">
                	<option value="-1">--Select District--</option>
                        <?php
                            $sql = "SELECT * FROM `rest_name`";
                            $result1 = mysqli_query($con,$sql);
                            while($row = mysqli_fetch_array($result1)):
                        ?>
                            <option value="<?=$row['rest_no']?>" <?php if($result['rest_no'] == $row['rest_no'])  echo 'selected'; ?>><?=$row['hotel_name']?></option>
                        <?php endwhile;?>
                    </select>
            </div>
            
        </div>
	
        <div class="form-group ">
            <label for="rest_image" class="control-label col-lg-3">ফিচার ছবি </label>
            <div class="col-lg-5">
                <input type="file"  name="rest_image" id="" value="<?=$result['rest_image']?>">
                <img src="upload/<?=$result['rest_image']?>" height="60" width="60"/> 
            </div>
           <div>
                <input type="hidden" name="rest_image" value="<?=$result['rest_image']?>" />
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
            <label for="rest_no" class="control-label col-lg-3">Restaurant Name:</label>
            <div class="col-lg-5">
                <select class="form-control" id="rest_no" name="rest_no">
                    <option value="-1">--Select Reporter--</option>
                    <?php
                        $sql="SELECT * FROM `rest_name` where IS_DELETED=0";
                        $query=mysqli_query($con,$sql);
                       while($row=mysqli_fetch_array($query)):
                    ?>
                    <option value="<?=$row['rest_no']?>"><?=$row['hotel_name']?></option>
                    <?php endwhile; ?>
                </select>
            </div>
        </div>
		
         <div class="form-group ">
            <label for="rest_image" class="control-label col-lg-3">ফিচার ছবি </label>
            <div class="col-lg-5">
                <input class=" form-control" id="" name="rest_image" type="file"  />
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
	
	<form method="post" class="cmxform form-horizontal ">
        <fieldset class="scheduler-border">
                <legend class="scheduler-border">Search</legend>
              
                <div class="form-group ">
                    
        <div class="form-group ">
            <label for="reporter_no" class="control-label col-lg-3">Reporter Name:</label>
            <div class="col-lg-5">
                <select class="form-control" id="reporter_no" name="report_no">
                    <option value="-1">--Select Reporter--</option>
                    <?php
                        $sql="SELECT * FROM `reporter` where IS_DELETED=0";
                        $query=mysqli_query($con,$sql);
                       while($row=mysqli_fetch_array($query)):
                    ?>
                    <option value="<?=$row['reporter_no']?>"><?=$row['reporter_name']?></option>
                    <?php endwhile; ?>
                </select>
            </div>
        </div>

                </div>
                <div class="form-group ">
                     
                    <label for="location" class="control-label col-lg-2"></label>
                    <div class=" col-lg-4">
                        <input type="submit" class="btn btn-primary" id="searchBtn" name="searchBtn" value="Search" />
                        
                    </div>
                </div>
                
                 
          </fieldset> 
    </form>
        
    <?php
	
    $where = "";
    if(isset($_POST['searchBtn']))
    {
        
        $category_no =mysqli_real_escape_string($con,trim($_POST['cat_no']));
          if($category_no != "-1"){
            $where.=" AND `bangladesh`.`category_no`='$category_no'";
          }
          $reporter_no =mysqli_real_escape_string($con,trim($_POST['report_no']));
          if($reporter_no != "-1"){
            $where.=" AND `reporter`.`reporter_no`='$reporter_no'";
          }
          $department_no =$_POST['dept_no'];
          if($department_no != "-1"){
            $where.=" AND `bangladesh`.`department_no` ='$department_no'";
          }
		  
    }
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

  $sql = "SELECT * FROM $tbl_name LEFT JOIN `rest_name` ON `rest_name`.`rest_no`=$tbl_name.`rest_no` WHERE $tbl_name.`IS_DELETED` = 0 $where ORDER BY  `photo_gallery_no` DESC LIMIT $start, $limit";
			  
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
			<th><center>Reporter Name</center></th>
             <th><center>ফিচার ছবি</center></th>
             
             <th><center>Action</center></th>
         </tr>
    <?php $i=$page*$limit-$limit+1; while($row = mysqli_fetch_array($query_list)):?>
        <tr>
            <td><center><?=$i++?></center></td>
			<td><center><?=$row['hotel_name']?></center></td>
          <td><a class="" target="_blank" href="upload/<?=$row['rest_image']?>" title="Click to view full image"><img src="upload/<?=$row['rest_image']?>" height="70px" width="50px"></a></td>
            
           <td>
               <center> <a onclick="return confirm('Are you Sure Want to Edit?');" href="<?=$targetpage.'?edit='.$row['photo_gallery_no']?>" class="btn btn-primary"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
                <a onclick="return confirm('Are you Sure Want to Delete?');" href="<?=$targetpage.'?delete='.$row['photo_gallery_no']?>" class="btn btn-danger"><i class="fa fa-trash-o" aria-hidden="true"></i></a></center>
            </td>
             
           
        </tr>
    <?php endwhile;?>
    </table>

<?=$pagination?>
    
    <!---main content end---->
<?php include 'include/footer.php';?>

