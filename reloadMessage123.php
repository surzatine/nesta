<?php
include "./include/conn.php";
include "./include/session.php";


session_start();
// receiver
$receiver_id = $_GET["chat"];
// echo $receiver_id;

// username
$sess_Username = $_SESSION["username"];
// echo $sess_Username;

// Receiver Profile
$receiverProfileQuery = $mysql->query("select * from users where id='".$receiver_id."';");
while($row = $receiverProfileQuery->fetch_assoc()){
	$receiverProfile = $row["profile"];
    $receiver_username = $row["username"];
	$receiver_public_key = $row["public_key"];
	$receiver_private_key = $row["private_key"];

}

// echo $receiver_username;

// Sender Profile
$senderProfileQuery = $mysql->query("select * from users where username='".$sess_Username."';");
while($row = $senderProfileQuery->fetch_assoc()){
	$sess_uid = $row["id"];
	$senderProfile = $row["profile"];
	$sender_public_key = $row["public_key"];
	$sender_private_key = $row["private_key"];
}

// Refresh
// $refresh = "select * from messages where (sender_id = $sess_uid and sender_refresh = 1) or (receiver_id = $sess_uid and receiver_refresh = 1);";

$refresh_false = 0;
// $selectQuery = $mysql->query($refresh);
// while($row = $selectQuery->fetch_assoc()){
	// $refresh_counter += $row["sender_refresh"] + $row["receiver_refresh"];
	
    $registerQuery = $mysql->prepare("update messages set sender_refresh = ? where (sender_id = $sess_uid and sender_refresh = 1);");
        
    $registerQuery->bind_param("s",$refresh_false);
    
    $registerQuery->execute();

	
    $registerQuery = $mysql->prepare("update messages set receiver_refresh = ? where (receiver_id = $sess_uid and receiver_refresh = 1);");
        
    $registerQuery->bind_param("s",$refresh_false);
    
    $registerQuery->execute();

	// echo $us;
// }
// if($refresh_counter > 0){
// 	echo $refresh_counter;
	// echo "changeContent();";
	// echo "setInterval(changeContent,1000);";
// }

?>


<!DOCTYPE html>
<html>
<head>
	<title>message</title>
	<style>
		.message tr{
			background-color: #2C2D31;
			color: white;
			border-collapse: collapse;
		}
		.message tr td.msg_sender{
			background-color: #0084FF;
			padding: 0px 10px;
			border-radius: 20px 20px 0px 20px;
		}
		.message tr td.msg_receiver{
			background-color: red;
			padding: 0px 10px;
			border-radius: 20px 20px 20px 0px;
		}
		.message tr td{
			padding: 0px 00px;
			border-collapse: collapse;
			/* margin: 20px; */
			border: 10px solid #323338;
			background-color: #323338;
		}
		#date_time{
			font-size: 10px;
		}
	</style>

