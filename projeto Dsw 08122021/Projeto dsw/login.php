<!DOCTYPE html>
<html>
<head>
	<title>Login</title>


	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/open-iconic/1.1.1/font/css/open-iconic-bootstrap.min.css" rel="stylesheet" />

	
	<link rel="stylesheet" type="text/css" href="CSS/style.css">
	<style type="text/css">
		body{
			background-color: black;
		}


		.caixa{
			border:1px solid;
			border-color: white;
			background-color: transparent;
			width: 500px;
			height: 400px;
			margin: auto;
			margin-top: 80px;
			padding-top: 10px;
			border-radius: 25px;
			text-align: center;
		}

		img.img{
			width: 140px;
		}

		.btn{
			width: 200px;
		}
	</style>
</head>
<body>

	<header>
		<?php 

			session_start();
		     include "cabecalho_login.php";

		     
		?>
	</header>

	<?php 

		if(isset($_SESSION['id'])){
			header("Location: like.php");

	 ?>

	 <a href="logout.php">Encerrar sessão</a>

	 <?php 

	 	}else{
	 		

	  ?>


	<div class="caixa">
		
		<img class="img" src="img/usr.png">
		<div class="container area" id="cadastro">
	            <form action="like.php"  method="POST" >
	                <div class="form-row">
	                    <div class="form-group col-md-12">
	                        <label for="nomeusuario"  style="color: white; float: left;" ><b>Nome de usuário: </b></label>
	                        <input type="text" class="form-control" id="nomeusuario"
	                               placeholder="Nome de usuário" autofocus="autofocus" name="nomeusuario" id="nomeusuario" value=""  />

	                        <label for="senha" style="color: white; float: left;"><b>Senha:</b> </label>
	                        <input type="password" class="form-control" id="nome"
	                               placeholder="Senha" autofocus="autofocus" name="senha" id="senha" value=""  />
	                               
	                    </div>


	                    <div class="form-group col-md-4">
	                        
	                    </div>

	                </div>

	            	
	      
	                <button class="btn btn-primary btn-lg" type="submit">Entrar</button>
	                
	                
	                
	            </form>
	        </div>

	</div>

	<?php 
	    include "rodape.php";
	}
		
	?>

	
	        

	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<script type="text/javascript"/>

</body>
</html>