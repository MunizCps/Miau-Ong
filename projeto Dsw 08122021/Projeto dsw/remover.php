<?php 

	 session_start();

    $id=$_GET['id'];
    
    include_once "banco.php";

    $sql= "DELETE FROM usuarios WHERE id= $id;";

    if(mysqli_query($conn,$sql)){
    	mysqli_close($conn);
    	include "logout.php";
    	header("Location: login.php");
    }else{
    	echo "Erro: ".$sql."<br>".mysqli_error($conn);
        mysqli_close($conn);
    }



 ?>