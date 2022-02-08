<?php
include('db_connection.php');
$success_message = '';
$error_message = '';

// if(!empty($_GET['status_update'])){
// 	$status = $_GET['status_update'];
// 	$user_id = $_GET['id'];
// 	$sql = "UPDATE post_news  SET status='$status' WHERE id=".$user_id;
// 	if ($conn->query($sql) === TRUE) {
// 		$success_message = "Status updated successfully";
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
	<h4><a href="admin.php">Upload News</a> | <a href="admin_show.php">Show News</a></h4><br />
	<?php
	if (!empty($success_message)) {
		echo '<div class="alert alert-success" role="alert">' . $success_message . '</div>';
	}
	if (!empty($error_message)) {
		echo '<div class="alert alert-danger" role="alert">ERROR: ' . $error_message . '</div>';
	}
	?>
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
						while ($row = $result->fetch_assoc()) { ?>
							<tr>
								<td class="text-center"><input type="checkbox" name="delete_record_id[]" value="<?php echo $row["id"]; ?>"></td>
								<td><?php echo $row["id"]; ?></td>
								<td><?php echo $row["title"]; ?></td>
								<td><?php echo $row["details"]; ?></td>
								<td><?php echo $row["image"]; ?></td>
								<td><?php echo $row["category"]; ?></td>
								<td><?php echo ucfirst($row["status"]); ?></td>
								<td>
									<a href="admin_update.php?id=<?php echo $row["id"]; ?>">Update</a> | <a href="admin_delete.php?delete_id=<?php echo $row["id"]; ?>" onclick="return confirm('you want to delete');">Delete</a>
								</td>
							</tr>
					<?php
						}
					} else {
						echo '<tr><td colspan="8" class="text-center">No data found</td></tr>';
					}
					?>
				</tbody>
			</table>
		</form>
	</div>
</body>

</html>