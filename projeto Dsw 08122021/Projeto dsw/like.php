<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
		<link href="https://cdnjs.cloudflare.com/ajax/libs/open-iconic/1.1.1/font/css/open-iconic-bootstrap.min.css" rel="stylesheet" />

		<link rel="stylesheet" href="css/bootstrap.min.css">

		<link rel="stylesheet" type="text/css" href="CSS/style.css">
		
		<link rel="stylesheet" type="text/css" href="CSS/css_like.css">

		<script type="text/javascript" src="js/js.js"></script>


		<title>Like</title>



		<style type="text/css">
			
			#imgb{
				border-radius: 50%;
				width: 200px;
				height: 200px;
			}


			hr{
				background-color: white;
				width:500px;"
			}

			body{

				background-color: black;
				color: white;
				font-size: 20px;

			}


			#center{
				background-color: black;
				
			}


		</style>
	</head>
	<body>
		<header>
			<?php
			include "cabecalho_like.php";

			?>
		</header>

		

		<?php 

			session_start();
			include_once "banco.php";

			if(isset($_POST['nomeusuario']) && isset($_POST['senha'])){
				$usr= $_POST['nomeusuario'];
				$pwd= $_POST['senha'];
				
				$qry= "SELECT * FROM usuarios WHERE username='$usr' AND senha='$pwd';";

				$res=mysqli_query($conn, $qry);

				if(mysqli_num_rows($res)>0){
					if($row=mysqli_fetch_assoc($res)){
						$_SESSION['id']=$row['id'];
						$_SESSION['nomeusuario']=$row['username'];


						
					
				$sql="SELECT * FROM usuarios;";
    		
    		
    			$result= mysqli_query($conn,$sql);

			?>
			
			<center id="center">
			<div style="background-image: url(img/fundo4.jpg);">
				<img src="img/logo.png" style="margin-top: 35px;">
				<a href="perfil.php?id=<?php echo  $row["id"]; ?>">
			 			<button type="submit" class="btn btn-outline-light button" style="float: right; margin-right: 15px; margin-top: 135px; border-radius: 50px;">
			 				<?php 

			 					$pasta='img/';
			 				 ?>
							<img id="imgb" src="<?php echo($pasta.$row['img']) ?>" style="width: 50px; height: 50px; margin-right: 15px;">
						</button>
			 		</a>
				<br>
				<hr style="width: auto; background-color: red" >
			
			</div>
			
		 	<?php 
    	   ?>
		 	<div class="row">
		 		<?php 

		 			 while($roww=mysqli_fetch_assoc($result)){

		 		 ?>
		 		<div class="col">
		 			<?php 



		 			 ?>
		 			<p><?php echo $roww['username'] ?></p>

		 			<?php 

			      		$pasta="img/";
			     

			      	?>

			      	<img  id="imgb" src="<?php echo($pasta.$roww['img']) ?>">


			      	 <br><br>

		 			
			  		<button class="btn btn-outline-light button" data-toggle="modal" data-target="#modalExemplo<?php echo $roww['id']; ?>">
			  			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-lines-fill" viewBox="0 0 16 16">
						  <path d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm-5 6s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zM11 3.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5zm.5 2.5a.5.5 0 0 0 0 1h4a.5.5 0 0 0 0-1h-4zm2 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2zm0 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2z"/>
						</svg>
				    </button>



					<div class="modal fade" id="modalExemplo<?php echo $roww['id']; ?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title text-center" id="exampleModalLabel">
					        	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
								  <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
								</svg>

								<?php echo $roww['username']; ?>
							</h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body">

					      	<table class="table table-borderless table-dark">
							  <tbody>
							    <tr>
							      <th scope="row">Username :</th>
							      <td><?php echo $roww['username']; ?></td>
							    </tr>
							    <tr>
							      <th scope="row">Nome :</th>
							      <td><?php echo $roww['nomeComp']; ?></td>
							    </tr>
							    <tr>
							      <th scope="row">email :</th>
							      <td><?php echo $roww['email']; ?></td>
							    </tr>
							    <tr>
							      <th scope="row">Telefone :</th>
							      <td><?php echo $roww['telefone']; ?></td>
							    </tr>
							    <tr>
							      <th scope="row">Data Nasc. :</th>
							      <td><?php echo $roww['data_de_nascimento']; ?></td>
							    </tr>
							    <tr>
							      <th scope="row">Cidade :</th>
							      <td><?php echo $roww['cidade']; ?></td>
							    </tr>
							    <tr>
							      <th scope="row">Estado :</th>
							      <td><?php echo $roww['Estado']; ?></td>
							    </tr>
							    <tr>
							      <th scope="row">Gostos e Hobbies :</th>
							      <td><?php echo $roww['Gostos_hobbies']; ?></td>
							    </tr>
							  </tbody>
							</table>
					       
					      </div>
					  
					    </div>
					  </div>
					</div>


					

					<a href="like_.php?id2=<?php echo $row["id"];?> <?php echo $roww["id"] ?>" >
				  		<button class="btn btn-outline-danger button">
				  			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
							  <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
							</svg>
					    </button>
					</a>

		 		</div>

		 		<?php } ?>
		 	</div>
		 	<br>
		 	 
		<?php 

		


		}
				}else{

					header("Location: login.php");
				}

		 		
				
				
				 }
			

	 ?>
		 	
		 </center>


		 
	</body>

	

	



	 


	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>

	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

</html>





