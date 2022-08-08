<?php
	include '../config/db_connection.php';
	function get_all_district(){
		$html = "<option value='-1'>--Select--</option>";
		$sql = "SELECT * FROM `gen_districts` order by `district_name` ASC";
    	$query = $GLOBALS['con']->query($sql);
    	foreach ($query as $value) {
    		$html .= "<option value='".$value['district_id']."'>".$value['district_name']."</option>";
    	}
    	return $html;
	}

	function get_identification_types(){
		$html = "<option value='-1'>--Select--</option>";
		$sql= "SELECT * FROM `gen_identification_types` ORDER BY id_type_name ASC";
		$query = $GLOBALS['con']->query($sql);
		foreach($query as $value){
			$html .= "<option value='". $value ['id_type_id']."'>".$value['id_type_name']."</option>";
		}
		return $html;	
		

	}

    function get_problem_types(){
        $html = "<option value='-1'>--Select--</option>";
        $sql= "SELECT * FROM `gen_problem_types` ORDER BY problem_type_name ASC";
        $query = $GLOBALS['con']->query($sql);
        foreach($query as $value){
        $html .= "<option value='". $value ['problem_type_id']."'>".$value['problem_type_name']."</option>";
        }
        return $html;	
    }

        
        
    
?>;