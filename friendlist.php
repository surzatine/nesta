<?php 
include "./include/conn.php";
include "./include/session.php";


$sess_Username = $_SESSION["username"];

$senderProfileQuery = $mysql->query("select * from users where username='".$sess_Username."';");
while($row = $senderProfileQuery->fetch_assoc()){
	$sess_uid = $row["id"];
}

$array_push_id = [$sess_uid];

echo $sess_uid;
echo $sess_Username;

$flag_value_1 = 1;
$flag_value_0 = 0;

if(isset($_POST["btn-unfriend1"]) == "Unfriend"){
    $query_unfriend_friend_list = $mysql->prepare("delete from friend_lists where (friend_id_1 = ? and friend_id_2 = ?);");
			
    $query_unfriend_friend_list->bind_param("ii", $sess_uid, $_POST["friend_list_value"]);
    
    $query_unfriend_friend_list->execute();
}

if(isset($_POST["btn-unfriend2"]) == "Unfriend"){
    $query_unfriend_friend_list = $mysql->prepare("delete from friend_lists where (friend_id_1 = ? and friend_id_2 = ?);");
			
    $query_unfriend_friend_list->bind_param("ii", $_POST["friend_list_value"], $sess_uid);
    
    $query_unfriend_friend_list->execute();
}

if(isset($_POST["btn-accept"]) == "Accept"){
    $query_accept_friend_request = $mysql->prepare("update friend_lists set friend_approve_2 = ? where friend_id_1 = ? and friend_id_2 = ?;");
			
    $query_accept_friend_request->bind_param("iii", $flag_value_1, $_POST["friend_request_value"], $sess_uid);
    
    $query_accept_friend_request->execute();
}

if(isset($_POST["btn-delete"]) == "Delete"){
    $query_delete_friend_request = $mysql->prepare("delete from friend_lists where (friend_id_1 = ? and friend_id_2 = ?);");
			
    $query_delete_friend_request->bind_param("ii", $_POST["friend_request_value"], $sess_uid);
    
    $query_delete_friend_request->execute();
}

if(isset($_POST["btn-add"]) == "Add Friend"){
    // echo "<script> alert('lol'); </script>";
    $query_add_friend_request = $mysql->prepare("insert into friend_lists (friend_id_1 , friend_id_2, friend_approve_1, friend_approve_2) values (?,?,?,?);");
			
    $query_add_friend_request->bind_param("iiii", $sess_uid, $_POST["add_friend_value"], $flag_value_1, $flag_value_0);
    
    $query_add_friend_request->execute();
}

// search
if(isset($_GET["search_button"]) && $_GET["search_button"] = "search"){
    $search_friend_option = $_GET["search_option"];
    $search_friend = $_GET["search_friend"];

    if($search_friend == NULL || $search_friend_option == NULL){
        $search_option_query = "";
    }
    else{
        $search_option_query = "and ($search_friend_option like '%$search_friend%');"; 
        echo "<script>alert $search_friend;</script>";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Friend List</title>
    <!-- <link rel="shortcut icon" type="image/png" href="./icon/favicon.png"/> -->
    <link rel = "icon" type="image/x-icon" href = "./icon/favicon.png">
    <style>
        body{
            background-color: #0F0F0F;
        }
        .div-friendlist, .div-friend_request, .div-sent, .div-add_friend{
            padding-left: 60px;
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
        input{
            margin-right: 20px;
        }
    </style>
</head>
<body>
<?php require "./include/header.php"; ?>
    <!-- Friend List -->
    <br>
    <center>
        <form method="get">
            <select name="search_option" id="">
                <option value="username">Username</option>
                <option value="firstname">First Name</option>
                <option value="lastname">Last Name</option>
                <option value="phone">Phone</option>
                <option value="email">Email</option>
                <!-- <option value="registration">Registration</option> -->
            </select>
            <input type="text" name="search_friend">
            <input type="submit" name="search_button" value="search">
        </form>
    </center>
    
    <br>
    <div class="div-friendlist">
        <h2>Friend List</h2>
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
                    echo "<form method='post'>";
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
                    echo "<a href='profile.php?friend_id=".$friendchat_uid."'><img src='./profile/".$friendchat_profile."' width='40px' height='40px' ". $friend_style_online."></a>";
                    echo "<a href='profile.php?friend_id=".$friendchat_uid."'>".$friendchat_uname. "</a>";
                    echo '<input type="hidden" name="friend_list_value" value="'.$friendchat_uid.'" >';
                    echo "<input type='submit' name='btn-unfriend1' value='Unfriend' ><br><br>";
                    array_push($array_push_id, $friendchat_uid);
                    echo "</form>";
                }
                
            }

            if($sess_uid == $friend_id_2){
                // echo $friend_id_1;
               
                $query_query_friend_list = $mysql->query("select * from users where (approved_status = 1 and id = $friend_id_1) $search_option_query;");
                while($row = $query_query_friend_list->fetch_assoc()){
                    echo "<form method='post'>";

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

                    echo "<a href='profile.php?friend_id=".$friendchat_uid."'><img src='./profile/".$friendchat_profile."' width='40px' height='40px' ". $friend_style_online."></a>";
                    echo "<a href='profile.php?friend_id=".$friendchat_uid."'>".$friendchat_uname. "</a>";
                    echo '<input type="hidden" name="friend_list_value" value="'.$friendchat_uid.'" >';
                    echo "<input type='submit' name='btn-unfriend2' value='Unfriend' ><br><br>";
                    array_push($array_push_id, $friendchat_uid);

                    echo "</form>";
                }
                
            }
        }
