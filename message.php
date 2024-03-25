<!-- <pre> -->
<?php
include './include/session.php';
include './include/conn.php';
session_start();


// receiver
$receiver_id = $_GET["chat"];
// echo $receiver;

// username
$sess_Username = $_SESSION["username"];

	$me_query = "select * from users where username = '" . $sess_Username . "'";
	$selectQuery = $mysql->query($me_query);
    while($row = $selectQuery->fetch_assoc()){
        $me_username = $row["username"];
		$sess_uid = $row["id"];

		$sender_public_key = $row["public_key"];
		$sender_private_key = $row["private_key"];
        // echo $us;
    }

	// online
	$receiver_query = "select * from users where id = '" . $receiver_id . "'";

	$selectQuery = $mysql->query($receiver_query);
    while($row = $selectQuery->fetch_assoc()){
        $receiverProfile = $row["profile"];
		$receiver_username = $row["username"];
		$receiver_online_status = $row["online_status"];
		$receiver_public_key = $row["public_key"];
		$receiver_private_key = $row["private_key"];

		if($receiver_online_status == "1"){
			$receiver_style_online = "style='border-radius: 50%; border: green 4px solid;'";
		}
		else{
			$receiver_style_online = "style='border-radius: 50%; border: red 4px solid;'";
		}
        // echo $us;
    }

	// Remove messenger counter
	if($receiver_id != ""){
		$update_message_unread = 0;
		$registerQuery = $mysql->prepare("update messages set message_unread = ? where sender_id = ? and receiver_id = ?;");
			
		$registerQuery->bind_param("iii", $update_message_unread, $receiver_id, $sess_uid);
		
		$registerQuery->execute();
	}

// print_r($_FILES);
	// message
	if(isset($_POST["send"])){

		if (isset($_FILES['image']['error']) && $_FILES['image']['error']== 0 ) {
			if (isset($_FILES['image']['size']) && $_FILES['image']['size'] < 4000000) {
				$file_types = ['image/jpeg','image/png','image/jpg'];
				if (in_array($_FILES['image']['type'], $file_types)) {
					//chmod('images', 0777);
					 $pname = uniqid() . '_' . $_FILES['image']['name'];
					if (move_uploaded_file($_FILES['image']['tmp_name'], 'message/' .$pname )) {
						echo 'Success';
					} 
					else {
						echo 'Image upload failed';
					}
				} 
				else {
					$err['image'] = 'Image type mismatch';
				}
			} 
			else {
				$err['image'] = 'Image size exceed';
			}
		} 
		else {
			$err['image'] = 'Please upload image';
		}

		// print_r($_FILES);

		

		if($_SERVER["REQUEST_METHOD"]=="POST"){
			$message_flag = 1;
            $sender_refresh = 1;
            $receiver_refresh = 1;

			// RSA Encrypted
			$text_message = $_POST["text"];
			$encoded_encrypted = "";
			if($text_message != ""){
				openssl_public_encrypt($text_message, $encrypted, $receiver_public_key);
				$encoded_encrypted = base64_encode($encrypted);
			}			
			
			$registerQuery = $mysql->prepare("insert into messages(date, time, sender_id, receiver_id, sender, message, image, message_unread, message_counter, sender_refresh, receiver_refresh)values (?,?,?,?,?,?,?,?,?,?,?);");
			
			$registerQuery->bind_param("sssssssssss",date("Y-m-d"), date("h:i:s a"),$sess_uid,$receiver_id,$sess_Username,$encoded_encrypted,$pname,$message_flag,$message_flag, $sender_refresh, $receiver_refresh);
			
			$registerQuery->execute();
		}

	}

?>

