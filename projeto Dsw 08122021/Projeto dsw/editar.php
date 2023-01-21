<!DOCTYPE html>
<html>
<head>
	<title>Editar</title>

		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

		<link href="https://cdnjs.cloudflare.com/ajax/libs/open-iconic/1.1.1/font/css/open-iconic-bootstrap.min.css" rel="stylesheet" />

		<link rel="stylesheet" type="text/css" href="CSS/style.css">


		<style type="text/css">
			body{

				background-color: black;
				color: white;
				
			}


			#container{
				margin: 50px;
				border-color: black;
				border-radius: 20px;
				padding: 10px;
				color: white;
				font-family: sans-serif;

			}

			.fotos{
				border-radius: 50%;
				margin-left: 10px;
				width: 200px;
				height: 200px;
				padding: 5px;
			}

			#cabecalho{
				background-color: #1034a6;
				border-radius: 20px;
			}

			hr{
				background-color: white;
				width: auto;
			}


			li{
				color: black
			}

			.dados{
				background-color: white;
			}

			.button{
				float: right;
				margin-top: 150px;
				margin-right: 20px;


			}


		</style>
</head>
<body>

	<header>
			<?php


			 session_start();

			 include_once "banco.php";

			 $id=$_GET['id'];

			 $sql="SELECT * FROM usuarios WHERE id=$id;";

			 $dados_usuario=mysqli_query($conn, $sql);

			 $row_usuario= mysqli_fetch_assoc($dados_usuario);

		
			include "cabecalho_like.php"
			?>	
	</header>


	<br>


	<div id="container">
		<div id="cabecalho">

			<?php 

				$pasta="img/";
			 ?>
			<img src="<?php echo($pasta.$row_usuario['img']) ?>" class="fotos">

			<span style="font-size: 35px;"><b><?php echo $row_usuario['username'] ?></b></span>
		        
		</div>
		<hr>	

		<form action="perfil2.php" method="POST">
            <div class="form-row">
                <div class="form-group col-md-4">
                    <label for="nomeusuario" ><b>Nome de usuário: </b></label>
                    <input type="text" class="form-control" id="nomeusuario"
                           placeholder="Nome de usuário" autofocus="autofocus" name="nomeusuario" value="<?php 
	                                   echo  $row_usuario['username'];
	                                ?>"/>  
                </div>

                <div class="form-group col-md-4">
                	<label for="senha"><b>Senha:</b> </label>
                    <input type="password" class="form-control" id="senha"
                           placeholder="Senha" autofocus="autofocus" name="senha" value="<?php 
	                                   echo  $row_usuario['senha'];
	                                ?>" />
                </div>

                <div class="form-group col-md-4">
                	<label for="nome"><b>Nome Completo:</b> </label>
                    <input type="text" class="form-control" id="nome"
                           placeholder="nome" autofocus="autofocus" name="nome" value="<?php 
	                                   echo  $row_usuario['nomeComp'];
	                                ?>"  />
                </div>

                <div class="form-group col-md-4">
                	<label for="email"><b>E-mail:</b> </label>
                    <input type="text" class="form-control" id="email"
                           placeholder="email" autofocus="autofocus" name="email" value="<?php 
	                                   echo  $row_usuario['email'];
	                                ?>" />
                </div>

                <div class="form-group col-md-4">
                	
                    <label for="telefone"><b>Telefone:</b> </label>
                    <input type="text" class="form-control" id="telefone"
                           placeholder="telefone" autofocus="autofocus" name="telefone"value="<?php 
	                                   echo  $row_usuario['telefone'];
	                                ?>"  />
                </div>

                <div class="form-group col-md-4">
                	<label for="data_nasc"><b>Data Nascimento: </b> </label>
                    <input type="date" class="form-control" id="data_nasc"
                           placeholder="data_nasc" autofocus="autofocus" name="data_nasc" value="<?php 
	                                   echo  $row_usuario['data_de_nascimento'];
	                                ?>"  />

                </div>

                <div class="form-group col-md-4">
                	<label for="cep"><b>CEP: </b> </label>
                    <input type="text" class="form-control" id="cep"
                           placeholder="cep" autofocus="autofocus" name="cep" value="<?php 
	                                   echo  $row_usuario['cep'];
	                                ?>"  />
                </div>

                <div class="form-group col-md-4">
                	<label for="cidade"><b>Cidade: </b> </label>
                    <input type="text" class="form-control" id="cidade"
                           placeholder="cidade" autofocus="autofocus" name="cidade" value="<?php 
	                                   echo  $row_usuario['cidade'];
	                                ?>"  />
                </div>

                <div class="form-group col-md-4">
                	<label for="estado"><b>Estado</b> </label>
                    <input type="text" class="form-control" id="estado"
                           placeholder="estado" autofocus="autofocus" name="estado" value="<?php 
	                                   echo  $row_usuario['Estado'];
	                                ?>"  />
                </div>

                <div class="form-group col-md-4" >
                	<label for="gostos"><b>Gostos e hobbies</b> </label>
                    <input type="text" class="form-control" id="gostos"
                           placeholder="gostos" autofocus="autofocus" name="gostos" value="<?php 
	                                   echo  $row_usuario['Gostos_hobbies'];
	                                ?>"  />
                </div>            
                          

            </div>
           		<input type="hidden" id="id" name="id" value="<?php echo $id; ?>"/>
            	<button type="submit" class="btn btn-outline-danger btn-lg">Editar</button>
            
           
        </form>
		
	</div>







</body>




	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>

	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</html>