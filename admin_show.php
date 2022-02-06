<?php
	include('db_connection.php');
	$success_message = '';
	$error_message = '';


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

	</head>
	<body>
		<div class="jumbotron">
			<div class="container text-center">
				<h1>Admin Panel</h1>
			</div>
		</div>	 
		<h4><a href="admin.php">Upload News</a> | <a href="admin_show.php">Show News</a></h4><br/>
		<!--Show table  -->
		<div class="container"> 
		<form method="post" action="admin_delete.php" enctype="multipart/form-data"> 
			<table class="table table-bordered table-hover">
				<thead>
					<tr>
						
						<th><button type="submit" name="delete_multiple_record_id" class="btn btn-danger">Delete</button></th>
						<th>ID</th>
						<th>Title</th>
						<th>Details</th>						
						<th>Image</th>
						<th>Category</th>						
						<th>Status</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<?php 
						$sql = "SELECT * FROM post_news";
						$result = $conn->query($sql);
						
						if ($result->num_rows > 0) {
						// output data of each row
							while($row = $result->fetch_assoc()) {?>
							<tr>
								<td class="text-center"><input type="checkbox"  name="delete_record_id[]" value="<?php echo $row["id"]; ?>"></td>
								<td><?php echo $row["id"]; ?></td>
								<td><?php echo $row["title"]; ?></td>
								<td><?php echo $row["details"]; ?></td>
								<td><?php echo $row["image"]; ?></td>
								<td><?php echo $row["category"]; ?></td>								
								<td>
								  <div class="btn-group" role="group">
										<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown"><span class="caret"></span></button>
										<ul class="dropdown-menu">
										   <li><a href="" onclick="return confirm('Do you want to pending?')">Pending</a></li>
										   <li><a href="" onclick="return confirm('Do you want to approved?')">Approved</a></li>
										   <li><a href="" onclick="return confirm('Do you want to rejected?')">Rejected</a></li>
										</ul>
								  </div>
								</td>								
								<td>
								<a href="admin_update.php?id=<?php echo $row["id"]; ?>">Update</a> | <a href="admin_delete.php?delete_id=<?php echo $row["id"]; ?>" onclick="return confirm('you want to delete');">Delete</a>		
								</td>
							 </tr>
							<?php
							}
						}		
						else{
						echo '<tr><td colspan="8" class="text-center">No data found</td></tr>';
						}
					?>
				</tbody>
			</table>
		</form>
		</div>
	</body>
</html>