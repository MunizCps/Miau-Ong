<?php 
	$idd=$_GET['id2'];

	$strid=strval($idd);

	$id2=0;
	$id=0;

	foreach (explode(" ", $idd) as $key => $value) {
		if($key==0){
			$id2=$value;

			
			}else if($key==1){
				$id=$value;
		}
	}


	session_start();

	include_once "banco.php";

	$sql= "INSERT INTO like_ (id, id2) VALUES ('$id','$id2');";

	if(mysqli_query($conn,$sql)){
    	mysqli_close($conn);
    	header("Location:like.php");
    }else{
    	echo "Erro: ".$sql. "<br>". mysqli_error($conn);
    }

?>