<!DOCTYPE html>
<html>
<head>
	<title>Message</title>
    <link rel="shortcut icon" type="image/png" href="./icon/favicon.png"/>
    <link rel="stylesheet" type="text/css" href="./style.css">
	<style>

		body{
			background-color: #0f0f0f;
		}
        h2{
            color: white;
        }
        a{
            text-decoration: none;
            color: #FCFC01;
            font-size: 20px;
            padding-right: 10px;
        }
		tr{
			border: solid 5px #BA00F8;
			border-radius: 8px;
		}
        .div-friendlist{
            padding-left: 60px;
            overflow-y: scroll;
        }
		.message_outer-box{
			background-color: #323338; 
			padding-left: 20px; 
			color: white;

			border: solid 5px #BA00F8;
			border-radius: 8px;
		}
		.message_inbox_class{
            width: 100%;
            height: 400px;
            /* background-color: red; */
            overflow-y: scroll;
			border: none;
        }

        input[type=file]::file-selector-button {
            margin-right: 20px;
            border: none;
            background: #F23A0C;
            padding: 10px 20px;
            border-radius: 10px;
            color: #fff;
            cursor: pointer;
            transition: background .2s ease-in-out;
        }

        input[type=file]::file-selector-button:hover {
            background: #0d45a5;
        }
		#txt_message{
			height: 35px;
			width: 600px;
			margin-right: 30px;
		}
		#btn_send_message{
            padding: 10px 40px 10px 40px;
            /* background-color: #2B3B61; */
            background-color: #EC0000;
            color: white;
            border: none;
            border-radius: 4px;
        }
		.div__online{
			border: solid 5px #BA00F8;
			border-radius: 8px;
		}
	</style>
	<script>

	var objDiv = document.getElementById("message_inbox_id");
	objDiv.scrollTop = objDiv.scrollHeight;
	</script>
