<?php
include './session.php';
include './conn.php';
session_start();

$sess_Username = $_SESSION["username"];
// $sender = $_GET["sender"];
// $receiver = $_GET["receiver"];


//     $sendreceive = $sender . "%2d%" . $receiver;
// 	$sendreceive2 = $receiver . "%2d%" . $sender;
// admin%2d%0
// 0%2d%admin

$me_query1 = "select * from users where username = '" . $sess_Username . "'";

	$selectQuery = $mysql->query($me_query1);
    while($row = $selectQuery->fetch_assoc()){
        $me_username = $row["username"];
		$me_profile_image = $row["profile"];
		$admin_flag = $row["admin_flag"];
		$me_uid = $row["id"];
        // echo $us;
    }

	$_SESSION['id'] = $me_uid;
	$sess_uid = $_SESSION['id'];
	// echo $sess_uid;

	// message counter
	$message_counter = 0;
	$query_message_counter = "Select * from messages where receiver_id = '$me_uid' and message_unread = '1'; ";
	$selectQuery = $mysql->query($query_message_counter);
    while($row = $selectQuery->fetch_assoc()){
		$message_counter += 1;
    }
	


	// $result=mysql_query("select count(*) from message where sendreceive = '".$sendreceive."' or sendreceive = '".$sendreceive2."' where message_flag = '1';");
	// $data=mysql_fetch_assoc($result);
	// $message_flag = $data['total'];

?>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="./all.css">
    <!-- <link rel="stylesheet" type="text/css" href="./dist/header.css"> -->
	
	<style>
		/* img#img-profile{
			height:100px;
		} */

		.header{
			border: solid 5px #BA00F8;
			border-radius: 8px;
		}
		.class_username{
			font-size: 40px;
			color: #39f800;
			padding-left: 10px;
		}
		td{
			padding: 20px;
		}
		.img_icon{
			width: 80px;
		}
	</style>
</head>
<body>
	<div class="header">
		<table width="100%" class="header__table"  style="background-color: #383838;">
			<tr>

				<td width="10%" clas="header__table-td">
					<a href="./profile.php">
						<img src="./profile/<?php echo $me_profile_image; ?>" id="header__table-td-img">
						<br>
						<span class="class_username">
							<?php echo $sess_Username ?>
						</span>
						
					</a>

					
					
					<?php if($admin_flag  == "1"){
					?>
					<br>
					<a href="./approveuser.php">
						<span style="color: #EC0000; text-decoration: none;">Approve User </span>
					</a>
					<?php 
					}
					?>
				</td>

				<td class="header__table-td-dashboard" width="30%">
					<a href="./index.php">
						<!-- <img src="./icon/nesta.png" width="200em">  -->
						<center>
							<img src="./icon/home.svg" alt="" srcset="" class="img_icon">
						</center>
						<!-- <h2>Message</h2> -->
					</a>
				</td>

				<td class="header__table-td-dashboard" width="24%">
					
					<!-- <img src="./icon/nesta.png" width="200em">  -->
					<h2 >
						<span >
							<a href="./friendlist.php" style=" padding: 10px 20px; color:#EC0000; text-decoration: none;"> 
								<img src="./icon/friend.svg" alt="" srcset="" class="img_icon">
							</a>
						</span>
					</h2>
				</td>


				<td class="header__table-td-dashboard" width="24%">
					
					<!-- <img src="./icon/nesta.png" width="200em">  -->
					<h2 >
						<span style=" padding: 10px 20px; color:#EC0000;">
							<a href="./message.php" style=" padding: 10px 20px; color:#EC0000; text-decoration: none;">
								<img src="./icon/message.svg" alt="" srcset="" class="img_icon">
							</a> <?php echo $message_counter; ?>
						</span>
					</h2>
				</td>
				
				<td >
					<a  style="color: #EC0000; font-size: 30px; text-decoration: none;" href="./logout.php">
						<img src="./icon/logout.svg" alt="" srcset="" class="img_icon">
					</a>
				</td>

			</tr>
		</table>
	</div>
</body>
</html>