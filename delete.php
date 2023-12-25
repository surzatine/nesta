<?php


include "./include/conn.php";
include "./include/session.php";

echo "<script>alert(test);</script>";

$sess_Username = $_SESSION["username"];

if ($sess_Username != "") {

    echo "<script>alert(lol);</script>";

    $senderProfileQuery = $mysql->query("select * from users where username='" . $sess_Username . "';");
    while ($row = $senderProfileQuery->fetch_assoc()) {
        $sess_uid = $row["id"];
    }

    $array_push_id = [$sess_uid];

    echo $sess_uid;
    echo $sess_Username;

    // echo "<script>alert(0);</script>";

    $delete_comment = $mysql->prepare("delete from comment where user_id=?");
    $delete_comment->bind_param("i", $sess_uid);
    $delete_comment->execute();

    // echo "<script>alert(1);</script>";

    $delete_like = $mysql->prepare("delete from likes where user_id=?");
    $delete_like->bind_param("i", $sess_uid);
    $delete_like->execute();

    // echo "<script>alert(2);</script>";

    $delete_dislike = $mysql->prepare("delete from dislikes where user_id=?");
    $delete_dislike->bind_param("i", $sess_uid);
    $delete_dislike->execute();

    // echo "<script>alert(3);</script>";

    $query_newsfeed = "select * from newsfeed where user_id = '" . $sess_uid . "'";

    $select_newsfeed = $mysql->query($query_newsfeed);
    while($row = $select_newsfeed->fetch_assoc()){
        $newsfeed_id = $row["nid"];

        echo $newsfeed_id . "<br>";

        $delete_comment = $mysql->prepare("delete from comment where newsfeed_id=?");
        $delete_comment->bind_param("i", $newsfeed_id);
        $delete_comment->execute();

        $delete_like = $mysql->prepare("delete from likes where newsfeed_id=?");
        $delete_like->bind_param("i", $newsfeed_id);
        $delete_like->execute();

        $delete_dislike = $mysql->prepare("delete from dislikes where newsfeed_id=?");
        $delete_dislike->bind_param("i", $newsfeed_id);
        $delete_dislike->execute();

        
    }

    $delete_newsfeed = $mysql->prepare("delete from newsfeed where user_id=?");
    $delete_newsfeed->bind_param("i", $sess_uid);
    $delete_newsfeed->execute();
    

    // echo "<script>alert(4);</script>";

    $delete_story = $mysql->prepare("delete from story where user_id=?");
    $delete_story->bind_param("i", $sess_uid);
    $delete_story->execute();

    // echo "<script>alert(5);</script>";

    $delete_message = $mysql->prepare("delete from messages where sender_id=? or receiver_id=?");
    $delete_message->bind_param("ii", $sess_uid, $sess_uid);
    $delete_message->execute();

    // echo "<script>alert(6);</script>";

    $delete_friend = $mysql->prepare("delete from friend_lists where friend_id_1=? or friend_id_2 =?");
    $delete_friend->bind_param("ii", $sess_uid, $sess_uid);
    $delete_friend->execute();

    // echo "<script>alert(7);</script>";

    $delete_story = $mysql->prepare("delete from more_details where user_id=?");
    $delete_story->bind_param("i", $sess_uid);
    $delete_story->execute();

    // echo "<script>alert(8);</script>";

    $delete_user = $mysql->prepare("delete from users where id=?");
    $delete_user->bind_param("i", $sess_uid);
    $delete_user->execute();

    // echo "<script>alert(9);</script>";

    header("location: logout.php");

    // header("location: login.php");
} 
else {
    echo "<script> alert('user cannot be deleted');</script>";
}