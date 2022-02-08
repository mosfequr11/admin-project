<?php

	include('db_connection.php');
	$success_message = '';
	$error_message = '';

	//Multiple record delete

	if(isset($_POST['delete_multiple_record_id'])){
		$select_multiple_id = $_POST['delete_record_id'];
		$user_id = implode(',', $select_multiple_id);
			// echo "<pre>";
			// var_dump($user_id);
			// echo "</pre>";
			// echo $user_id;
				// echo "<pre>";
				// print_r($select_multiple_id);
				// echo "</pre>";

		$sql = "DELETE FROM post_news WHERE id IN($user_id)";
		if ($conn->query($sql) === TRUE) {
			$success_message = "deleted successfully";
			header("Location: admin_show.php"); /* Redirect browser */
		} else {
			$error_message = "Error deleting record: " . $conn->error;
		}
	}
	// else
	// echo "helloworld";

	//select row and fetch	
	if(!empty($_GET['delete_id'])){
		$user_id = $_GET['delete_id'];
		print_r($user_id);
		$sql = "DELETE FROM post_news WHERE id=".$user_id;
		if ($conn->query($sql) === TRUE) {
			$success_message = "deleted successfully";
			header("Location: admin_show.php"); /* Redirect browser */
		} else {
			$error_message = "Error deleting record: " . $conn->error;
		}
	}
	
