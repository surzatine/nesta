<?php
include './include/session.php';
include './include/conn.php';
session_start();

date_default_timezone_set("Asia/Kathmandu");

// story Delete
$query_story_list = $mysql->query("select * from story ;");
while ($row = $query_story_list->fetch_assoc()) {
    $sid = $row["sid"];
    $expire_date = strtotime($row["date"]);
    $expire_time = strtotime($row["time"]);

    $present_date = strtotime(date("Y-m-d"));
    $present_time = strtotime(date("H:i:s"));


    $sub_sec = $present_date - $expire_date;
    $sub_days = $sub_sec / 86400;

    $sub_sec_1 = $present_time - $expire_time;
    // $sub_time = $sub_sec_1 / 86000;

    if ($sub_days > 1 || $sub_sec_1 > 86000) {
        $setCommand = $mysql->prepare("delete from story where sid = ?;");
        $setCommand->bind_param("s", $sid);
        $setCommand->execute();
    }
}

// receiver
// $receiver_id = $_GET["chat"];
// echo $receiver;

// username
$sess_Username = $_SESSION["username"];


$me_query = "select * from users where username = '" . $sess_Username . "'";
$selectQuery = $mysql->query($me_query);
while ($row = $selectQuery->fetch_assoc()) {
    $sess_uid = $row["id"];
    $me_username = $row["username"];
    $me_profile = $row["profile"];
    // echo $us;
}



// newsfeed upload
if (isset($_POST["whats_your_mind_btn"]) && $_POST["whats_your_mind_btn"] == "upload") {
    // echo "<script> alert('lol');</script>";

    if (isset($_FILES['newsfeed_image']['error']) && $_FILES['newsfeed_image']['error'] == 0) {
        if (isset($_FILES['newsfeed_image']['size']) && $_FILES['newsfeed_image']['size'] < 4000000) {
            $file_types = ['image/jpeg', 'image/png', 'image/jpg'];
            if (in_array($_FILES['newsfeed_image']['type'], $file_types)) {
                //chmod('images', 0777);
                $pname = uniqid() . '_' . $_FILES['newsfeed_image']['name'];
                if (move_uploaded_file($_FILES['newsfeed_image']['tmp_name'], 'newsfeed/' . $pname)) {
                    echo 'Success';
                    $flag_image_newsfeed = 1;
                } else {
                    echo 'Image upload failed';
                }
            } else {
                echo 'Image type mismatch';
            }
        } else {
            echo 'Image size exceed';
        }
    } else {
        echo 'Please upload image';
    }

    if ($flag_image_newsfeed != 1) {
        $pname = 0;
    }

    $newsfeed_upload = $mysql->prepare("insert into newsfeed(user_id, username, user_profile, newsfeed, image)values (?,?,?,?,?);");

    $newsfeed_upload->bind_param("issss", $sess_uid, $sess_Username, $me_profile, $_POST["whats_your_mind"], $pname);

    $newsfeed_upload->execute();
}




// like insert
if (isset($_POST["like"]) && $_POST["like"] == "like") {
    // echo "<script> alert ('lol'); </script>";
    $liked_flag = 1;

    $like_query = $mysql->prepare("insert into likes(newsfeed_id, user_id, username, liked_flag) values (?,?,?,?);");

    $like_query->bind_param("ssss", $_POST["newsfeed_id"], $sess_uid, $sess_Username, $liked_flag);

    $like_query->execute();

    // delete unlile
    $like_query = $mysql->prepare("delete from dislikes where newsfeed_id = ? and user_id = ? and username = ?;");

    $like_query->bind_param("sss", $_POST["newsfeed_id"], $sess_uid, $sess_Username, );

    $like_query->execute();

    echo "likes";

    // echo "<script>";
}

// unlike insert
if (isset($_POST["unlike"]) && $_POST["unlike"] == "unlike") {
    // echo "<script> alert ('lol'); </script>";
    $unliked_flag = 1;

    $unlike_query = $mysql->prepare("insert into dislikes(newsfeed_id, user_id, username, disliked_flag) values (?,?,?,?);");

    $unlike_query->bind_param("ssss", $_POST["newsfeed_id"], $sess_uid, $sess_Username, $unliked_flag);

    $unlike_query->execute();

    // Unlike query        
    $unlike_query = $mysql->prepare("delete from likes where newsfeed_id = ? and user_id = ? and username = ?;");

    $unlike_query->bind_param("sss", $_POST["newsfeed_id"], $sess_uid, $sess_Username);

    $unlike_query->execute();
}
?>