?>
    </div>

    <!-- Friend Request -->
    <div class="div-friend_request">
        <h2>Friend Request</h2>
        
<?php
            $query_friend_request = $mysql->query("select * from friend_lists where (friend_id_2 = $sess_uid ) and (friend_approve_1 = 1 and friend_approve_2 = 0);");
            while($row = $query_friend_request->fetch_assoc()){
                echo "<form method='post'>";
                $friend_id_1 = $row["friend_id_1"];
                $friend_id_2 = $row["friend_id_2"];

                $query_query_friend_request = $mysql->query("select * from users where (approved_status = 1 and id = $friend_id_1) $search_option_query;");
                while($row = $query_query_friend_request->fetch_assoc()){
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
                    echo "<a href='profile.php?friend_id=".$friendchat_uid."'><img src='./profile/".$friendchat_profile."' width='40px' height='40px' ". $friend_style_online."></a>";
                    echo "<a href='profile.php?friend_id=".$friendchat_uid."'>".$friendchat_uname. "</a>  ";
                    echo '<input type="hidden" name="friend_request_value" value="'.$friendchat_uid.'" >';
                    echo "<input type='submit' name='btn-accept' value='Accept' >";
                    echo "<input type='submit' name='btn-delete' value='Delete' ><br><br>";
                    array_push($array_push_id, $friendchat_uid);
                }
                echo "</form>";

            }
?>

        
    </div>

    <!-- You Send Request -->
    <div class="div-sent">
        <h2>Sent Request</h2>
<?php
            $query_sent_request = $mysql->query("select * from friend_lists where (friend_id_1 = $sess_uid ) and (friend_approve_1 = 1 and friend_approve_2 = 0);");
            while($row = $query_sent_request->fetch_assoc()){
                $friend_id_1 = $row["friend_id_1"];
                $friend_id_2 = $row["friend_id_2"];

                $query_query_sent_request = $mysql->query("select * from users where (approved_status = 1 and id = $friend_id_2) $search_option_query;");
                while($row = $query_query_sent_request->fetch_assoc()){
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
                    echo "<a href='profile.php?friend_id=".$friendchat_uid."'><img src='./profile/".$friendchat_profile."' width='40px' height='40px' ". $friend_style_online."></a>";
                    echo "<a href='profile.php?friend_id=".$friendchat_uid."'>".$friendchat_uname. "</a>  <br><br>";
                    array_push($array_push_id, $friendchat_uid);
                    // echo '<input type="hidden" name="friend_request_value" value="'.$friendchat_uid.'" >';
                    // echo "<input type='submit' name='btn-accept' value='Accept' ><br><br>";
                }

            }
?>

        </form>
    </div>

    <!-- Add Friend -->
    <div class="div-add_friend">
        <h2>Add Friend</h2>
        
<?php 
        $strMissing = implode(',', $array_push_id);
        // print_r($array_push_id);

        $query_friend_list = $mysql->query("select * from users where ((id not in (" . $strMissing . ")) and approved_status = 1 ) $search_option_query;");
        while($row = $query_friend_list->fetch_assoc()){
            echo "<form method='post'>";
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


            echo "<a href='profile.php?friend_id=".$friendchat_uid."'><img src='./profile/".$friendchat_profile."' width='40px' height='40px' ". $friend_style_online."></a>";
            echo "<a href='profile.php?friend_id=".$friendchat_uid."'>".$friendchat_uname. "</a> ";
            echo '<input type="hidden" name="add_friend_value" value="'.$friendchat_uid.'" >';
            echo '<input type="submit" name="btn-add" value="Add Friend" ><br><br>';

            echo "</form>";
        }
            

        /*
        $query_friend_list = $mysql->query("select * from users where approved_status = 1 and id != $sess_uid;");
        while($row = $query_friend_list->fetch_assoc()){
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


            $flag_add_friend = 0;
            $query_add_friend = $mysql->query("select * from friend_lists where (friend_id_1 = $friendchat_uid or friend_id_2 = $friendchat_uid)  ;");
            while($row = $query_add_friend->fetch_assoc()){
                $fid = $row["fid"];
                $friend_id_1 = $row["friend_id_1"];
                $friend_id_2 = $row["friend_id_2"];
                $approve_friend_1 = $row["approve_friend_1"];
                $approve_friend_2 = $row["approve_friend_2"];

                // echo $fid;
                if($friend_id_1 == $friendchat_uid || $friend_id_2 == $friendchat_uid){
                    $flag_add_friend += 1;
                }
            }

            if($flag_add_friend == 0){
                echo "<a href='profile.php?friend_id=".$friendchat_uid."'><img src='./profile/".$friendchat_profile."' width='40px' height='40px' ". $friend_style_online."></a>";
                echo "<a href='profile.php?friend_id=".$friendchat_uid."'>".$friendchat_uname. "</a> ";
                echo '<input type="hidden" name="add_friend_value" value="'.$friendchat_uid.'" >';
                echo '<input type="submit" name="btn-add" value="Add Friend" ><br><br>';
            }

        }*/
   
?>
        
    </div>
</body>
</html>