 <?php
	include('db_connection.php');
	$success_message = '';
	$error_message = '';

	if(sizeof($_POST)){
	    $title= trim($_POST['title']);
		$details= trim($_POST['details']);
		$category= trim($_POST['category']);		
		if(!empty($title)){
			//upload photo
		    if(!empty($_FILES["image"]["name"])){
                $image1_name = $_FILES["image"]['name'];	
                $target_dir  = "uploads/";
				//$photo_name  = rand(999999,1000).basename($image1_name);
                 $photo_name  = basename($image1_name);
                $target_file = $target_dir . $photo_name;	
				// if uploaded
			    if (move_uploaded_file($_FILES["image"]["tmp_name"], $target_file)) {
				    $sql = "INSERT INTO post_news(title,details,image,category) VALUES ('$title','$details','$image1_name','$category')";
		
			    }     
			$success_message = $conn->query($sql) ? 'Inserted successfully' : 'Insertion failed';       			
			}			
		    
			echo $success_message;
			header("Location: admin_show.php"); /* Redirect browser */		
		} 						
	}
	//select row and fetch		
	// if(!empty($_GET['delete_id'])){
	// 	$user_id = $_GET['delete_id'];
	// 	$sql = "DELETE FROM post_news WHERE id=".$user_id;
	// 	if ($conn->query($sql) === TRUE) {
	// 		$success_message = "deleted successfully";
	// 	} else {
	// 		$error_message = "Error deleting record: " . $conn->error;
	// 	}
	// }
	
?>
<!DOCTYPE html>
<html>
	<head>
		<title>Admin panel</title>
		<link rel="stylesheet" type="text/css" href="css/master.css">
		<link rel="stylesheet" type="text/css" href="css/style.css">
		<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
		<link rel="stylesheet" href="css/bootstrap.min.css">
	<style>
		body {
		font-size: 16px;
		}
		table{
			width: 80%;
			margin: 10px auto;
			border-collapse: collapse;
			text-align: left;
		}
		tr {
			border: 1px solid #cbcbcb;
			background:  #8cff66;
		}
		th, td{
			border: none;
			height: 30px;
			padding: 20px;
		}
		tr:hover {
			background: #F5F5F5;
		}

		form {
			width: 850px;
			margin: 0px auto;
			text-align: left;
			padding: 20px;
			border: 1px solid #bbbbbb;
			border-radius: 5px;
			background: #99ccff;
			height: 500px;
		}

		.input_group {
			margin: 10px 0px 10px 0px;
		}
		.input_group label {
			display: block;
			text-align: left;
			margin: 3px;
		}
		.input_group input {
			height: 30px;
			width: 93%;
			padding: 5px 10px;
			font-size: 16px;
			border-radius: 5px;
			border: 1px solid gray;
		}
		.btn {
			padding: 10px;
			font-size: 15px;
			color: white;
			background: #5F9EA0;
			border: none;
			border-radius: 5px;
		}
		.edit_btn {
			text-decoration: none;
			padding: 2px 5px;
			background: #2E8B57;
			color: white;
			border-radius: 3px;
		}

		.del_btn {
			text-decoration: none;
			padding: 2px 5px;
			color: white;
			border-radius: 3px;
			background: #800000;
		}
		.msg {
			margin: 30px auto; 
			padding: 10px; 
			border-radius: 5px; 
			color: #3c763d; 
			background: #dff0d8; 
			border: 1px solid #3c763d;
			width: 50%;
			text-align: center;
		}
		.set_button{
			width: 45%;
			margin: 50px auto;
			text-align: left;
			padding: 20px; 
			border: 1px solid #bbbbbb; 
			border-radius: 5px;
			background:  #8cff66;
			
		}
		.jumbotron_insert{
			padding-top:30px;
			padding-bottom:30px;
			margin-bottom:30px;
			color:inherit;
			background-color: #ddff99;
		}
	
	</style>
	</head>
	<body>
		<div class="jumbotron">
			<div class="container text-center">
				<h1>Admin Panel</h1>
			</div>
		</div>
		<h4><a href="admin.php">Upload News</a> | <a href="admin_show.php">Show News</a></h4><br/>
		<div id="form">
			<form method="post" action="" enctype="multipart/form-data">  
				<div class="form-group">
					<label>Title</label>
					<input name="title" type="text" class="form-control" required>
				 </div> 
				<div class="form-group">
					<label>details</label>
					<textarea name="details" type="text" class="form-control" required></textarea>
				</div> 
				<div class="form-group">
					<label>Upload Photo</label>
					<input type="file" name="image" class="form-control">
				</div>
				<div class="form-group">
					<label>	Category</label>
					<select class="form-control" name="category" required>
						<option value="">Select One</option>
						<option value="Topnews">Topnews</option>
						<option value="Popularnews">Popularnews</option>
						<option value="Latestnews">Latestnews</option>
						<option value="Webnews">Webnews</option>
						<option value="International">International</option>
						<option value="Bangladesh">Bangladesh</option>
						<option value="Sportsnews">Sportsnews</option>
					</select>
				</div> 
			  <button type="submit" class="btn ">Submit</button>
			</form>
		</div>
	</body>
</html>