</head>
<body>
	<table class="message">

		<?php
			$friend_style_online = "style='border-radius: 50%; border: green 2px solid;'";

			$messageQuery = $mysql->query("select * from messages where (sender_id = '$sess_uid' and receiver_id = '$receiver_id') or (sender_id = '$receiver_id' and receiver_id = '$sess_uid');");
				// $messageQuery = $mysql->query("select * from messages;");
    		while($row = $messageQuery->fetch_assoc()){
				
    			$date = $row["date"];
				$time = $row["time"];
				$messagesender = $row["sender"];
				$message1 = $row["message"];
				$image = $row["image"];
				// $profile = $row["profile"];

				// RSA DECRYPTED
				// $decrypted_message = "";
				if($message1 != ""){
					if($messagesender == $sess_Username){
						$decoded_encrypted = base64_decode($message1);
						openssl_private_decrypt($decoded_encrypted, $decrypted_message, $receiver_private_key);
						$message1 = $decrypted_message;	
					}
					else{
						$decoded_encrypted = base64_decode($message1);
						openssl_private_decrypt($decoded_encrypted, $decrypted_message, $sender_private_key);
						$message1 = $decrypted_message;	
					}
				}
							
				
				// toxic
				// $message1 = "hey mula";
				$myfile = fopen("toxic.txt", "r");
				$toxics = explode("\n",fread($myfile,filesize("toxic.txt")));
				// print_r($toxic);
				fclose($myfile);

				// messgae
				$get_msg_txts = explode(" ",$message1);
				// print_r($get_msg_txts);
				$total_msg_txt = "";
				foreach($get_msg_txts as $get_msg_txt){
					foreach($toxics as $toxic){

						if($toxic == ""){
							continue;
						}
					
						if(preg_match_all("/".$toxic."/i", $get_msg_txt)){
							$count = strlen($get_msg_txt);
							$a = "";
							for($i=1;$i<$count;$i++){
								$a = $a . "*";
							}
							$get_msg_txt = substr($get_msg_txt, 0, 1) . $a;
						}
						// echo $get_msg_txt;

						
					}
					$total_msg_txt = $total_msg_txt ." " . $get_msg_txt;
				}

				if($image != ""){

                    
					echo "<tr>";
                    // echo "<td>" . $date . "</td>";
					// echo "<td>" . $time  . "</td>";
					if($messagesender == $sess_Username){
						echo "<td></td>";
						echo "<td align='right' class='msg_sender' ><img src='./message/" . $image . "' width='300px'></td>";
						echo "<td><img src='./profile/".$senderProfile."' width='30px' height='30px' ". $friend_style_online."></td>";
					}
					else{
						echo "<td><img src='./profile/".$receiverProfile."' width='30px' height='30px' ". $friend_style_online."></td>";	
						echo "<td class='msg_receiver' ><img src='./message/" . $image . "' width='300px'></td>";
						echo "<td></td>";
					}
					echo "<td id='date_time'>$date <br> $time</td>";
					echo "</tr>";

					if($message1 != ""){
						echo "<tr>";
						// echo "<td>" . $date . "</td>";
						// echo "<td>" . $time  . "</td>";
						if($messagesender == $sess_Username){
                            echo "<td></td>";
                            echo "<td align='right' class='msg_sender' >" . $total_msg_txt . "</td>";
                            echo "<td><img src='./profile/".$senderProfile."' width='30px' height='30px' ". $friend_style_online."></td>";

                            
                            
							// echo "<td><img src='./profile/".$senderProfile."' width='30px' height='30px' ". $friend_style_online."></td>";
						}
						else{
                            echo "<td><img src='./profile/".$receiverProfile."' width='30px' height='30px' ". $friend_style_online."></td>";	
                            echo "<td class='msg_receiver' >" . $total_msg_txt . "</td>";
                            echo "<td></td>";

							// echo "<td><img src='./profile/".$receiverProfile."' width='30px' height='30px' ". $friend_style_online."></td>";	
						}

						// echo "<td>" . $total_msg_txt . "</td>";
						echo "<td id='date_time'>$date <br> $time</td>";
						echo "</tr>";
					}
				}
				else{
					echo "<tr>";
					// echo "<td>" . $date . "</td>";
					// echo "<td>" . $time  . "</td>";
					if($messagesender == $sess_Username){
                        echo "<td></td>";
                        echo "<td align='right' class='msg_sender' >" . $total_msg_txt . "</td>";
                        echo "<td><img src='./profile/".$senderProfile."' width='30px' height='30px' ". $friend_style_online."></td>";
					}
					else{
                        echo "<td><img src='./profile/".$receiverProfile."' width='30px' height='30px' ". $friend_style_online."></td>";	
                        echo "<td class='msg_receiver' >" . $total_msg_txt . "</td>";
                        echo "<td></td>";
					}
	
					// echo "<td>" . $total_msg_txt . "</td>";
					echo "<td id='date_time'>$date <br> $time</td>";
					echo "</tr>";
				}
		    }
		?>
	</table>

	<script>
		// onmouseenter='show_datetime()' onmouseleave='hide_datetime()'

		function show_datetime(){
			document.getElementById(date_time) = <?php echo $date . " " . $time; ?>;
		}

		function hide_datetime(){
			document.getElementById(date_time) = "";
		}
	</script>
	
</body>
</html>