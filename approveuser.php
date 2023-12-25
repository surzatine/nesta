<?php
include "./include/conn.php";
include "./include/session.php";
session_start();

$getid = $_GET["id"];
$status_value = 1;


$block_id = $_GET["block_id"];
$block_value = 0;

echo $_SESSION["username"];

if ($_SESSION["username"] != "admin") {
    header("location: index.php");
}

if (isset($getid)) {

    $registerQuery = $mysql->prepare("update users set approved_status=? where id=?;");

    $registerQuery->bind_param("si", $status_value, $getid);

    $registerQuery->execute();
}


if (isset($block_id)) {

    $registerQuery = $mysql->prepare("update users set approved_status=? where id=?;");

    $registerQuery->bind_param("si", $block_value, $block_id);

    $registerQuery->execute();
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Approve User</title>
</head>

<body>
    <h2>Approve user</h2>
    <table>
        <tr>
            <td>profile</td>
            <td>username</td>
            <td>name</td>
            <td>dob</td>
            <td>phone</td>
            <td>Email</td>
            <!-- <td>Registration</td>
            <td>Year</td> -->
            <td>status</td>
        </tr>
        <?php
        $profileQuery = $mysql->query("select * from users where approved_status=0;");
        while ($row = $profileQuery->fetch_assoc()) {
            echo "<tr>";

            $id = $row["id"];
            $username = $row["username"];
            $firstname = $row["firstname"];
            $middlename = $row["middlename"];
            $lastname = $row["lastname"];
            $dob = $row["dob"];
            $phone = $row["phone"];
            $email = $row["email"];
            // $registration = $row["registration"];
            // $year = $row["year"];
            $profile = $row["profile"];

            $fullname = $firstname . " " . $middlename . " " . $lastname;

            echo '<td><img src="./profile/' . $profile . '" width="50em" style="border-radius: 20%;"></td>';
            echo "<td>" . $username . "</td>";
            echo "<td>" . $fullname . "</td>";
            echo "<td>" . $dob . "</td>";
            echo "<td> " . $phone . "</td>";
            echo "<td> " . $email . "</td>";
            // echo "<td> " . $registration . "</td>";
            // echo "<td> " . $year . "</td>";
            echo "<td><a href='approveuser.php?id=" . $id . "'>Approve</td>";

            echo "</tr>";
        }
        ?>
    </table>

    <h2>Account to Block</h2>
    <table>
        <tr>
            <td>profile</td>
            <td>username</td>
            <td>name</td>
            <td>dob</td>
            <td>phone</td>
            <td>Email</td>
            <!-- <td>Registration</td>
            <td>Year</td> -->
            <td>status</td>
        </tr>
        <?php
        $profileQuery = $mysql->query("select * from users where approved_status=1;");
        while ($row = $profileQuery->fetch_assoc()) {
            echo "<tr>";

            $id = $row["id"];
            $username = $row["username"];
            $firstname = $row["firstname"];
            $middlename = $row["middlename"];
            $lastname = $row["lastname"];
            $dob = $row["dob"];
            $phone = $row["phone"];
            $email = $row["email"];
            // $registration = $row["registration"];
            // $year = $row["year"];
            $profile = $row["profile"];

            $fullname = $firstname . " " . $middlename . " " . $lastname;

            echo '<td><img src="./profile/' . $profile . '" width="50em" style="border-radius: 20%;"></td>';
            echo "<td>" . $username . "</td>";
            echo "<td>" . $fullname . "</td>";
            echo "<td>" . $dob . "</td>";
            echo "<td> " . $phone . "</td>";
            echo "<td> " . $email . "</td>";
            // echo "<td> " . $registration . "</td>";
            // echo "<td> " . $year . "</td>";
            echo "<td><a href='approveuser.php?block_id=" . $id . "'>Block</td>";

            echo "</tr>";
        }
        ?>
    </table>

</body>

</html>