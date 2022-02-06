<?php
	include('db_connection.php');
	$success_message = '';
	$error_message = '';

	$id = $_GET['id'];
		$sql = "SELECT * FROM post_news where id = ".$id;
			$result = $conn->query($sql);
			$row = $result->fetch_assoc();
		if(!empty($_POST)){
	
			$title = $_POST['title'];
			$details = $_POST['details'];
			$id = $_POST['id'];
			$image_old_value = $_POST['image_old_value'];	
			$photo_name = $image_old_value;
			$category= ($_POST['category']);
		
			if(!empty($_FILES["image"]["name"])){
				
						$image1_name = $_FILES["image"]['name'];	
						$target_dir  = "uploads/";
						//delete old image
				
						@unlink($target_dir.$photo_name);
						$photo_name  = rand(999999,1000).basename($image1_name);
						$target_file = $target_dir . $photo_name;	
						// if uploaded
						move_uploaded_file($_FILES["image"]["tmp_name"], $target_file);
						
			}
				
			if($id){
				$sql = "UPDATE post_news SET title='$title',details='$details', image='$photo_name' , category='$category' WHERE id=".$id;
				if ($conn->query($sql) === TRUE) {
					//upload photo	
				}		
            $success_message = " updated successfully";	
				header("Location:admin_show.php"); /* Redirect browser */
			
			}else {
			
					$error_message = $conn->error;
				  }	
	}
		
	
?>
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
			height: 750px;
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
		<div class="container">  
			<div class="row justify-content-md-center">  
				<form method="post" action="" enctype="multipart/form-data">	  
					<div class="form-group">
						<label> Title</label>
						<input name="title" class="form-control" value="<?php echo $row['title']; ?>">
						<input type="hidden" name="id" value="<?php echo $row['id']; ?>">
						<input type="hidden" name="image_old_value" value="<?php echo $row['image']; ?>">
					</div>
					<div class="form-group">
						<label> Details</label>
						<textarea name="details" class="form-control" required><?php echo $row['details']; ?></textarea>
						<input type="hidden" name="id" value="<?php echo $row['id']; ?>">
						<input type="hidden" name="image_old_value" value="<?php echo $row['image']; ?>">
					</div>

					<div class="form-group">
						<label>Existing Photo</label><br/>
						<?php 
							$photo_sql = "SELECT * FROM post_news where id = ".$id." order by id asc";
							$photo_result = $conn->query($photo_sql);
							
							if ($photo_result->num_rows > 0) {
								while($photo_row = $photo_result->fetch_assoc()) {
									if(!empty($photo_row["image"])){
										echo '<div class="col-md-8"><img alt="" src="uploads/'.$photo_row["image"].'" width="250" height="200" /></div>';
									}
								}
							} 
						?>
						<br/><br/>
					</div>
					<div class="clearfix"></div>
					<div class="form-group">
					<label>Upload Photo</label>
					<input type="file" name="image" class="form-control">
					<div class="form-group">
						<label>	Category</label>
						<input name="category" type="text" class="form-control" value="<?php echo $row['category']; ?>" >
					</div> 
					</div>
					<button type="submit" class="btn btn-primary">Submit</button>
				</form>
			</div>
		</div>
	</body>
</html>
