
<?php include 'include/header.php';?>
<?php $table_heading = "Doctor Upload";?>
<?php include 'include/sidebar.php';?>
<?php include 'include/body-top.php';?>

<?php
	
    $tbl_name="doctors";          //your table name
    $targetpage = "add_doctors.php";  //your file name
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
        $sql = "UPDATE $tbl_name SET `is_deleted` = 1 ,`deleted_by` = '$user_no', `deleted_on` = '$CURR_TIME' WHERE doctors_no = $ID";
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
		
    {
           $doctor_name = mysqli_real_escape_string($con,trim($_POST['doctor_name']));
           $doctor_title = mysqli_real_escape_string($con,trim($_POST['doctor_title']));
           $doctor_email = mysqli_real_escape_string($con,trim($_POST['doctor_email']));
           $phone = mysqli_real_escape_string($con,trim($_POST['phone']));
           $address = mysqli_real_escape_string($con,trim($_POST['address']));
		   
		    if ($_FILES["doctors_pic"]["error"] > 0) {
                    $doctors_pic = "No .jpg";
                    
                } else {
                    $doctors_pic = time().$_FILES["doctors_pic"]["name"];
                    move_uploaded_file($_FILES["doctors_pic"]["tmp_name"],"upload/" . $doctors_pic);
                }
		 
		$sql = "INSERT INTO $tbl_name (`doctor_name`, `doctor_title`,`doctor_email`, `phone`,`address`,`doctors_pic` ,`created_by` , `created_on`) VALUES('$doctor_name','$doctor_title','$doctor_email','$phone','$address','$doctors_pic','$user_no', '$CURR_TIME')";
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
            $doctors_no = $_POST['doctors_no'];
           $doctor_name = mysqli_real_escape_string($con,trim($_POST['doctor_name']));
           $doctor_title = mysqli_real_escape_string($con,trim($_POST['doctor_title']));
           $doctor_email = mysqli_real_escape_string($con,trim($_POST['doctor_email']));
           $phone = mysqli_real_escape_string($con,trim($_POST['phone']));
           $address = mysqli_real_escape_string($con,trim($_POST['address']));
           
             if ($_FILES["doctors_pic"]["error"] > 0) {
                    $doctors_pic =$_POST['doctors_pic'];
                    
                } else {
                    $doctors_pic = time().$_FILES["doctors_pic"]["name"];
                    move_uploaded_file($_FILES["doctors_pic"]["tmp_name"],"upload/" . $doctors_pic);
                }
				
               $sql = "UPDATE $tbl_name SET `doctor_name`='$doctor_name', `doctor_title` = '$doctor_title',`doctor_email`='$doctor_email' ,`phone` = '$phone',`address`='$address' ,`doctors_pic` = '$doctors_pic' , `is_updated` = 1, `updated_by` = $user_no ,`updated_on` = '$CURR_TIME'  WHERE doctors_no = $doctors_no";
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
        $sql = "SELECT * FROM $tbl_name WHERE `doctors_no` = '$id' ";
        $result = mysqli_fetch_array(mysqli_query($con,$sql));
    ?>
     <form class="cmxform form-horizontal " id="signupForm" method="post" enctype="multipart/form-data">
     <div class="form-group " <?php if($mgs=='')echo "style='display:none;'" ?>>
            <div class=" col-md-6 col-md-offset-2 <?=$class?>"><a href="#" class="close" data-dismiss="alert" aria-label="close">x</a><?=$mgs?></div>
            <div>
                <input type="hidden" name="doctors_no" value="<?=$result['doctors_no']?>" />
            </div>
        </div>
		
		<div class="form-group ">
            <label for="doctors_pic" class="control-label col-lg-3">Animal Image </label>
            <div class="col-lg-5">
                <input type="file"  name="doctors_pic" id="" value="<?=$result['doctors_pic']?>">
                <img src="upload/<?=$result['doctors_pic']?>" height="60" width="60"/> 
            </div>
           <div>
                <input type="hidden" name="doctors_pic" value="<?=$result['doctors_pic']?>" />
            </div>
        
        </div>
		
		<div class="form-group ">
            <label for="doctor_name" class="control-label col-lg-3">Doctors Name </label>
            <div class="col-lg-5">
                <input class=" form-control" id="" name="doctor_name" value="<?=$result['doctor_name']?>" type="text"   />
            </div>
            
        </div>
		
		<div class="form-group ">
            <label for="doctor_title" class="control-label col-lg-3">Doctors Title </label>
            <div class="col-lg-5">
                <input class=" form-control" id="" name="doctor_title" value="<?=$result['doctor_title']?>" type="text"   />
            </div>
            
        </div>
		
		<div class="form-group ">
            <label for="doctor_email" class="control-label col-lg-3">Doctors Email</label>
            <div class="col-lg-5">
                <input class=" form-control" id="" name="doctor_email" value="<?=$result['doctor_email']?>" type="text"   />
            </div>
            
        </div>
		
		<div class="form-group ">
            <label for="phone" class="control-label col-lg-3">Phone </label>
            <div class="col-lg-5">
                <input class=" form-control" id="" name="phone" value="<?=$result['phone']?>" type="number"   />
            </div>
            
        </div>
		<div class="form-group ">
            <label for="address" class="control-label col-lg-3">Address </label>
            <div class="col-lg-5">
                <input class=" form-control" id="" name="address" value="<?=$result['address']?>" type="text"   />
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
            <label for="doctors_pic" class="control-label col-lg-3">Doctors Image</label>
            <div class="col-lg-5">
                <input class=" form-control" id="" name="doctors_pic" type="file"  />
            </div>
            
        </div>
		
		<div class="form-group ">
            <label for="doctor_name" class="control-label col-lg-3">Doctors Name</label>
            <div class="col-lg-5">
                <input class=" form-control" id="" name="doctor_name" type="text"   />
            </div>
			
            
        </div>
		<div class="form-group ">
            <label for="doctor_title" class="control-label col-lg-3">Doctors Title</label>
            <div class="col-lg-5">
                <input class=" form-control" id="" name="doctor_title" type="text"   />
            </div>
            
        </div>
		<div class="form-group ">
            <label for="doctor_email" class="control-label col-lg-3">Doctors Email</label>
            <div class="col-lg-5">
                <input class=" form-control" id="" name="doctor_email" type="text"   />
            </div>
            
        </div>
		
		<div class="form-group ">
            <label for="phone" class="control-label col-lg-3">Phone </label>
            <div class="col-lg-5">
                <input class=" form-control" id="" name="phone" type="number"   />
            </div>
            
        </div>
		<div class="form-group ">
            <label for="address" class="control-label col-lg-3">Address </label>
            <div class="col-lg-5">
                <input class=" form-control" id="" name="address" type="text"   />
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
	
    $where = "";
    if(isset($_POST['searchBtn']))
    {
        
        $category_no =mysqli_real_escape_string($con,trim($_POST['cat_no']));
          if($category_no != "-1"){
            $where.=" AND `bangladesh`.`category_no`='$category_no'";
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

  
  $sql = "SELECT * FROM $tbl_name WHERE $tbl_name.`is_deleted` = 0 ORDER BY `doctors_no` DESC LIMIT $start, $limit";
			  
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
			<th><center>Doctors Image</center></th>
			<th><center>Doctors Name</center></th>
			<th><center>Doctors Title</center></th>
			<th><center>Doctors Email</center></th>
			<th><center>Contact</center></th>
             <th><center>Address</center></th>
             <th><center>Action</center></th>
         </tr>
    <?php $i=$page*$limit-$limit+1; while($row = mysqli_fetch_array($query_list)):?>
        <tr>
            <td><center><?=$i++?></center></td>
			<td><a class="" target="_blank" href="upload/<?=$row['doctors_pic']?>" title="Click to view full image"><img src="upload/<?=$row['doctors_pic']?>" height="70px" width="50px"></a></td>
			<td><center><?=$row['doctor_name']?></center></td>
			<td><center><?=$row['doctor_title']?></center></td>
			<td><center><?=$row['doctor_email']?></center></td>
            <td><center><?=$row['phone']?></center></td>
            <td><center><?=$row['address']?></center></td>
            
           <td>
               <center> <a onclick="return confirm('Are you Sure Want to Edit?');" href="<?=$targetpage.'?edit='.$row['doctors_no']?>" class="btn btn-primary"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
                <a onclick="return confirm('Are you Sure Want to Delete?');" href="<?=$targetpage.'?delete='.$row['doctors_no']?>" class="btn btn-danger"><i class="fa fa-trash-o" aria-hidden="true"></i></a></center>
            </td>
             
           
        </tr>
    <?php endwhile;?>
    </table>

<?=$pagination?>
    
    <!---main content end---->
<?php include 'include/footer.php';?>
<!--script type="text/javascript">
    $(document).ready(function(){
        $("#district_no").on("change",function(){
            var district_no = $(this).val();
            if(district_no!= -1){
                $.post("ajax/get_upazila.php",{district_no:district_no},function(data){
                   // console.log(data.trim().length);
                    if(data.trim().length > 0){
                        $("#upazila_no").html(data);
                       /* $("#ABC").html("<option value='-1'>--Select Upazila--</option>");*/
                    }
                });


            }else{
                $("#upazila_no").html("<option value='-1'>--Select Upazila--</option>");
               
            }
        });

        
    });
</script>
