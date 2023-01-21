<?php
 $servername="127.0.0.1";
	$database="relacionamentos";
	$username="root";
	$password="SEnhacomida1";

	$conn=mysqli_connect($servername,$username,$password,$database,'3306');

	if(!$conn){
		die("A conexão falhou" .mysqli_connect_error());
	}
?>