</head>
<body  onload="changeContent()">
	
	<?php require "./include/header.php"; ?>


				
        <!-- message with -->
        <?php 
        if($receiver_id != ""){
            ?>

                    <table width="100%" border="1">


                <!-- message -->
                <tr>
                    <td width="80%" class="message_outer-box">

						<a href="./profile.php?friend_id=<?php echo $receiver_id; ?>">
							<img src="./profile/<?php echo $receiverProfile.'"'; echo $receiver_style_online;?>width="50em">
						</a>
				
						<span>Message with <?php echo $receiver_username; ?></span>

						<!-- Iframe -->
						<!-- <iframe src="./reloadMessage123.php?chat=<?php echo $receiver_id; ?>" width="100%" height="500px" style="border:none;" title="description" id="displayMessage"></iframe> -->

						<!-- Ajax -->
						<div id="message_inbox_id" class="message_inbox_class"></div>
						
						<br><br>

						<form method="POST"  enctype="multipart/form-data" >
							<input type="file" name="image">
							<!-- <?php echo $err['image']; ?> -->
							<input type="text" name="text" id="txt_message">
							<input type="submit" name="send" value="send" id="btn_send_message" onclick="reloadIFrame()">
						</form>
						<br><br>
                        </td>

                        <!-- Chat With -->
                        <td style="background-color: #323338;" class="div__online">
                        <center>
                            <h2>Chat with </h2><br>
                        </center>

                        <div style="padding: 20px;">
                        <?php 
                            $query_friend_list = $mysql->query("select * from friend_lists where (friend_id_1 = $sess_uid or friend_id_2 = $sess_uid) and (friend_approve_1 = 1 and friend_approve_2 = 1);");
                            while($row = $query_friend_list->fetch_assoc()){
                                $friend_id_1 = $row["friend_id_1"];
                                $friend_id_2 = $row["friend_id_2"];
                                // $approve_friend_1 = $row["approve_friend_1"];
                                // $approve_friend_2 = $row["approve_friend_2"];

                                
                                
                                if($sess_uid == $friend_id_1){
                                    // echo $friend_id_2;

                                    $query_query_friend_list = $mysql->query("select * from users where approved_status = 1 and id = $friend_id_2;");
                                    while($row = $query_query_friend_list->fetch_assoc()){
                                        $friendchat_uid = $row["id"];
                                        $friendchat_uname = $row["username"];
                                        $friendchat_profile = $row["profile"];
                                        $friendchat_online_status = $row["online_status"];

                                        if($friendchat_online_status == "1"){
                                            $friend_style_online = "style='border-radius: 50%; border: green 4px solid;'";
                                        }
                                        else{
                                            $friend_style_online = "style='border-radius: 50%; border: red 4px solid;'";
                                        }
                                        echo "<a href='message.php?chat=".$friendchat_uid."'><img src='./profile/".$friendchat_profile."' width='40px' height='40px' ". $friend_style_online."></a>";
                                        echo "<a href='message.php?chat=".$friendchat_uid."'>".$friendchat_uname. "</a><br><br>";
                                    }
                                }

                                if($sess_uid == $friend_id_2){
                                    // echo $friend_id_1;

                                    $query_query_friend_list = $mysql->query("select * from users where approved_status = 1 and id = $friend_id_1;");
                                    while($row = $query_query_friend_list->fetch_assoc()){
                                        $friendchat_uid = $row["id"];
                                        $friendchat_uname = $row["username"];
                                        $friendchat_profile = $row["profile"];
                                        $friendchat_online_status = $row["online_status"];

                                        if($friendchat_online_status == "1"){
                                            $friend_style_online = "style='border-radius: 50%; border: green 4px solid;'";
                                        }
                                        else{
                                            $friend_style_online = "style='border-radius: 50%; border: red 4px solid;'";
                                        }

                                        echo "<a href='message.php?chat=".$friendchat_uid."'><img src='./profile/".$friendchat_profile."' width='40px' height='40px' ". $friend_style_online."></a>";
                                        echo "<a href='message.php?chat=".$friendchat_uid."'>".$friendchat_uname. "</a><br><br>";
                                    }
                                }
                            }
                        ?>

                        </div>




                        </td>
                    </tr>
                </table>
            <?php
        }

        // No message id(Default message)
        else{
            
        ?>
        <br><br><br>
        <div class="div-friendlist">
        <h2>Message With</h2>
            
        <?php 
            $query_friend_list = $mysql->query("select * from friend_lists where (friend_id_1 = $sess_uid or friend_id_2 = $sess_uid) and (friend_approve_1 = 1 and friend_approve_2 = 1);");
            while($row = $query_friend_list->fetch_assoc()){
                $friend_id_1 = $row["friend_id_1"];
                $friend_id_2 = $row["friend_id_2"];
                $approve_friend_1 = $row["approve_friend_1"];
                $approve_friend_2 = $row["approve_friend_2"];

                
                
                if($sess_uid == $friend_id_1){
                    // echo $friend_id_2;

                    $query_query_friend_list = $mysql->query("select * from users where (approved_status = 1 and id = $friend_id_2) $search_option_query;");
                    while($row = $query_query_friend_list->fetch_assoc()){
                        $friendchat_uid = $row["id"];
                        $friendchat_uname = $row["username"];
                        $friendchat_profile = $row["profile"];
                        $friendchat_online_status = $row["online_status"];

                        if($friendchat_online_status == "1"){
                            $friend_style_online = "style='border-radius: 50%; border: green 4px solid;'";
                        }
                        else{
                            $friend_style_online = "style='border-radius: 50%; border: red 4px solid;'";
                        }
                        echo "<a href='message.php?chat=".$friendchat_uid."'><img src='./profile/".$friendchat_profile."' width='40px' height='40px' ". $friend_style_online."></a>";
                        echo "<a href='message.php?chat=".$friendchat_uid."'>".$friendchat_uname. "</a><br><br>";
                        array_push($array_push_id, $friendchat_uid);
                    }
                }

                if($sess_uid == $friend_id_2){
                    // echo $friend_id_1;

                    $query_query_friend_list = $mysql->query("select * from users where (approved_status = 1 and id = $friend_id_1) $search_option_query;");
                    while($row = $query_query_friend_list->fetch_assoc()){
                        $friendchat_uid = $row["id"];
                        $friendchat_uname = $row["username"];
                        $friendchat_profile = $row["profile"];
                        $friendchat_online_status = $row["online_status"];

                        if($friendchat_online_status == "1"){
                            $friend_style_online = "style='border-radius: 50%; border: green 4px solid;'";
                        }
                        else{
                            $friend_style_online = "style='border-radius: 50%; border: red 4px solid;'";
                        }

                        echo "<a href='message.php?chat=".$friendchat_uid."'><img src='./profile/".$friendchat_profile."' width='40px' height='40px' ". $friend_style_online."></a>";
                        echo "<a href='message.php?chat=".$friendchat_uid."'>".$friendchat_uname. "</a><br><br>";
                        array_push($array_push_id, $friendchat_uid);
                    }
                }
            }
        ?>
        
        </div>
            
        <?php

        }

        ?>
		
			
