<?php 
include "./include/conn.php";
include "./include/session.php";

$nid = $_GET["nid"];
// echo "<script> alert ($nid); </script>";

$sess_Username = $_SESSION["username"];

$ProfileQuery = $mysql->query("select * from users where username='".$sess_Username."';");
while($row = $ProfileQuery->fetch_assoc()){
	$sess_uid = $row["id"];
    $sess_username = $row["username"];
    $sess_profile = $row["profile"];
    $online_status = $row["online_status"];
}



$image_newsfeed = $mysql->query("select * from newsfeed where nid='".$nid."';");
while($row = $image_newsfeed->fetch_assoc()){
	$newsfeed_user_id = $row["user_id"];
    $newsfeed_username = $row["username"];
    $newsfeed1 = $row["newsfeed"];
    $newsfeed_image = $row["image"];

    // toxic
    $myfile = fopen("toxic.txt", "r");
    $toxics = explode("\n",fread($myfile,filesize("toxic.txt")));
    // print_r($toxic);
    fclose($myfile);
    // newsfeed
    $get_nfd_txts = explode(" ",$newsfeed1);
    // print_r($get_msg_txts);
    $newsfeed = "";
    foreach($get_nfd_txts as $get_nfd_txt){
        foreach($toxics as $toxic){

            if($toxic == ""){
                continue;
            }
        
            if(preg_match_all("/".$toxic."/i", $get_nfd_txt)){
                $count = strlen($get_nfd_txt);
                $a = "";
                for($i=1;$i<$count;$i++){
                    $a = $a . "*";
                }
                $get_nfd_txt = substr($get_nfd_txt, 0, 1) . $a;
            }						
        }
        $newsfeed = $newsfeed. " " . $get_nfd_txt ;
    }

}

$ProfileQuery = $mysql->query("select * from users where username='".$newsfeed_username."';");
while($row = $ProfileQuery->fetch_assoc()){
    $newsfeed_profile = $row["profile"];
    $newsfeed_user_online_status = $row["online_status"];
}

if($newsfeed_user_online_status == "1"){
    $newsfeed_style_online = "style='border-radius: 50%; border: green 4px solid;'";
}
else{
    $newsfeed_style_online = "style='border-radius: 50%; border: red 4px solid;'";
}

// $array_push_id = [$sess_uid];

// echo $sess_uid;
// echo $sess_Username;

// $flag_value_1 = 1;
// $flag_value_0 = 0;

if(isset($_POST["btn-comment"]) == "post"){
    $query_unfriend_friend_list = $mysql->prepare("insert into comment (newsfeed_id, user_id, username, user_profile, comment_text) values (?,?,?,?,?);");
			
    $query_unfriend_friend_list->bind_param("sssss", $nid, $sess_uid, $sess_Username, $sess_profile, $_POST["comment"]);
    
    $query_unfriend_friend_list->execute();
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Photo</title>
    <!-- <link rel="shortcut icon" type="image/png" href="./icon/favicon.png"/> -->
    <link rel = "icon" type="image/x-icon" href = "./icon/favicon.png">
    <style>
        body{
            background-color: #0F0F0F;
        }
        .container{
            display: flex;
        }
        .container_wrapper{
            padding: 40px;
            border-radius: 8px;
            color: white;
            font-size: 40px;
            background-color: #383838;
            margin-right: 20px;
        }
        img.newsfeed_main_img{
            width: 1000px;
            border-radius: 8px;
        }
        .container_comment{
            padding: 40px;
            border-radius: 8px;
            width: 100%;
            color: white;
            font-size: 20px;
            /* height: 100px; */
            background-color: #383838;
            margin-left: 20px;
        }
        .container_comment form input{
            width: 500px;
            height: 30px;
            padding: 10px;
            margin-right: 20px;
            border-radius: 4px;
            font-size: 15px;
        }
        .container_comment form input[type=submit]{
            width: 100px;
            height: 50px;
            padding: 10px;
            background-color: #3278C0;
            color: white;
            border: none;
            font-size: 20px;
        }
    </style>
</head>
<body>
<?php require "./include/header.php"; ?>
<br><br>
<div class="container">
    <div class="container_wrapper">
        <?php
            echo "<a href='profile.php?friend_id=".$newsfeed_user_id."'><img src='./profile/".$newsfeed_profile."' width='60px' height='60px' ". $newsfeed_style_online."></a>"; 
            echo "<span class='newsfeed_username'>$newsfeed_username</span>";
        ?>
        <br>
        <?php echo $newsfeed; ?>
        <br>
        <img src="./newsfeed/<?php echo $newsfeed_image; ?>" alt="" class="newsfeed_main_img">

    </div>

    <div class="container_comment">
        <form method="post">
            <input type="text" placeholder="Comment..." name="comment">
            <input type="submit" name="btn-comment" value="post">
        </form>
        <br><br>
        <?php
            $show_comment = $mysql->query("select * from comment where newsfeed_id='".$nid."' order by cid desc;");
            while($row = $show_comment->fetch_assoc()){
                $comment_user_id = $row["user_id"];
                $comment_username = $row["username"];                
                $comment_text1 = $row["comment_text"];

                // toxic
				$myfile = fopen("toxic.txt", "r");
				$toxics = explode("\n",fread($myfile,filesize("toxic.txt")));
				// print_r($toxic);
				fclose($myfile);
                // comment
				$get_cmt_txts = explode(" ",$comment_text1);
				// print_r($get_msg_txts);
				$comment_text = "";
				foreach($get_cmt_txts as $get_cmt_txt){
					foreach($toxics as $toxic){

						if($toxic == ""){
							continue;
						}
					
						if(preg_match_all("/".$toxic."/i", $get_cmt_txt)){
							$count = strlen($get_cmt_txt);
							$a = "";
							for($i=1;$i<$count;$i++){
								$a = $a . "*";
							}
							$get_cmt_txt = substr($get_cmt_txt, 0, 1) . $a;
						}						
					}
					$comment_text = $comment_text. " " . $get_cmt_txt ;
				}

                $ProfileQuery = $mysql->query("select * from users where username='".$comment_username."';");
                while($row = $ProfileQuery->fetch_assoc()){
                    $comment_profile = $row["profile"];
                    $comment_user_online_status = $row["online_status"];
                }

                if($comment_user_online_status == "1"){
                    $comment_style_online = "style='border-radius: 50%; border: green 4px solid;'";
                }
                else{
                    $comment_style_online = "style='border-radius: 50%; border: red 4px solid;'";
                }

                echo "<a href='profile.php?friend_id=".$comment_user_id."'><img src='./profile/".$comment_profile."' width='40px' height='40px' ". $comment_style_online."></a>"; 
                echo "<span class='newsfeed_username'>$comment_username</span>";

                echo "<br>";

                echo $comment_text;
                echo "<br>";
                echo "<br>";
            }
        ?>
    </div>
</div>

</body>
</html>