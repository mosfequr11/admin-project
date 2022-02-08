 <?php
	include('db_connection.php');
	$success_message = '';
	$error_message = '';

	if (sizeof($_POST)) {
		$title = trim($_POST['title']);
		$details = trim($_POST['details']);
		$category = trim($_POST['category']);
		$news_date = $_POST['news_date'];
		if (!empty($title)) {
			//upload photo
			if (!empty($_FILES["image"]["name"])) {
				$image1_name = $_FILES["image"]['name'];
				$target_dir  = "uploads/";
				//$photo_name  = rand(999999,1000).basename($image1_name);
				$photo_name  = basename($image1_name);
				$target_file = $target_dir . $photo_name;
				// if uploaded
				if (move_uploaded_file($_FILES["image"]["tmp_name"], $target_file)) {
					$sql = "INSERT INTO post_news(title,details,image,category,news_date) VALUES ('$title','$details','$image1_name','$category','$news_date')";
				}
				$success_message = $conn->query($sql) ? 'Inserted successfully' : 'Insertion failed';
			}

			echo $success_message;
			header("Location: admin_show.php"); /* Redirect browser */
		}
	}
	?>
 <!DOCTYPE html>
 <html>

 <head>
 	<title>Admin panel</title>
 	<link rel="stylesheet" type="text/css" href="css/master.css">
 	<link rel="stylesheet" type="text/css" href="css/style.css">
 	<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
 	<link rel="stylesheet" href="css/bootstrap.min.css">
 </head>

 <body>
 	<div class="jumbotron">
 		<div class="container text-center">
 			<h1>Upload News</h1>
 		</div>
 	</div>
 	<div class="container">
 		<div class="row justify-content-md-center">
 			<div class="col col-lg-12">
 				<h4><a href="admin.php">Upload News</a> | <a href="admin_show.php">Show News</a></h4><br />

 				<form method="post" action="" enctype="multipart/form-data">
 					<div class="form-group">
 						<label>Title</label>
 						<input type="text" name="title" class="form-control" placeholder="Enter Title" required>
 					</div>
 					<div class="form-group">
 						<label>details</label>
 						<textarea name="details" type="text" class="form-control" placeholder="Enter Details"></textarea>
 					</div>
 					<div class="form-group">
 						<label>Upload Photo</label>
 						<input type="file" name="image" class="form-control">
 					</div>
 					<div class="form-group">
 						<label> Category</label>
 						<select class="form-control" name="category">
 							<option value="">Select One</option>
 							<option value="Topnews">Topnews</option>
 							<option value="Popularnews">Popularnews</option>
 							<option value="International">International</option>
 							<option value="Bangladesh">Bangladesh</option>
 							<option value="Sportsnews">Sportsnews</option>
 						</select>
 					</div>
 					<div class="form-group">
 						<label>Date</label>
 						<input name="news_date" type="date" class="form-control"></textarea>
 					</div>
 					<button type="submit" class="btn btn-primary">Submit</button>
 				</form>
 			</div>
 		</div>
 	</div>
 </body>

 </html>