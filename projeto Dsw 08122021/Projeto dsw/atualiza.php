<?php 

     session_start();
     include_once "banco.php";
    
      $id=$_POST['id'];
      $nomeusuario=$_POST['nomeusuario'];
      $senha=$_POST['senha'];
      $nome=$_POST['nome'];
      $email=$_POST['email'];
      $cep=$_POST['cep'];
      $cidade=$_POST['cidade'];
      $estado=$_POST['estado'];
      $data=$_POST['data_nasc'];
      $gostos=$_POST['gostos'];


    

    $sql="UPDATE usuarios SET username='$nomeusuario', senha='$senha', nomeComp='$nome', email='$email', telefone='$telefone', cep='$cep', cidade='$cidade', Estado='$estado',data_de_nascimento='$data', cidade='$cidade', estado='$estado', Gostos_hobbies='$gostos' WHERE id=$id;";

    if(mysqli_query($conn,$sql)){
    	
    }else{
    	echo "Erro: ".$sql."<br>".mysqli_error($conn);
        mysqli_close($conn);
    }

	header("Location: perfil.php");    

?>