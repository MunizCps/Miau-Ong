<?php
	session_start();
	$nomeuser = $_POST['nomeusuario'];
	$senha=$_POST['senha'];
    $nome=$_POST['nome'];
    $email=$_POST['email'];
    $tel = $_POST['telefone'];
    $data = $_POST['data_nasc'];
    $cep=$_POST['cep'];
    $cidade=$_POST['cidade'];
    $estado=$_POST['estado'];
    $gostos_hobbies=$_POST['gostos'];
    $imagem = $_FILES["imagem"];


    include_once "banco.php";

    

	if(isset($_FILES['imagem'])){
		$tmpname=$_FILES["imagem"]["tmp_name"];
            $imname=$_FILES["imagem"]["name"];
            $pasta="img/";
            move_uploaded_file($tmpname, $pasta.$imname);

		$sql = "INSERT INTO usuarios(nomeComp,username,email,senha,telefone,data_de_nascimento,cidade,cep,estado,gostos_hobbies,img) VALUES('$nome','$nomeuser','$email','$senha','$tel','$data','$cidade','$cep','$estado','$gostos_hobbies','$imname');";

		
    if(mysqli_query($conn,$sql)){
    	mysqli_close($conn);
    	header("Location:login.php");
    }else{
    	echo "Erro: ".$sql. "<br>". mysqli_error($conn);
    }

}else{
	echo "erro";
}
?>