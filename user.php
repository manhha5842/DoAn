<?php
session_start();
if (empty($_SESSION['id'])) {
    header('location:signin.php');
}