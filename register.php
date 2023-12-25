<?php
    include './include/conn.php';

// print_r($_FILES);
    if(isset($_POST['register'])){
        if (isset($_FILES['profile']['error']) && $_FILES['profile']['error']== 0 ) {
            if (isset($_FILES['profile']['size']) && $_FILES['profile']['size'] < 4000000) {
                $file_types = ['image/jpeg','image/png','image/jpg'];
                if (in_array($_FILES['profile']['type'], $file_types)) {
                    //chmod('images', 0777);
                    echo  $pname = uniqid() . '_' . $_FILES['profile']['name'];
                    if (move_uploaded_file($_FILES['profile']['tmp_name'], 'profile/' .$pname )) {
                        // echo 'Success';
                        $profile_upload_flag = 1;
                    } 
                    else {
                    echo 'Image upload failed';
                    }
                } 
                else {
                    $err['profile'] = 'Image type mismatch';
                }
            } 
            else {
                $err['profile'] = 'Image size exceed';
            }
        } 
        else {
            $err['profile'] = 'Please upload image';
        }

        if($profile_upload_flag != 1){
            echo "<script>alert('upload profile')</script>";
        }

        if($_SERVER["REQUEST_METHOD"]=="POST" && $profile_upload_flag == 1 && isset($_POST["username"]) && isset($_POST["password"]) && isset($_POST["name"]) && isset($_POST["dob"]) && isset($_POST["address"]) && isset($_POST["phone"]) && isset($_POST["email"])){
        
        // if($_SERVER["REQUEST_METHOD"]=="POST" && isset($_POST["username"]) && isset($_POST["password"]) && isset($_POST["firstname"]) && isset($_POST["middlename"]) && isset($_POST["lastname"]) && isset($_POST["dob"]) && isset($_POST["address"]) && isset($_POST["phone"]) && isset($_POST["email"]) && isset($_POST["registration"]) && isset($_POST["year"])){
            $middlename = "";
            $name = explode(" ",$_POST["name"]);
            for($i=1; $i<(count($name)-1);$i++){
                $middlename = $middlename . $name[$i] . " ";
            }

            $flag = 0;

            $password = $_POST["password"];
            $md5password = md5($password);
            $approved_status = 0;
            $admin_flag = 0;
            $online_status = 0;

            // Dublicate Data
            $dublicate_query = $mysql->query("select * from users;");
            while($row = $dublicate_query->fetch_assoc()){
                $username = $row["username"];
                $phone = $row["phone"];
                $email = $row["email"];
                // $registration = $row["registration"];

                if($_POST["username"] == $username || $_POST["email"] == $email || $_POST["phone"] == $phone ){
                    // echo "<script> alert 'duplicate error;' </script>";
                    $flag += 1;
                    // break;
                }
            }

            if(!preg_match("/(([A-Za-z0-9\_]+))/i", $_POST["username"]) ){
                echo "<script>alert('username is not validate')</script>";
                $regex_validate_error = 1;
            }

            if(!( strlen($_POST["password"]) < 8 )){
                echo "<script>alert('password is not validate')</script>";
                $regex_validate_error = 1;
            }
            
            if(!preg_match("/(([A-Z][a-z]+)\s)+([A-Z][a-z]+)/i", $_POST["name"]) ){
                echo "<script>alert('name is not validate')</script>";
                $regex_validate_error = 1;
            }

            if(!preg_match("/(([A-Za-z0-9\s]+))/i", $_POST["address"]) ){
                echo "<script>alert('address is not validate')</script>";
                $regex_validate_error = 1;
            }


            if(!preg_match("/98[0-9]{8}/i", $_POST["phone"]) ){
                echo "<script>alert('phone is not validate')</script>";
                $regex_validate_error = 1;
            }

            if(!preg_match("/([a-z|0-9]+@[a-z|0-9]+.[a-z|0-9]+)/i", $_POST["email"]) ){
                echo "<script>alert('email is not validate')</script>";
                $regex_validate_error = 1;
            }
            
            if($flag == 0 && $regex_validate_error != 1){

                // RSA 4096
                $config = array(
                    "digest_alg" => 'sha512',
                        "private_key_bits" => 4096,
                    "private_key_type" => OPENSSL_KEYTYPE_RSA
                );
                $keyPair = openssl_pkey_new($config);
                $privateKey = NULL;
                openssl_pkey_export($keyPair, $privateKey);
                // var_dump($privateKey);
                $keyDetails = openssl_pkey_get_details($keyPair);
                $publicKey = $keyDetails['key'];
                // var_dump($publicKey);
                
                // Register User detail
                $registerQuery = $mysql->prepare("insert into users(username, password, firstname, middlename, lastname, dob, address, phone, email, profile, approved_status, admin_flag, online_status, public_key, private_key)values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);");
            
                $registerQuery->bind_param("sssssssssssssss",$_POST["username"],$md5password,$name[0],$middlename,$name[count($name)-1],$_POST["dob"],$_POST["address"],$_POST["phone"],$_POST["email"],$pname,$approved_status, $admin_flag, $online_status,$publicKey,$privateKey);
                
                $registerQuery->execute();

                $registerd_username = $_POST["username"];
                // Insert More Details
                $get_user_id = $mysql->query("select * from users where username = '$registerd_username';");
                while($row = $get_user_id->fetch_assoc()){
                    $user_id = $row["id"];
                    $about_me = "About Me";
                    $empty = "NULL ";

                    
                }
                $register_more_details = $mysql->prepare("insert into more_details(user_id, username, title, bio, education, work, hometown, hobbies)values (?,?,?,?,?,?,?,?);");
            
                $register_more_details->bind_param("ssssssss",$user_id,$_POST["username"],$about_me,$empty,$empty,$empty,$empty,$empty);
                
                $register_more_details->execute();
                
    
                header("location: login.php");
            }

            else{
                echo "<script>alert('Dublicate data failed');</script>";
            }
            
        }
        else{
            echo "<script>alert('register failed');</script>";
        }


    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Register</title>
    <link rel="shortcut icon" type="image/png" href="./icon/favicon.png"/>
    <style>
        body{
            background-color: #0F0F0F;
        }
        div{
            /* background-color: #97A6C2; */
            background-color: #383838;
            border: 2px #BA00F8 solid;
            width: 60%;
            border-radius: 10px;
            display: flex;
            justify-content: center;
            text-align: center;
            margin: 0 auto; 
        }
        /* h2{
            background-color: #40f96f;
            border-radius: 10px;
            width: 100%;
            padding: 10px;
        } */
        p.nesta{
            /* background-color: #40f96f;
            border-radius: 10px;
            width: 100%;
            padding: 10px; */
            color: #000000;
            font-size: 70px;
        }
        img{
            width: 20px;
        }
        img#idImgNesta{
            width:400px;
        }
        input[type=date]{
            padding: 10px 20px;
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

        input{
            padding: 5px 0px 5px 0px;
        }
        #idRegister{
            padding: 10px 40px 10px 40px;
            /* background-color: #2B3B61; */
            background-color: #EC0000;
            color: white;
            border: none;
            
        }
        #btnLogin{
            text-decoration: none;
            color: white;
            padding: 10px 60px 10px 60px;
            /* background-color: #305B8F; */
            background-color: #BA00F8;
            color: white;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <br><br>
    <!-- <center><img src="./icon/nesta.png" id="idImgNesta"></center> -->
    <!-- <br><br> -->
    <!-- <div style="background-color: #aadd45;"> -->
    <div>
        
        
        <form action="" method="post"  enctype="multipart/form-data">
            <p class="nesta">NESTA</p>
            &nbsp;&nbsp;&nbsp;<input class="file" type="file" name="profile" id="id-profile">
            <?php echo $err['profile']; ?>
            <br><br>
            <!-- username -->
            &nbsp;&nbsp;&nbsp;<img src="./icon/username.png" alt="">&nbsp;&nbsp;
            <input type="text" name="username" id="txt_username" placeholder="Username" required>
            <br><br>


            <!-- password -->
            &nbsp;&nbsp;&nbsp;<img src="./icon/padlock.png" alt="">&nbsp;&nbsp;
            <input type="password" name="password" id="txt_password" placeholder="Password" required>
            <br><br>

            
            <!-- Name -->
            <!-- <img src="./icon/f.png" alt=""> -->
            &nbsp;&nbsp;&nbsp;<img src="./icon/name.png" alt="">&nbsp;&nbsp;
            <input type="text" name="name" id="txt_name" placeholder="Name" required>
            <br><br>

            <!-- middleName -->
            <!-- <img src="./icon/m.png" alt="">
            <img src="./icon/n.png" alt="">
            <input type="text" name="middlename" id="idUsername" placeholder="MiddleName">
            <br><br> -->

            <!-- lastname -->

            <!-- <img src="./icon/l.png" alt="">
            <img src="./icon/n.png" alt="">
            <input type="text" name="lastname" id="idUsername" placeholder="LastName">
            <br><br> -->

            <!-- dob -->

            &nbsp;&nbsp;&nbsp;<img src="./icon/calendar.png" alt="">&nbsp;&nbsp;
            <input type="date" name="dob" id="txt_dob" placeholder="DOB" required>
            <br><br>

            <!-- address -->

            &nbsp;&nbsp;&nbsp;<img src="./icon/location.png" alt="">&nbsp;&nbsp;
            <input type="text" name="address" id="txt_address" placeholder="Address" required>
            <br><br>



            <!-- Mobile Number -->

            &nbsp;&nbsp;&nbsp;<img src="./icon/phone.png" alt="">&nbsp;&nbsp;
            <input type="number" name="phone" id="txt_phone" placeholder="Mobile Number" required>
            <br><br>

            <!-- Email -->

            &nbsp;&nbsp;&nbsp;<img src="./icon/email.png" alt="">&nbsp;&nbsp;
            <input type="email" name="email" id="txt_email" placeholder="Email" required>
            <br><br>


            <!-- registration number -->

            <!-- &nbsp;&nbsp;&nbsp;<img src="./icon/registration.png" alt="">&nbsp;&nbsp;
            <input type="text" name="registration" id="idUsername" placeholder="Registration Number">
            <br><br> -->


            <!-- year -->

            <!-- &nbsp;&nbsp;&nbsp;<img src="./icon/semister.png" alt="">&nbsp;&nbsp;
            <input type="number" name="year" id="idUsername" placeholder="Year">
            <br><br> -->




            <!-- <button onclick="validate_regex()">test</button> -->
            <input type="submit" name="register" value="Register" id="idRegister">
            <br><br>

            ________________
            <br><br><br>

            <a href="./login.php" id="btnLogin">Login</a>
            <br><br><br>

        </form>
    </div>

    <script>
        function validate_regex(){
            var error = 0;
            var username = document.getElementById("txt_username").value;
            var password = document.getElementById("txt_password").value;
            var name = document.getElementById("txt_name").value;
            var dob = document.getElementById("txt_dob").value;
            var address = document.getElementById("txt_address").value;
            var phone = document.getElementById("txt_phone").value;
            var email = document.getElementById("txt_email").value;


            // var check = document.getElementById("terms").value;
            
            // username
            if(username.match(/([A-Za-z0-9])+/g)){
                console.log("+ Username coorect " + Username);
            }
            else{
                console.log("- Username not correct " + username);
                error += 1;
                alert("Name error");
            }

            // password
            if(password.match(/([A-Za-z0-9\\\*\@\$\#\%\^\&\,\.\s])+/g)){
                console.log("+ password coorect " + password);
            }
            else{
                console.log("- password not correct " + password);
                error += 1;
                alert("Name error");
            }

            // Name
            if(name.match(/(([A-Z][a-z]+)\s)+([A-Z][a-z]+)/g)){
                console.log("+ name coorect " + name);
            }
            else{
                console.log("- name not correct " + name);
                error += 1;
                alert("Name error");
            }

            // Dob
            if(dob.match(/([A-Za-z0-9\s])+/g)){
                console.log("+ correnc " + dob);
            }
            else{
                console.log("- Error dob" + dob);
                error += 1;
                alert("Name error");
            }

            // Address
            if(address.match(/([A-Za-z0-9\s])+/g)){
                console.log("+ correnc " + address);
            }
            else{
                console.log("- Error Address" + address);
                error += 1;
                alert("Name error");
            }

            // PHone
            if(phone.match(/^98[0-9]{8}$/g)){
                console.log("+ phone coorect " + phone);
            }
            else{
                console.log("- phone not correct " + phone);
                error += 1;
                alert("Name error");
            }

            // Email
            if(email.match(/[a-z|0-9]+\@[a-z|0-9]+\.[a-z|0-9]+/g)){
                console.log("+ email coorect " + email);
            }
            else{
                console.log(email);
                console.log("- email not correct " +email);
                error += 1;
                alert("Name error");
            }

            

            

            // // Gender
            // if(M.checked == true){
            //     console.log("+ correct " + M.value);
            // }
            // else if(F.checked == true){
            //     console.log("+ Correct " + F.value);
            // }
            // else if(O.checked == true){
            //     console.log("+ Correct " + O.value);
            // }
            // else{
            //     console.log("- Error Gender");
            //     error += 1;
            // }

            // // country
            // var country = document.getElementById("country");
            // var invalidCountry = country.value == "Select Country";
            // if(!invalidCountry){
            //     console.log("+ correct country " + country.value);
            // }
            // else{
            //     console.log("- error country " + country.value);
            //     error += 1;
            // }

            // // Terms
            // if(check == "on"){
            //     console.log("+ correct Terms " + check);
            // }
            // else{
            //     console.log("- Error Terms " + check);
            //     error += 1;
            // }

            // if(error == 1){
            //     console.log(" + Correct ");
            // }
            // else{
            //     console.log("- Error " + error);
            // }
            
        }
    </script>
    
</body>
</html>