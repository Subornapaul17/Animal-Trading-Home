<?php
include('../../config/db_connection.php');
	$brand_no = $_POST['brand_no'];
	$sql="SELECT * FROM `sub_categories` WHERE `is_deleted`=0 AND `brand_no`='$brand_no'";
	$query = mysqli_query($con,$sql);
	$html = "";
	if(mysqli_num_rows($query) > 0){

	 	$html .="<select class='form-control' name='sub_category_no' id='sub_category_no'>";
	 	$html .="<option value='0'>".'--Select Sub Category--'."</option>";
	    while($row = mysqli_fetch_array($query)):
	    	
	        $html .="<option value='".$row['sub_category_no']."'>".$row['sub_category_name']."</option>";
	    endwhile;
	    $html .="</select>";  
	}
    echo $html;
?>