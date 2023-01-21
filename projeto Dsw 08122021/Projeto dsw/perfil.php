<!DOCTYPE html>
<html>
<head>
	<title>Perfil</title>

		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

		<link href="https://cdnjs.cloudflare.com/ajax/libs/open-iconic/1.1.1/font/css/open-iconic-bootstrap.min.css" rel="stylesheet" />

		<link rel="stylesheet" type="text/css" href="CSS/style.css">


		<style type="text/css">
			body{

				background-color: black;
				color: white;
				
			}


			#container1{
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
			include "cabecalho_like.php";

			
			?>	
	</header>


	<br>


	<div id="container1">
		<?php
			$id=$_GET['id'];
    		include_once "banco.php";

    		

    		$sql="SELECT * FROM usuarios WHERE id='$id';";

    		$result= mysqli_query($conn,$sql);

    	 
    	   while($row=mysqli_fetch_assoc($result)){

    	   	
    	?>

    
		<div id="cabecalho">

			<?php 

			      $pasta="img/";
			     

			 ?>


			<img src="<?php echo($pasta.$row['img']) ?>" class="fotos">

			<span style="font-size: 35px;"><b><?php echo $row['username']; ?></b></span>


			<a  href="editar.php?id=<?php echo  $row["id"]; ?>" >
		  		<button class="btn btn-outline-light button" role="button">
		  			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-fill" viewBox="0 0 16 16">
		  				<path d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708l-3-3zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207l6.5-6.5zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.499.499 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11l.178-.178z"/>
					</svg>
			    </button>
			</a>
		    
		     <a class="btn btn-outline-danger button" href="remover.php?id=<?php  echo $row["id"]; ?>" role="button">
	            <span class="oi oi-circle-x" title="Exclusão" aria-hidden="true"></span>
	        </a>

		</div>
		<hr>	

		

		<div class="row">
			<div class="col-8">
				<h5>Dados</h5>
			</div>

			<div class="col-4">
				<h5>Gostos e Hobbies</h5>
			</div>

		</div>


		<div class="row">
			<div class="col-6" style="background-color: white">
				<table class="table table-borderless table-light">
					<tbody>
						<tr>
					      <th scope="row">Username:</th>
					      <td><?php echo $row['username']; ?></td>
					    </tr>
					    <tr>
					      <th scope="row">Nome:</th>
					      <td><?php echo $row['nomeComp']; ?></td>
					    </tr>
					    <tr>
					      <th scope="row">email:</th>
					      <td><?php echo $row['email']; ?></td>
					    </tr>
					    <tr>
					      <th scope="row">Telefone:</th>
					      <td><?php echo $row['telefone']; ?></td>
					    </tr>
					    <tr>
					      <th scope="row">Data Nasc.:</th>
					      <td><?php echo $row['data_de_nascimento']; ?></td>
					    </tr>

					    <tr>
					      <th scope="row">CEP:</th>
					      <td><?php echo $row['cep']; ?></td>
					    </tr>
					    <tr>
					      <th scope="row">Cidade:</th>
					      <td><?php echo $row['cidade']; ?></td>
					    </tr>
					    <tr>
					      <th scope="row">Estado:</th>
					      <td><?php echo $row['Estado']; ?></td>
					    </tr> 
	                </tbody>
				</table>
			</div>

			<div class="col" style="background-color: white; color: black">
				
				
				<center>
					<?php echo $row['Gostos_hobbies']; ?>
				</center>


				
				
			</div>

		</div>
	    
	               

	                        
       
      
    

   <?php 
     }
   ?>
	                    
	                




	
		


		
	</div>







</body>




	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>

	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</html>