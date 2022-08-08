<?php
include('../../config/db_connection.php');
	$district_no = $_POST['district_no'];
	echo $sql="SELECT * FROM `gen_upazila` WHERE `district_no`='$district_no' ";
	$query = mysqli_query($con,$sql);
	$html = "";
	if(mysqli_num_rows($query) > 0){
	 	$html .="<select class='form-control' name='upazila_no' id='upazila_no'>";
	 	$html .="<option value='-1'>".'--Select Upazila--'."</option>";
	    while($row = mysqli_fetch_array($query)):
	        $html .="<option value='".$row['upazila_no']."'>".$row['upazila_name']."</option>";
	    endwhile;
	    $html .="</select>";  
	}
    echo $html;
?>