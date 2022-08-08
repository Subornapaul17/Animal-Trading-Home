<?php
	function ShowAuthors($con,$authors){
		$sql = "SELECT `author_no`, `author_name` FROM `authors` WHERE `author_no` IN ($authors)";
		$query = mysqli_query($con,$sql);
		$result="";
		while($row = mysqli_fetch_array($query)):
			$result.=",".$row['author_name'];
		endwhile;
		return substr($result, 1);
	}

	
?>