<?php include 'include/header.php';?>
<?php $table_heading = "disease Setup";?>
<?php include 'include/sidebar.php';?>
<?php include 'include/body-top.php';?>
 <?php
        $tbl_name="animal_disease";        //your table name
        $targetpage = "disease.php";  //your file name  (the name of this file)
    $user_no =$_SESSION['user']['user_no'];
    $CURR_TIME = date('Y-m-d :H:i:s'); 
        $mgs = '';
    if(isset($_GET['delete']))
    {
        $ID = $_GET['delete'];
        $sql = "UPDATE $tbl_name SET `is_deleted` = 1 ,`deleted_by` = '$user_no', `deleted_on` = '$CURR_TIME' WHERE animal_disease_no = $ID";
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
		   $disease_name = trim($_POST['disease_name']);
           $description = trim($_POST['description']);
           $causes = trim($_POST['causes']);
           $affected_animal = $_POST['affected_animal'];
           $symptom = $_POST['symptom'];
           $impacts = $_POST['impacts'];
           $prevention = $_POST['prevention'];
		   
		   if ($_FILES["disease_pic"]["error"] > 0) {
                    $disease_pic = "No .jpg";
                    
                } else {
                    $disease_pic = time().$_FILES["disease_pic"]["name"];
                    move_uploaded_file($_FILES["disease_pic"]["tmp_name"],"upload/" . $disease_pic);
                }
               
			$sql = "INSERT INTO $tbl_name (`animal_no`,`disease_name`,`disease_pic`, `description`, `causes`, `affected_animal` , `symptom`,`impacts`,`prevention` , `created_by` ,`created_on`) VALUES('$animal_no','$disease_name','$disease_pic', '$description', '$causes', '$affected_animal','$symptom','$impacts','$prevention', '$user_no', '$CURR_TIME')";
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
    {		$animal_no = $_POST['animal_no'];
			$animal_disease_no = $_POST['animal_disease_no'];
			$disease_name = trim($_POST['disease_name']);
           $description = trim($_POST['description']);
           $causes = trim($_POST['causes']);
           $affected_animal = $_POST['affected_animal'];
           $symptom = $_POST['symptom'];
           $impacts = $_POST['impacts'];
           $prevention = $_POST['prevention'];
		   if ($_FILES["disease_pic"]["error"] > 0) {
                    $disease_pic = "No .jpg";
                    
                } else {
                    $disease_pic = time().$_FILES["disease_pic"]["name"];
                    move_uploaded_file($_FILES["disease_pic"]["tmp_name"],"upload/" . $disease_pic);
                }
				
			$sql = "UPDATE $tbl_name SET `animal_no`='$animal_no', `disease_name` = '$disease_name',`disease_pic`='$disease_pic', `description` = '$description', `causes` = '$causes',`affected_animal` = '$affected_animal', `symptom` = '$symptom', `impacts` = '$impacts', `prevention` = '$prevention', `is_updated` = 1, `updated_by` = '$user_no' ,`updated_on` = '$CURR_TIME' WHERE animal_disease_no = $animal_disease_no";
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
        $sql = "SELECT * FROM $tbl_name WHERE `animal_disease_no` = '$id' ";
        $result = mysqli_fetch_array(mysqli_query($con,$sql));
    ?>
     <form class="cmxform form-horizontal " id="signupForm" method="post" enctype="multipart/form-data" >
     <div class="form-group " <?php if($mgs=='')echo "style='display:none;'" ?>>
            <div class=" col-md-6 col-md-offset-2 <?=$class?>"><a href="#" class="close" data-dismiss="alert" aria-label="close">x</a><?=$mgs?></div>
            <div>
                <input type="hidden" name="animal_disease_no" value="<?=$result['animal_disease_no']?>" />
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
            <label for="disease_name" class="control-label col-lg-3">Disease Name </label>
            <div class="col-lg-5">
                <input class=" form-control" id="disease_name" name="disease_name" value="<?=$result['disease_name']?>" type="text"   />
            </div>
            
        </div>
		<div class="form-group ">
            <label for="disease_name" class="control-label col-lg-3">Disease Image </label>
            <div class="col-lg-5">
                <input class=" form-control" id="disease_pic" name="disease_pic" value="<?=$result['disease_pic']?>" type="file"   />
            </div>
            
        </div>
        
		<div class="form-group ">
            <label for="description" class="control-label col-lg-3">Description </label>
            <div class="col-lg-5">
                <textarea type="text" class="form-control" id="description" name="description" > <?=$result['description']?> </textarea>
            </div>
            
        </div>
		<div class="form-group ">
            <label for="causes" class="control-label col-lg-3">Causes </label>
            <div class="col-lg-5">
                <textarea type="text" class="form-control" id="causes" name="causes" > <?=$result['causes']?> </textarea>
            </div>
            
        </div>
		<div class="form-group ">
            <label for="affected_animal" class="control-label col-lg-3">Affected Animals </label>
            <div class="col-lg-5">
                <textarea type="text" class="form-control" id="affected_animal" name="affected_animal" > <?=$result['affected_animal']?> </textarea>
            </div>
            
        </div>
		<div class="form-group ">
            <label for="symptom" class="control-label col-lg-3">Symptom </label>
            <div class="col-lg-5">
                <textarea type="text" class="form-control" id="symptom" name="symptom" > <?=$result['symptom']?> </textarea>
            </div>
            
        </div>
		<div class="form-group ">
            <label for="impacts" class="control-label col-lg-3">Impacts </label>
            <div class="col-lg-5">
                <textarea type="text" class="form-control" id="impacts" name="impacts" > <?=$result['impacts']?> </textarea>
            </div>
            
        </div>
		<div class="form-group ">
            <label for="prevention" class="control-label col-lg-3">Prevention </label>
            <div class="col-lg-5">
                <textarea type="text" class="form-control" id="prevention" name="prevention" > <?=$result['prevention']?> </textarea>
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
            <label for="disease_name" class="control-label col-lg-3">Disease Name</label>
            <div class="col-lg-5">
                <input type="text" id="disease_name" class="form-control" name="disease_name" />
            </div>
            
        </div>
		<div class="form-group ">
            <label for="disease_pic" class="control-label col-lg-3">Disease Image</label>
            <div class="col-lg-5">
                <input type="file" id="disease_pic" class="form-control" name="disease_pic" />
            </div>
            
        </div>
		<div class="form-group ">
            <label for="description" class="control-label col-lg-3">Description</label>
            <div class="col-lg-5">
                <textarea type="text" id="description" class="form-control" name="description" ></textarea>
            </div>
            
        </div>
		
		<div class="form-group ">
            <label for="causes" class="control-label col-lg-3">Causes</label>
            <div class="col-lg-5">
                <textarea type="text" id="causes" class="form-control" name="causes" ></textarea>
            </div>
            
        </div>
        <div class="form-group ">
            <label for="affected_animal" class="control-label col-lg-3">Affected Animals</label>
            <div class="col-lg-5">
                <textarea type="text" id="affected_animal" class="form-control" name="affected_animal" ></textarea>
            </div>
            
        </div>
		<div class="form-group ">
            <label for="symptom" class="control-label col-lg-3">symptom</label>
            <div class="col-lg-5">
                <textarea type="text" id="symptom" class="form-control" name="symptom" ></textarea>
            </div>
            
        </div>
		<div class="form-group ">
            <label for="impacts" class="control-label col-lg-3">Impacts</label>
            <div class="col-lg-5">
                <textarea type="text" id="impacts" class="form-control" name="impacts" ></textarea>
            </div>
            
        </div>
        <div class="form-group ">
            <label for="prevention" class="control-label col-lg-3">Prevention</label>
            <div class="col-lg-5">
                <textarea type="text" class="form-control" id="prevention" name="prevention" ></textarea>
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
    $query = "SELECT COUNT(*) as num FROM $tbl_name WHERE `is_deleted` = 0";
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
    $sql = "SELECT * FROM $tbl_name LEFT JOIN `add_animal` ON `add_animal`.`animal_no`=$tbl_name.`animal_no` WHERE $tbl_name.`is_deleted` = 0 ORDER BY `animal_disease_no` DESC LIMIT $start, $limit";
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
            <th><center>Disease Name</center></th>
            <th><center>Disease Image</center></th>
            <th><center>Description</center></th>
            <th><center>Causes</center></th>
            <th><center>Affected AnimalS</center></th>
            <th><center>Symptom</center></th>
            <th><center>Impacts</center></th>
            <th><center>Prevention</center></th>
            <th><center>Action</center></th>
         </tr>
    <?php $i=$page*$limit-$limit+1; while($row = mysqli_fetch_array($result)):?>
        <tr>
            <td><center><?=$i++?></center></td>
			<td><?=$row['animal_name']?></td>
			<td><a class="btn btn-primary" target="_blank" href="upload/<?=$row['disease_pic']?>"><i class="fa fa-eye" aria-hidden="true"></i> View</a></td>
            <td><?=$row['disease_name']?></td>
            <td><?=$row['description']?></td>
            <td><?=$row['causes']?></td>
            <td><?=$row['affected_animal']?></td>
            <td><?=$row['symptom']?></td>
            <td><?=$row['impacts']?></td>
            <td><?=$row['prevention']?></td>
           <td>
               <center> <a onclick="return confirm('Are you Sure Want to Edit?');" href="<?=$targetpage.'?edit='.$row['animal_disease_no']?>" class="btn btn-primary"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
                <a onclick="return confirm('Are you Sure Want to Delete?');" href="<?=$targetpage.'?delete='.$row['animal_disease_no']?>" class="btn btn-danger"><i class="fa fa-trash-o" aria-hidden="true"></i></a></center>
            </td>
        </tr>
    <?php endwhile;?>
    </table>

<?=$pagination?>
    
    <!---main content end---->
<?php include 'include/footer.php';?>