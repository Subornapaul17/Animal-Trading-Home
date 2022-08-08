<?php
include("db_connection.php");
session_start();
$buyer_email = $_SESSION['buyer_email'];

if(!isset($_SESSION['buyer_email'])){
    header("location: login.php");

}

?>