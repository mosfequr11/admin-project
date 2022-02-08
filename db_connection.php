<?php
	$servername = "localhost";
	$username = "root";
	$password = "";
	$dbname = "admin-project-git";

	// Create connection
	$conn = new mysqli($servername, $username, $password, $dbname);
	$conn->set_charset("utf8");
	//echo "connect";   
	// Check connection
	if ($conn->connect_error) {
		die("Connection failed: " . $conn->connect_error);
		 echo" not connect";
	}
?>