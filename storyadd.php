<?php
include './include/session.php';
include './include/conn.php';
session_start();


// receiver
$receiver_id = $_GET["chat"];
// echo $receiver;

// username
$sess_Username = $_SESSION["username"];
$sess_uid = $_SESSION["user_id"];

	$me_query = "select * from users where username = '" . $sess_Username . "'";
	$selectQuery = $mysql->query($me_query);
    while($row = $selectQuery->fetch_assoc()){
        $me_uid = $row["id"];
        $me_username = $row["username"];
        $me_profile = $row["profile"];
        // echo $us;
    }

	// online
	$receiver_query = "select * from users where id = '" . $receiver_id . "'";

	$selectQuery = $mysql->query($receiver_query);
    while($row = $selectQuery->fetch_assoc()){
        $receiverProfile = $row["profile"];
		$receiver_username = $row["username"];
		$receiver_online_status = $row["online_status"];

		if($receiver_online_status == "1"){
			$receiver_style_online = "style='border-radius: 50%; border: green 4px solid;'";
		}
		else{
			$receiver_style_online = "style='border-radius: 50%; border: red 4px solid;'";
		}
        // echo $us;
    }


    // print_r($_FILES);
    $flag = 0;
    if(isset($_POST['post_story'])){
        if (isset($_FILES['img_story']['error']) && $_FILES['img_story']['error']== 0 ) {
            if (isset($_FILES['img_story']['size']) && $_FILES['img_story']['size'] < 4000000) {
                $file_types = ['image/jpeg','image/png','image/jpg'];
                if (in_array($_FILES['img_story']['type'], $file_types)) {
                    //chmod('images', 0777);
                    echo  $pname = uniqid() . '_' . $_FILES['img_story']['name'];
                    if (move_uploaded_file($_FILES['img_story']['tmp_name'], 'story/' .$pname )) {
                        // echo 'Success';
                        $flag = 1;
                    } 
                    else {
                        echo 'Image upload failed';
                    }
                } 
                else {
                    $err['img_story'] = 'Image type mismatch';
                }
            } 
            else {
                $err['img_story'] = 'Image size exceed';
            }
        } 
        else {
            $err['img_story'] = 'Please upload image';
        }

        if($flag == 1){
            date_default_timezone_set("Asia/Kathmandu");
            $date = date("Y-m-d");
            $time = date("H:i:s");
            $query_story = $mysql->prepare("insert into story(user_id, username, user_profile, story_img, date, time)values (?,?,?,?,?,?);");
            
            $query_story->bind_param("ssssss",$me_uid, $me_username, $me_profile, $pname,$date,$time);
            
            $query_story->execute();
            echo "<script>alert('story');</script>";
            header("location: index.php");

        }
    }
    
    
?>
<!DOCTYPE html>
<html>
<head>
	<title>Add Story</title>
    <link rel="shortcut icon" type="image/png" href="./icon/favicon.png"/>
    <link rel="stylesheet" type="text/css" href="./style.css">
	<style>

		body{
			background-color: #0f0f0f;
		}
        body{
            background-color: #0F0F0F;
        }
        
        h2{
            color: white;
            text-align: center;
        }
        a{
            text-decoration: none;
            color: #FCFC01;
            font-size: 20px;
            padding-right: 10px;
        }

        
       
        form{

            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }




        .container {
            position: relative;
            width: 600px;
            border: 2px solid #BA00F8;
            height: 200px;
        }

        .center {
            position: absolute;
            top: 50%;
            width: 100%;
            text-align: center;
            font-size: 18px;
            color: green;
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

        #btn_post{
            padding: 10px 40px 10px 40px;
            /* background-color: #2B3B61; */
            background-color: #EC0000;
            color: white;
            border: none;
            border-radius: 4px;
        }
	</style>
</head>
<body>
	
	<?php require "./include/header.php"; ?>

    <br><br><br>
    <h2>
        If you have any problem, Post it in Story.
        
        <br>
        It will disappear in 24 Hours.
    </h2>
    <br>
    <center>
        <div class="container">
  <div class="center">
  <form method="post" enctype="multipart/form-data">
            <input type="file" name="img_story" id="img_story">
            <br><br>
            <input type="submit" name="post_story" value="post" id="btn_post">
        </form>
  </div>
    </center>



</div>
</body>
</html>
