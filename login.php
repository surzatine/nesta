<?php
    include './include/conn.php';

    if($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["username"]) && isset($_POST["password"])){
        $username = $_POST["username"];
        // $password = MD5($_POST["password"]);
        $password = $_POST["password"];
        $md5password = md5($password);

        echo $username . "<br>";
        echo $password . "<br>";
        echo $md5password . "<br>";

        if($username == "admin" && $password == "password"){
            session_start();
            $_SESSION["username"] = $_POST["username"];
            header("Location: ./approveuser.php");
        }

        $loginQuery = $mysql->prepare("select * from users where username=? and password=? and approved_status='1'");
        $loginQuery->bind_param("ss", $username, $md5password);
        $loginQuery->execute();
        $loginQuery->store_result();

        if($loginQuery->num_rows > 0){
            session_start();
            $_SESSION["username"] = $_POST["username"];

            $updateOnline = $mysql->prepare("update users set online_status = '1' where username = ?");
            $updateOnline->bind_param("s", $username);
            $updateOnline->execute();

            
            header("Location: ./index.php");
        }

        //null 
        // if($_POST["username"] == "admin" && MD5($_POST["password"] == "5f4dcc3b5aa765d61d8327deb882cf99")){
        //     session_start();
        //     $_SESSION["username"] = $_POST["username"];
        //     header("Location: ./index.php");
        // }
        
        else{
            echo "<script>alert('wrong username and/or password');</script>";
            echo "wrong username and/or password";
        }
    }

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login</title>
    <link rel="shortcut icon" type="image/png" href="./icon/favicon.png"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Archivo:wght@500&display=swap" rel="stylesheet">

    <style>
        body{
            background-color: #0F0F0F;
        }
        div{
            /* background-color: #97A6C2; */
            background-color: #383838;
            width: 60%;
            border-radius: 10px;
            display: flex;
            justify-content: center;
            text-align: center;
            margin: 0 auto; 
            border: 2px #BA00F8 solid;
        }
        p.nesta{
            /* background-color: #40f96f;
            border-radius: 10px;
            width: 100%;
            padding: 10px; */
            color: white;
            font-size: 70px;
        }
        img{
            width: 20px;
            padding: 10px;
        }
        img#idImgNesta{
            width:400px;
        }
        #idUsername,#idPassword{
            padding: 5px 0px 5px 10px;
            width: 200px;
            height: 30px;
            border: none;
        }
        .class_input{
            background-color: grey;
            padding: 0px 0px 0px 20px;
            border-radius: 4px;
            border: 2px solid black;
        }
        #idLogin{
            padding: 10px 40px 10px 40px;
            /* background-color: #2B3B61; */
            background-color: #EC0000; 
            color: #FFFFFF;
            border: none;
            border-radius: 4px;
            font-size: 15px;
            width: 200px;
            height: 40px;
            font-family: 'Archivo', sans-serif;
        }
        #btnRegister{
            text-decoration: none;
            font-size: 15px;
            color: white;
            padding: 10px 60px 10px 60px;
            /* background-color: #305B8F; */
            background-color: #BA00F8; 
            color: white;
            border-radius: 4px;
            width: 200px;
            height: 40px;
            font-family: 'Archivo', sans-serif;
        }
    </style>
</head>
<body>
    <br><br><br><br>
    <!-- <br><br> -->
    <!-- <center><img src="./icon/nesta.png" id="idImgNesta"></center> -->
    <br><br><br><br><br><br>

    <div >
        
        
        <form action="" method="post">
            <!-- <center><img src="./icon/nesta.png" id="idImgNesta"></center> -->
            <p class="nesta">NESTA</p>
            <!-- <br><br> -->

            <div class="class_input">
                <img src="./icon/username.png" alt="">
                <!-- <span>👤 </span> -->
                <input type="text" name="username" id="idUsername" placeholder="   Username">
            </div>

            <br><br>
            
            <div class="class_input">
                <img src="./icon/padlock.png" alt="">
                <!-- <span>🔓</span> -->
                <input type="password" name="password" id="idPassword" placeholder="   Password">
            </div>

            <br><br>
            
            <input type="submit" value="LOGIN" id="idLogin">
            <br><br>
            
            <!-- Forgot Password? <a href="#">Click Here</a> -->
            <br>

            <!-- ________________ -->
            <br><br><br>

            <a href="./register.php" id="btnRegister">Register</a>
            <br><br><br>

        </form>
    </div>
</body>
</html>