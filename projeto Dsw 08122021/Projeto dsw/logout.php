<?php 

	session_start();

	unset($_SESSION['id']);
	unset($_SESSION['nomeusuario']);

	header("Location: login.php");

 ?>