<?php
include './include/session.php';
include './include/conn.php';
session_start();

// echo "indexPhp";
// echo($_SESSION["username"]);

$sess_Username = $_SESSION["username"];
$senderProfileQuery = $mysql->query("select * from users where username='".$sess_Username."';");
while($row = $senderProfileQuery->fetch_assoc()){
	$sess_uid = $row["id"];
}

// echo "<script>alert($sess_uid)</script>";


$query1 = "select * from users where username = '" . $sess_Username . "'";

$selectQuery = $mysql->query($query1);
while($row = $selectQuery->fetch_assoc()){
    $us = $row["username"];
    // echo $us;
}


if($_SERVER["REQUEST_METHOD"]=="POST" && isset($_POST['update_personal_detail'])){
    if (isset($_FILES['profile']['error']) && $_FILES['profile']['error']== 0 ) {
        if (isset($_FILES['profile']['size']) && $_FILES['profile']['size'] < 4000000) {
            $file_types = ['image/jpeg','image/png','image/jpg'];
            if (in_array($_FILES['profile']['type'], $file_types)) {
                //chmod('images', 0777);
                  $pname = uniqid() . '_' . $_FILES['profile']['name'];
                if (move_uploaded_file($_FILES['profile']['tmp_name'], 'profile/' .$pname )) {
                    echo 'Success';
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

    if($_SERVER["REQUEST_METHOD"]=="POST" && $profile_upload_flag == 1 && isset($_POST["username"]) && isset($_POST["name"]) && isset($_POST["dob"]) && isset($_POST["address"]) && isset($_POST["phone"]) && isset($_POST["email"]) ){
    
    // if($_SERVER["REQUEST_METHOD"]=="POST" && isset($_POST["username"]) && isset($_POST["password"]) && isset($_POST["firstname"]) && isset($_POST["middlename"]) && isset($_POST["lastname"]) && isset($_POST["dob"]) && isset($_POST["address"]) && isset($_POST["phone"]) && isset($_POST["email"]) && isset($_POST["registration"]) && isset($_POST["year"])){
        $name = explode(" ",$_POST["name"]);
        for($i=1; $i<(count($name)-1);$i++){
            $middlename = $middlename . $name[$i] . " ";
        }


        $registerQuery = $mysql->prepare("update users set username=?, firstname=?, middlename=?, lastname=?, dob=?, address=?, phone=?, email=?, profile=? where id=?;");
        
        $registerQuery->bind_param("ssssssssss",$_POST["username"],$name[0],$middlename,$name[count($name)-1],$_POST["dob"],$_POST["address"],$_POST["phone"],$_POST["email"],$pname,$sess_uid);
        
        $registerQuery->execute();
    }

    // header("location: profile.php");

}

if($_SERVER["REQUEST_METHOD"]=="POST" && isset($_POST['update_more_detail'])){
    $registerQuery = $mysql->prepare("update more_details set title=?, bio=?, education=?, work=?, hometown=?, hobbies=? where user_id=?;");
        
    $registerQuery->bind_param("sssssss",$_POST["edit_more_detail_title"],$_POST["edit_more_detail_bio"],$_POST["edit_more_detail_education"],$_POST["edit_more_detail_work"],$_POST["edit_more_detail_hometown"],$_POST["edit_more_detail_hobbies"],$sess_uid);
    
    $registerQuery->execute();
}

?>

<!DOCTYPE html>
<html>
<head>
	<title>Profile</title>
    <link rel="shortcut icon" type="image/png" href="./icon/favicon.png"/>
    <link rel="stylesheet" type="text/css" href="./style.css">
	<style>
		body{
			background-color: #0f0f0f; 
		}
		.personal_info{
            margin-top: 15px;
            display: inline-block;
			background-color: #383838;
			padding-left: 50px;
			color: white;
			font-size: 23px;
            border-radius: 8px;
            padding: 18px;
            overflow: auto;
            position: fixed;
            width: 350px;
		}
		h2{
			color: #EC0000;
            /* display: inline-block; */
		}
		a{
			text-decoration: none;
			color: #39f800;
		}
        #edit_personal_button{
            color: black;
            background-color: #39f800;
            padding: 7px 20px;
            border: none;
            border-radius: 8px;
            font-size: 20px;
            margin-right: 10px;
            margin-left: 10px;
        }
        .delete_button{
            color: black;
            background-color: #F57900;
            padding: 7px 20px;
            border-radius: 8px;
            font-size: 20px;
            border: none;
        }
        .first_text{
            color: #FF00E9;
        }

        #edit_personal_detail{
            display: none;
            position: fixed;
            top: 12%;
            left: 36%;
            z-index: 9;
        }
        #edit_personal_detail form{
            border-radius: 8px;
            border: solid 8px #FF00E9;
            padding: 50px;
            background-color: #4E5055;
        }

        #edit_personal_detail fieldset {
            background-color: #4E5055;
            padding: 50px;
            margin: 25px;
        }

        #edit_personal_detail legend {
            background-color: gray;
            color: white;
            padding: 5px 10px;
            font-size: 20px;
            border-radius: 4px;
        }
        #edit_personal_detail img{
            width: 20px;
        }
        #edit_personal_detail input[type=file]::file-selector-button {
            margin-right: 20px;
            border: none;
            background: #F23A0C;
            padding: 10px 20px;
            border-radius: 10px;
            color: #fff;
            cursor: pointer;
            transition: background .2s ease-in-out;
        }
        #edit_personal_detail input[type=file]::file-selector-button:hover {
            background: #0d45a5;
        }
        #edit_personal_detail  #idUsername, #edit_personal_detail  #idPassword{
            padding: 5px 0px 5px 5px;
        }
        #edit_personal_detail  #idRegister{
            padding: 7px 20px;
            background-color: #39f800;
            color: black;
            border-radius: 8px;
            font-size: 20px;
            border: none;
        }

		.chat{
			background-color: #97a6c2;
		}
        .more_info{
            display: inline-block;
            margin-left: 400px;
            margin-top: 16px;
            padding: 25px;
            /* height:1000px; */
            /* width: 0%; */
            border-radius: 8px;
            /* height: 300px; */
            background-color: #383838;
        }
        .more_info p, .more_info li{
            color: white;
        }
        .more_info h3{
            color: #39f800;
        }
        #edit_more_button{
            color: black;
            background-color: #39f800;
            padding: 7px 20px;
            border-radius: 8px;
            font-size: 20px;
            /* left: 0px; */
            text-align: right;
            border: none;
            /* text-align: center; */
            /* position: relative; */
        }
        #edit_more_detail{
            display: none;
            position: fixed;
            top: 10%;
            left: 25%;
            z-index: 9;
        }
        #edit_more_detail form{
            border-radius: 8px;
            border: solid 8px #FF00E9;
            padding: 25px;
            background-color: #4E5055;
        }

        #edit_more_detail fieldset {
            background-color: #4E5055;
            padding: 50px;
            margin: 25px;
        }

        #edit_more_detail legend {
            background-color: gray;
            color: white;
            padding: 5px 10px;
            font-size: 20px;
            border-radius: 4px;
        }

        #edit_more_detail input {
            margin: 2px;
            width: 700px;
            height: 40px;
            padding-left: 10px;
            border-radius: 4px;
        }
        #edit_more_detail input#input_bio{
            height: 100px;
        }
        #edit_more_detail input#update_bio{
            width: 100px;

            padding: 7px 20px;
            background-color: #39f800;
            color: black;
            border-radius: 8px;
            font-size: 20px;
            border: none;
        }
	</style>