<!DOCTYPE html>
<html>

<head>
    <title>Home</title>
    <link rel="shortcut icon" type="image/png" href="./icon/favicon.png" />
    <link rel="stylesheet" type="text/css" href="./all.css">
    <script src="./script.js"></script>
    <style>
        body {
            background-color: #0f0f0f;
        }

        body {
            background-color: #0F0F0F;
        }

        .div-friendlist,
        .div-friend_request,
        .div-sent,
        .div-add_friend {
            padding-left: 60px;
        }

        h2 {
            color: white;
            padding-left: 40px;
        }

        a {
            text-decoration: none;
            color: #FCFC01;
            font-size: 20px;
            padding-right: 10px;
        }

        /* story */
        .story {
            padding-left: 30px;
            overflow-x: auto;
            white-space: nowrap;
            /* width: 95%;
            overflow-x: scroll;
            overflow-y: hidden;  */
        }

        .story__mystory {
            background-image: url("./story/mystory.jpg");
            filter: blur(1px);
            height: 300px;
            width: 169px;
            display: inline-block;
            margin: 10px;
            border: solid 5px #BA00F8;
            /* padding: 5px; */
            background-color: #BA00F8;
            border-radius: 8px;
        }

        .story__mystory:hover {
            background-image: url("./story/mystory.jpg");
            filter: blur(4px);
            border: solid 5px #BA00F8;
        }

        .story__wrapper {
            height: 300px;
            display: inline-block;
            margin: 10px;
            padding: 5px;
            background-color: #BA00F8;
            border-radius: 8px;
            position: relative;
        }

        .story__wrapper img {
            display: block;
            height: 300px;
            border-radius: 8px;
        }

        .bottomleft {
            position: absolute;
            bottom: 8px;
            left: 16px;
            font-size: 18px;
        }

        .bottomleft img {
            height: 60px;
            border-radius: 50%;
            border: solid 3px #FCFC01;
        }

        /* whats_your_mind */
        .whats_your_mind {
            margin-left: 60px;
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

        input[type=text] {
            padding: 10px 150px;
            color: black;
            margin-right: 20px;
        }

        input[type=submit] {
            padding: 10px 20px;
            background-color: #EC0000;
            color: #FFFFFF;
            border: none;
            border-radius: 4px;

        }

        /* newssfeed */
        .newsfeed {
            margin-left: 60px;
        }

        .newsfeed_username {
            color: white;
            font-size: 40px;
        }

        .newsfeed_text td a {
            color: white;
            font-size: 40px;
        }

        .newsfeed_img img {
            border: 8px solid #FF00B5;
            border-radius: 8px;
            width: 500px;
        }

        .newsfeed_like img {
            width: 40px;
            text-align: center;
        }

        button {
            border: none;
            background: none;
            color: white;
            font-size: 20px;
        }
    </style>


</head>

<body>

    <?php require "./include/header.php"; ?>

    <br>


    <!-- story -->
    <h2>Story</h2>
    <div class="story">

        <a href="./storyadd.php">
            <div class="story__mystory">
                <!-- My story -->
                <div class='bottomleft'>
                    <img src='./story/plus_story.png'>
                </div>
            </div>
        </a>

        <?php
        $query_story_list = $mysql->query("select * from story where user_id = $sess_uid order by sid desc;");
        while ($row = $query_story_list->fetch_assoc()) {
            $sid = $row["sid"];
            $user_id = $row["user_id"];
            $username = $row["username"];
            $user_profile = $row["user_profile"];
            $story_img = $row["story_img"];
            $story_blog = $row["story_blog"];
            // $id = $row["id"];
        
            echo "<div class='story__wrapper'>";
            // a tag image
            echo "<a href='./story/$story_img'>";
            echo "<img src='./story/$story_img' >";
            echo "<div class='bottomleft'>";
            echo "<img src='./profile/$user_profile'>";
            echo "</div>";
            echo "</a>";
            echo "</div>";

        } ?>


        <?php
        $query_friend_list = $mysql->query("select * from friend_lists where (friend_id_1 = $sess_uid or friend_id_2 = $sess_uid) and (friend_approve_1 = 1 and friend_approve_2 = 1);");
        while ($row = $query_friend_list->fetch_assoc()) {
            $friend_id_1 = $row["friend_id_1"];
            $friend_id_2 = $row["friend_id_2"];
            $approve_friend_1 = $row["approve_friend_1"];
            $approve_friend_2 = $row["approve_friend_2"];




            if (($sess_uid == $friend_id_1)) {
                // echo $friend_id_2;
        
                $query_story_list = $mysql->query("select * from story where user_id=$friend_id_2 order by sid desc;");
                while ($row = $query_story_list->fetch_assoc()) {
                    $sid = $row["sid"];
                    $user_id = $row["user_id"];
                    $username = $row["username"];
                    $user_profile = $row["user_profile"];
                    $story_img = $row["story_img"];
                    $story_blog = $row["story_blog"];
                    // $id = $row["id"];
        
                    echo "<div class='story__wrapper'>";
                    // a tag image
                    // echo "<a href='./story/$story_img'><img src='./story/$story_img' ></a>";
                    echo "<a href='./story/$story_img'>";
                    echo "<img src='./story/$story_img' >";
                    echo "<div class='bottomleft'>";
                    echo "<img src='./profile/$user_profile'>";
                    echo "</div>";
                    echo "</a>";
                    echo "</div>";

                }
            }

            if ($sess_uid == $friend_id_2) {
                // echo $friend_id_1;
        
                $query_story_list = $mysql->query("select * from story where user_id=$friend_id_1 order by sid desc;");
                while ($row = $query_story_list->fetch_assoc()) {
                    $sid = $row["sid"];
                    $user_id = $row["user_id"];
                    $username = $row["username"];
                    $user_profile = $row["user_profile"];
                    $story_img = $row["story_img"];
                    $story_blog = $row["story_blog"];
                    // $id = $row["id"];
        
                    echo "<div class='story__wrapper'>";
                    // a tag image
                    // echo "<a href='./story/$story_img'><img src='./story/$story_img' ></a>";
                    echo "<a href='./story/$story_img'>";
                    echo "<img src='./story/$story_img' >";
                    echo "<div class='bottomleft'>";
                    echo "<img src='./profile/$user_profile'>";
                    echo "</div>";
                    echo "</a>";
                    echo "</div>";

                }
            }
        }
        ?>


    </div>




    <br><br><br>
    <!-- Whats on your mind -->
    <div class="whats_your_mind">
        <form method="POST" enctype="multipart/form-data">
            <?php
            $friend_style_online = "style='border-radius: 50%; border: green 4px solid;'";
            echo "<a href='profile.php?friend_id=" . $sess_uid . "'><img src='./profile/" . $me_profile . "' width='60px' height='60px' " . $friend_style_online . "></a>";
            ?>
            <input type="file" name="newsfeed_image">
            <input type="text" name="whats_your_mind" id="" placeholder="What`s on your mind? ">
            <input type="submit" name="whats_your_mind_btn" value="upload">
        </form>
    </div>

    <br><br><br>

    <!-- neswfeed -->
    <div class="newsfeed">
        <?php
        $query_newsfeed_list = $mysql->query("select * from newsfeed order by nid desc;");
        while ($row = $query_newsfeed_list->fetch_assoc()) {

            echo "<form method='post'>";
            $nid = $row["nid"];
            $nuser_id = $row["user_id"];
            $nusername = $row["username"];
            $nuser_profile = $row["user_profile"];
            $newsfeed1 = $row["newsfeed"];
            $nimage = $row["image"];

            // toxic
            $myfile = fopen("toxic.txt", "r");
            $toxics = explode("\n", fread($myfile, filesize("toxic.txt")));
            // print_r($toxic);
            fclose($myfile);
            // newsfeed
            $get_nfd_txts = explode(" ", $newsfeed1);
            // print_r($get_msg_txts);
            $newsfeed = "";
            foreach ($get_nfd_txts as $get_nfd_txt) {
                foreach ($toxics as $toxic) {

                    if ($toxic == "") {
                        continue;
                    }

                    if (preg_match_all("/" . $toxic . "/i", $get_nfd_txt)) {
                        $count = strlen($get_nfd_txt);
                        $a = "";
                        for ($i = 1; $i < $count; $i++) {
                            $a = $a . "*";
                        }
                        $get_nfd_txt = substr($get_nfd_txt, 0, 1) . $a;
                    }
                }
                $newsfeed = $newsfeed . " " . $get_nfd_txt;
            }


            // like check
            $like_counter = 0;
            $like_check = $mysql->prepare("select * from likes where newsfeed_id=?;");
            $like_check->bind_param("s", $nid);
            $like_check->execute();
            $like_check->store_result();

            if ($like_check->num_rows > 0) {

                // like check
                $like_check = $mysql->query("select * from likes where newsfeed_id = $nid");
                while ($row = $like_check->fetch_assoc()) {
                    $newsfeed_like_check_id = $row["newsfeed_id"];
                    $newsfeed_like_check_user_id = $row["user_id"];
                    $newsfeed_like_check_username = $row["username"];
                    $like_counter += 1;

                }
            } else {
                $like_counter = 0;
            }



            // unlike Check
            $unlike_counter = 0;
            $unlike_check = $mysql->prepare("select * from dislikes where newsfeed_id=?;");
            $unlike_check->bind_param("s", $nid);
            $unlike_check->execute();
            $unlike_check->store_result();
            if ($unlike_check->num_rows > 0) {

                // dislikes check
                $unlike_check = $mysql->query("select * from dislikes where newsfeed_id = $nid");
                while ($row = $unlike_check->fetch_assoc()) {
                    $newsfeed_unlike_check_id = $row["newsfeed_id"];
                    $newsfeed_unlike_check_user_id = $row["user_id"];
                    $newsfeed_unlike_check_username = $row["username"];
                    $unlike_counter += 1;

                }
            } else {
                $unlike_counter = 0;
            }




            $online_query = "select * from users where id = '" . $nuser_id . "'";

            $selectQuery = $mysql->query($online_query);
            while ($row = $selectQuery->fetch_assoc()) {
                $newsfeedProfile = $row["profile"];
                $newsfeed_username = $row["username"];
                $newsfeed_online_status = $row["online_status"];

                if ($newsfeed_online_status == "1") {
                    $newsfeed_style_online = "style='border-radius: 50%; border: green 4px solid;'";
                } else {
                    $newsfeed_style_online = "style='border-radius: 50%; border: red 4px solid;'";
                }
                // echo $us;
            }


            // $friend_style_online = "style='border-radius: 50%; border: green 4px solid;'";
            echo "<a href='profile.php?friend_id=" . $nuser_id . "'><img src='./profile/" . $newsfeedProfile . "' width='60px' height='60px' " . $newsfeed_style_online . "></a>";
            echo "<span class='newsfeed_username'>$nusername</span>";


            ?>
            <input type="hidden" name="newsfeed_id" value="<?php echo $nid; ?>">
            <table>
                <tr class="newsfeed_text">
                    <td colspan="3">
                        <a href="./photo.php?nid=<?php echo $nid; ?>">
                            <?php echo $newsfeed; ?>
                        </a>
                    </td>
                </tr>
                <tr class="newsfeed_img">
                    <td colspan="3">
                        <?php
                        if ($nimage != 0) {
                            ?>
                            <a href="./photo.php?nid=<?php echo $nid; ?>">
                                <img src="./newsfeed/<?php echo $nimage; ?>" alt="" class="newsfeed_main_img">
                            </a>
                            <?php
                        }
                        ?>

                    </td>
                </tr>
                <tr class="newsfeed_like">
                    <td>
                        <center>
                            <button type="submit" name="like" value="like" id="like_btn_disable_<?php echo $nid; ?>">
                                <!-- <img src="./icon/like.svg" class="like_img"> -->
                                <img id="like_img_<?php echo $nid; ?>">
                                <?php echo $like_counter ?>
                                <!-- <span></span> -->
                            </button>
                        </center>
                    </td>
                    <td>
                        <center>
                            <a href="./photo.php?nid=<?php echo $nid; ?>">
                                <img src="./icon/comment.svg">
                            </a>
                        </center>
                    </td>
                    <td>
                        <center>
                            <!-- <input id="btn_save" name="btn_save" type="button" value="Save" />  -->
                            <button type="submit" name="unlike" value="unlike" id="unlike_btn_disable_<?php echo $nid; ?>">
                                <img id="unlike_img_<?php echo $nid; ?>">
                                <?php echo $unlike_counter ?>
                            </button>
                        </center>
                    </td>
                </tr>
            </table>

            <?php
            // like check
            // $like_counter = 0;
            $like_check = $mysql->prepare("select * from likes where newsfeed_id=?;");
            $like_check->bind_param("s", $nid);
            $like_check->execute();
            $like_check->store_result();

            if ($like_check->num_rows > 0) {

                // like check
                $like_check = $mysql->query("select * from likes where newsfeed_id = $nid");
                while ($row = $like_check->fetch_assoc()) {
                    $newsfeed_like_check_id = $row["newsfeed_id"];
                    $newsfeed_like_check_user_id = $row["user_id"];
                    $newsfeed_like_check_username = $row["username"];
                    // $like_counter += 1;
        
                    // echo "lol";
                    if ($newsfeed_like_check_user_id == $sess_uid && $newsfeed_like_check_username == $sess_Username && $nid == $newsfeed_like_check_id) {
                        echo "<script>";
                        echo "document.getElementById('like_img_$nid').src='./icon/liked_fill.svg';";
                        echo "document.getElementById('like_btn_disable_$nid').disabled = true;";
                        echo "</script>";
                    } else {
                        echo "<script>";
                        echo "document.getElementById('like_img_$nid').src='./icon/like.svg';";
                        echo "document.getElementById('like_btn_disable_$nid').disabled = false;";
                        echo "</script>";
                    }
                }
            } else {
                echo "<script>";
                echo "document.getElementById('like_img_$nid').src='./icon/like.svg';";
                echo "document.getElementById('like_btn_disable_$nid').disabled = false;";
                echo "</script>";
            }



            // unlike Check
            // $unlike_counter = 0;
            $unlike_check = $mysql->prepare("select * from dislikes where newsfeed_id=?;");
            $unlike_check->bind_param("s", $nid);
            $unlike_check->execute();
            $unlike_check->store_result();
            if ($unlike_check->num_rows > 0) {

                // dislikes check
                $unlike_check = $mysql->query("select * from dislikes where newsfeed_id = $nid");
                while ($row = $unlike_check->fetch_assoc()) {
                    $newsfeed_unlike_check_id = $row["newsfeed_id"];
                    $newsfeed_unlike_check_user_id = $row["user_id"];
                    $newsfeed_unlike_check_username = $row["username"];
                    // $unlike_counter += 1;
        
                    // echo "lol";
                    if ($newsfeed_unlike_check_user_id == $sess_uid && $newsfeed_unlike_check_username == $sess_Username && $nid == $newsfeed_unlike_check_id) {
                        echo "<script>";
                        echo "document.getElementById('unlike_img_$nid').src='./icon/unliked_fill.svg';";
                        echo "document.getElementById('unlike_btn_disable_$nid').disabled = true;";
                        echo "</script>";
                    } else {
                        echo "<script>";
                        echo "document.getElementById('unlike_img_$nid').src='./icon/unlike.svg';";
                        echo "document.getElementById('unlike_btn_disable_$nid').disabled = false;";
                        echo "</script>";
                    }
                }
            } else {
                echo "<script>";
                echo "document.getElementById('unlike_img_$nid').src='./icon/unlike.svg';";
                echo "document.getElementById('unlike_btn_disable_$nid').disabled = false;";
                echo "</script>";
            }
            ?>
            </form>
            <br>
            <?php
        }
        ?>
    </div>

    <script>
        // document.getElementsByClassName("like_img").src = "./icon/unlike.svg";
        // document.getElementById("like_img").value = "./icon/unlike.svg";
        function like() {
            alert("liked");
            // $(document).ready(function () {
            //     $('#btn_save').click(function () {
            //         var data = 'liked_flag=' + $('#liked_flag').val() + '&btn_save=btn_save';
            //         $.ajax({
            //             url: 'insert_data.php',
            //             type: 'post',
            //             data: data,
            //             success: function (response) {
            //                 $('#mesg').text(response);
            //                 // $('#liked_flag').text('');
            //                 // alert($('#liked_flag').text(''));
            //                 alert(data);
            //                 // $('#txt_lname').text('');
            //                 // $('#txt_email').text('');
            //                 // $('#txt_address').text('');
            //             }
            //         });
            //     });
            // });
        }
        function unlike() {
            alert("disliked");
        }
    </script>


    <script>
        var form = document.getElementById("formId");
        function submitForm(event) {
            event.preventDefault();
            form.style.display = "none";
        }
        form.addEventListener('submit', submitForm);
    </script>


    <!-- <script>
        const nodeList = document.querySelectorAll(".like_img");
        for (let i = 0; i < nodeList.length; i++) {
            nodeList[i].src = "./icon/liked_fill.svg";
        }        
    </script> -->

</body>

</html>