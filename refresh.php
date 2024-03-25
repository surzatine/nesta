<?php 
    include "./include/conn.php";
    include "./include/session.php";

    // receiver
    $receiver_id = $_GET["chat"];

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

    // Refresh
    $refresh = "select * from messages where (sender_id = $sess_uid and sender_refresh = 1) or (receiver_id = $sess_uid and receiver_refresh = 1);";

    $refresh_counter = 0;
    $selectQuery = $mysql->query($refresh);
    while($row = $selectQuery->fetch_assoc()){
        $refresh_counter += $row["sender_refresh"] + $row["receiver_refresh"];

        // echo $us;
    }
    if($refresh_counter > 0){
        echo $refresh_counter;
        // echo "changeContent();";
        // echo "setInterval(changeContent,1000);";
    }
?>