</head>
<body>
	<?php require "./include/header.php"; ?>

    <div class="personal_info">
        <h2>Profile</h2>
        <?php
            $friend_id_profile = $_GET["friend_id"];
            if($friend_id_profile == NULL){
                $query = "select * from users where username='".$sess_Username."';";
            }
            else{
                $query = "select * from users where id='".$friend_id_profile."';";
            }
            $profileQuery = $mysql->query($query);

        ?>


        

        <?php
        while($row = $profileQuery->fetch_assoc()){
            $user_id_more_details = $row["id"];
            $username = $row["username"];
            $firstname = $row["firstname"];
            $middlename = $row["middlename"];
            $lastname = $row["lastname"];
            $dob = $row["dob"];
            $address = $row["address"];
            $phone = $row["phone"];
            $email = $row["email"];
            // $registration = $row["registration"];
            // $year = $row["year"];
            $profile = $row["profile"];
            
            
            
            echo '<img src="./profile/' . $profile . '" width="200px" style="border-radius: 20%;"><br>';
            // echo "<br>";
            echo "<span class='first_text'>Username:</span> " . $username . "<br>";
            echo "<span class='first_text'>First Name:</span> " . $firstname  . "<br>";
            echo "<span class='first_text'>Middle Name:</span> " . $middlename . "<br>";
            echo "<span class='first_text'>Last Name:</span> " . $lastname . "<br>";
            echo "<span class='first_text'>Dob:</span> " . $dob . "<br>";
            echo "<span class='first_text'>Address:</span> " . $address . "<br>";
            echo "<span class='first_text'>Phone:</span> " . $phone . "<br>";
            echo "<span class='first_text'>Email:</span> " . $email . "<br>";
            // echo "Registration: " . $registration . "<br>";
            // echo "Year: " . $year . "<br>";
            echo "<br>";
        }
        if($username == $sess_Username){
            echo "<button id='edit_personal_button' onclick='edit_personal_function()'>Edit</button>";
            // echo "<a class='delete_button' href='./delete.php'>Logout</a>";
            echo "<a class='delete_button' href='./delete.php'>Delete</a>";
            echo "<br><br>";
        }
        ?>

        <div id="edit_personal_detail">
            <form action="" method="post"  enctype="multipart/form-data">
                <fieldset>
                    <legend>Personal Details</legend>
                    <!-- <p class="nesta">NESTA</p> -->
                    &nbsp;&nbsp;&nbsp;<input class="file" type="file" name="profile" id="id-profile" <?php echo "value='$profile'"?>>
                    <?php echo $err['profile']; ?>
                    <br><br>
                    <!-- username -->
                    &nbsp;&nbsp;&nbsp;<img src="./icon/username.png" alt="">&nbsp;&nbsp;
                    <input type="text" name="username" id="idUsername" placeholder="Username" <?php echo "value='$username'"?>>
                    <br><br>



                    
                    <!-- Name -->
                    <!-- <img src="./icon/f.png" alt=""> -->
                    &nbsp;&nbsp;&nbsp;<img src="./icon/name.png" alt="">&nbsp;&nbsp;
                    <input type="text" name="name" id="idUsername" placeholder="Name" <?php echo "value='$firstname $middlename $lastname'"?>>
                    <br><br>


                    <!-- dob -->

                    &nbsp;&nbsp;&nbsp;<img src="./icon/calendar.png" alt="">&nbsp;&nbsp;
                    <input type="date" name="dob" id="idUsername" placeholder="DOB" <?php echo "value='$dob'"?>>
                    <br><br>

                    <!-- address -->

                    &nbsp;&nbsp;&nbsp;<img src="./icon/location.png" alt="">&nbsp;&nbsp;
                    <input type="text" name="address" id="idUsername" placeholder="Address" <?php echo "value='$address'"?>>
                    <br><br>



                    <!-- Mobile Number -->

                    &nbsp;&nbsp;&nbsp;<img src="./icon/phone.png" alt="">&nbsp;&nbsp;
                    <input type="text" name="phone" id="idUsername" placeholder="Mobile Number" <?php echo "value='$phone'"?>>
                    <br><br>

                    <!-- Email -->

                    &nbsp;&nbsp;&nbsp;<img src="./icon/email.png" alt="">&nbsp;&nbsp;
                    <input type="text" name="email" id="idUsername" placeholder="Email" <?php echo "value='$email'"?>>
                    <br><br>

                    
                    <input type="submit" name="update_personal_detail" value="Update" id="idRegister" >
                    <button class="delete_button" onclick="close_personal_function()">Close</button>
                    <!-- <br><br> -->
                    
                </fieldset>

            </form>
        </div>


    </div>
	
    <!-- More Info -->
    <div class="more_info">
        <?php if($username == $sess_Username){ ?>
            <button id='edit_more_button' onclick="edit_more_function()">Edit Details</button>
        <?php } ?>

        <!--  -->
        

        
        <?php
            $query_more_details = $mysql->query("select * from more_details where user_id = $user_id_more_details;");
            while($row = $query_more_details->fetch_assoc()){
                $title = $row["title"];
                $bio = $row["bio"];
                $education = $row["education"];
                $work = $row["work"];
                $hometown = $row["hometown"];
                $hobbies = $row["hobbies"];

                echo "<h2>$title</h2>";
                echo "<p>$bio</p>";

                echo "<h3>Education </h3>
                <p>
                    <ul>";
                    // echo $education;
                        $educations = explode(",",$education);
                        // print_r($educations);
                        foreach($educations as $split_education){
                            echo "<li>$split_education</li>"; 
                            // echo $split_education;
                        }
                    echo "</ul>
                </p>";

                echo "<h3>Work </h3>
                <p>
                    <ul>";
                    // echo $work;
                        $works = explode(",",$work);
                        // print_r($works);
                        foreach($works as $split_work){
                            echo "<li>$split_work</li>";
                            // echo $split_work;
                        }
                    echo "</ul>
                </p>";

                echo "<h3>Home Town </h3>
                <p>
                    <ul>";
                    // echo $hometown;
                        $hometowns = explode(",",$hometown);
                        // print_r($hometowns);
                        foreach($hometowns as $split_hometown){
                            echo "<li>$split_hometown</li>";
                            // echo $split_hometown;
                        }
                    echo "</ul>
                </p>";

                echo "<h3>Hobbies ❤️</h3>
                <p>
                    <ul>";
                    // echo $hobbies;
                        $hobbiess = explode(",",$hobbies);
                        // print_r($hobbiess);
                        foreach($hobbiess as $split_hobbies){
                            echo "<li>$split_hobbies</li>";
                            // echo $split_hobbies;
                        }
                    echo "</ul>
                </p>";
                // echo $us;
            }
        ?>
        <!-- <h2>About Me</h2> -->
        <!-- <p>
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Sapiente temporibus reiciendis aspernatur atque non 
            culpa ex deserunt cumque, consectetur soluta excepturi recusandae enim earum voluptas maiores sit voluptates beatae ducimus error
             accusantium consequatur? Necessitatibus repellat non velit harum, quis eius, beatae sunt ab in a iste quaerat hic aut vero voluptates! 
             Inventore nostrum ratione officiis corporis numquam, error harum molestiae fuga nihil doloremque voluptatibus cum, cumque et autem non.
              Blanditiis sint odio neque quasi nulla provident adipisci illo necessitatibus cum. Soluta at molestias animi eum sit et expedita, quibusdam 
              vero illo, consectetur possimus quisquam exercitationem deleniti neque iure maiores veritatis. Odio?
        </p> -->
        

        
        <!-- <h3>Education</h3>
        <p>
            <ul>
                <li>Khwopa Engineering College</li>
                <li>Khwopa College</li>
            </ul>
        </p> -->

        <!-- <h3>Work</h3>
        <p>
            <ul>
                <li>Intern</li>
                <li>CEO</li>
            </ul>
        </p>

        <h3>Home Town</h3>
        <p>
            <ul>
                <li>Bhaktapur</li>
            </ul>
        </p>

        <h3>Hobbies</h3>
        <p>
            <ul>
                <li>Football</li> 
                <li>VideoGame</li> 
                <li>Travel</li>
            </ul>
        </p> -->




        <div id="edit_more_detail">
            <form action="" method="post"  enctype="multipart/form-data">
                <fieldset>

                    <legend>Edit More</legend>
                    <input type="text" name="edit_more_detail_title" placeholder="Title" value="<?php echo $title ?>">
                    <br><br>
                    <input type="text" name="edit_more_detail_bio" placeholder="Bio" id="input_bio" value="<?php echo $bio ?>">
                    <br><br>
                    <input type="text" name="edit_more_detail_education" placeholder="Education ( * seperate by comma , if more )" value="<?php echo $education ?>">
                    <br><br>
                    <input type="text" name="edit_more_detail_work" placeholder="Work ( * seperate by comma , if more )" value="<?php echo $work ?>">
                    <br><br>
                    <input type="text" name="edit_more_detail_hometown" placeholder="Home Town ( * seperate by comma , if more )" value="<?php echo $hometown ?>">
                    <br><br>
                    <input type="text" name="edit_more_detail_hobbies" placeholder="Hobbies ( * seperate by comma , if more )" value="<?php echo $hobbies ?>">
                    <br><br>
                
                    <input type="submit" name="update_more_detail" value="Update" id="update_bio" >
                    <button class="delete_button" onclick="close_personal_detail()">Close</button>
                    <br><br>
                </fieldset>
                

            </form>
        </div>
        
        
        
    </div>
<script>
    function edit_personal_function(){
        // alert("lol");
        document.getElementById("edit_personal_detail").style.display = "block";
    }
    function close_personal_function(){
        document.getElementById("edit_personal_detail").style.display = "none";
    }
	
    function edit_more_function(){
        // alert("lol");
        document.getElementById("edit_more_detail").style.display = "block";
    }
</script>

</body>
</html>