<!-- 
        <script>
            function retriveResult(){
                var xmlReq = new XMLHttpRequest();
                var url = "./reloadMessage.php?chat=" + "<?php //echo $receiver; ?>";
                xmlReq.open("GET", url, false);
                xmlReq.send(null);

                if(xmlReq.responseText.length > 2){
                    document.getElementById("displayMessage").innerHTML = xmlReq.responseText;
                    return;
                }
                setTimeout(retriveResult, 2000);
            }
            retriveResult();
        </script>
 -->

 <script>
	// Iframe
	// setInterval(reloadIFrame,5000);
	// let i = document.getElementById('displayMessage');

	// function reloadIFrame() {
	// 	// document.getElementById("displayMessage").src="./ajaxmessage.php?chat=<?php echo $receiver_id; ?>";
	// 	// let i = document.getElementById('displayMessage');
	// 	// i.scrollBy( 0, 999999 );

	// 	// setInterval(reloadIFrame,5000);

	// }

	// var myIframe = document.getElementById('displayMessage');
    //     myIframe.onload = function () {
    //         myIframe.contentWindow.scrollTo(0,999999);
    //     }

	// Ajax
	
    function changeContent(){
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
            // Typical action to be performed when the document is ready:
                document.getElementById("message_inbox_id").innerHTML = xhttp.responseText;

				var objDiv = document.getElementById("message_inbox_id");
				objDiv.scrollTop = objDiv.scrollHeight;
            }
        };
        // xhttp.open("GET", "ajax/note.txt", true);
        xhttp.open("GET", "reloadMessage123.php?chat=<?php echo $receiver_id; ?>", true);
        xhttp.send();
    }

    function RefreshCounter() {
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                // Typical action to be performed when the document is ready:

                if (xhttp.responseText > 0) {
                    changeContent();
                    // document.getElementById("message_").innerHTML = "lol";
                }

                // var objDiv = document.getElementById("message_inbox_id");
                // objDiv.scrollTop = objDiv.scrollHeight;
            }
        };
        // xhttp.open("GET", "ajax/note.txt", true);
        xhttp.open("GET", "refresh.php?chat=32", true);
        xhttp.send();
    }
    setInterval(RefreshCounter, 1000);
    // <?php 
    //     // Refresh
    //     $refresh = "select * from messages where (sender_id = $sess_uid and sender_refresh = 1) or (receiver_id = $sess_uid and receiver_refresh = 1);";

    //     $selectQuery = $mysql->query($refresh);
    //     while($row = $selectQuery->fetch_assoc()){
    //         $refresh_counter += $row["sender_refresh"] + $row["receiver_refresh"];

    //         // echo $us;
    //     }
    //     if($refresh_counter > 0){
    //         echo "changeContent();";
    //         // echo "setInterval(changeContent,1000);";
    //     }
    // ?>
    // setInterval(changeContent,2000);

	
	// var myIframe = document.getElementById('message_inbox_id');
    //     myIframe.onload = function () {
    //         myIframe.contentWindow.scrollTo(0,999999);
    //     }
</script>
</body>
</html>