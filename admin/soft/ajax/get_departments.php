<?php
include('../../config/db_connection.php');
	$category_no = $_POST['category_no'];
	echo $sql="SELECT * FROM `departments` WHERE `is_deleted`=0 AND `category_no`='$category_no' ";
	$query = mysqli_query($con,$sql);
	$html = "";
	if(mysqli_num_rows($query) > 0){
	 	$html .="<select class='form-control' name='department_no' id='department_no'>";
	 	$html .="<option value='-1'>".'--Select Department--'."</option>";
	    while($row = mysqli_fetch_array($query)):
	        $html .="<option value='".$row['department_no']."'>".$row['department_name']."</option>";
	    endwhile;
	    $html .="</select>";  
	}
    echo $html;
?>