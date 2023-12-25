<?php 
    include("./include/conn.php");
    include("./include/session.php");
    session_start();

    $sess_Username = $_SESSION["username"];

    $updateOnline = $mysql->prepare("update users set online_status = '0' where username = ?");
    $updateOnline->bind_param("s", $sess_Username);
    $updateOnline->execute();

    session_destroy();
    
    setcookie('username',null,time()-1);
    header('location: login.php');
 ?>