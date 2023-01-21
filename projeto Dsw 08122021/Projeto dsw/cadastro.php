<!DOCTYPE html>
<html>
<head>
	<title>Cadastro</title>


	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/open-iconic/1.1.1/font/css/open-iconic-bootstrap.min.css" rel="stylesheet" />

	
	<link rel="stylesheet" type="text/css" href="CSS/style.css">
	<style type="text/css">
		body{
			background-color: black;
		}

		img.img{
			width: 140px;
			margin-top: 50px;

		}

		.btn{
			width: 200px;
		}


		label{
			color: white;
			
		}


        input[type='file']{
            display: none;

        }

        #labelimg{
            padding: 20px 10px;
            width: 200px;
            background: #333;
            color: #fff;
            text-transform: uppercase;
            display: block;
            font-family: sans-serif;
            text-align: center;
            cursor: pointer;
            transition: .5s;
        }

        
        #labelimg:hover{
            background: #fff;
            color: #333;
        }


		
	</style>
</head>
<body>

	<header>
		<?php 
		     include "cabecalho_cadastro.php";
		?>
	</header>


	<div class="row">

		<div class="col">
			<img class="img" src="img/usr.png">
		</div>
		
		<div class="col-7">
			<img src="img/logo.png" style="margin-top: 35px;">
		</div>
		
	</div>



    

	

	<div class="container area" id="cadastro">

       
            <form action="salvesetor.php" method="POST" enctype="multipart/form-data">
                <div class="form-row">

                    <div class="form-group col-md-10">
                        <label for="imagem" id="labelimg" >Imagem:</label>
                        <input type="file" required name="imagem"/ id="imagem">
                        <br/>
                    </div>

                    <div class="form-group col-md-4">
                        <label for="nomeusuario" ><b>Nome de usuário: </b></label>
                        <input type="text" class="form-control" id="nomeusuario"
                               placeholder="Nome de usuário" autofocus="autofocus" name="nomeusuario" value=""  />
                    </div>

                    <div class="form-group col-md-4">
                    	<label for="senha"><b>Senha:</b> </label>
                        <input type="password" class="form-control" id="senha"
                               placeholder="Senha" autofocus="autofocus" name="senha" value=""  />
                    </div>

                    <div class="form-group col-md-4">
                    	<label for="nome"><b>Nome Completo:</b> </label>
                        <input type="text" class="form-control" id="nome"
                               placeholder="nome" autofocus="autofocus" name="nome" value=""  />
                    </div>

                    <div class="form-group col-md-4">
                    	<label for="email"><b>E-mail:</b> </label>
                        <input type="text" class="form-control" id="email"
                               placeholder="email" autofocus="autofocus" name="email" value=""  />
                    </div>

                    <div class="form-group col-md-4">
                    	
                        <label for="telefone"><b>Telefone:</b> </label>
                        <input type="text" class="form-control" id="telefone"
                               placeholder="telefone" autofocus="autofocus" name="telefone" value=""  />
                    </div>

                    <div class="form-group col-md-4">
                    	<label for="data_nasc"><b>Data Nascimento: </b> </label>
                        <input type="date" class="form-control" id="data_nasc"
                               placeholder="data_nasc" autofocus="autofocus" name="data_nasc" value=""  />

                    </div>

                    <div class="form-group col-md-4">
                    	<label for="cep"><b>CEP: </b> </label>
                        <input type="text" class="form-control" id="cep"
                               placeholder="cep" autofocus="autofocus" name="cep" value=""  />
                    </div>

                    <div class="form-group col-md-4">
                    	<label for="cidade"><b>Cidade: </b> </label>
                        <input type="text" class="form-control" id="cidade"
                               placeholder="cidade" autofocus="autofocus" name="cidade" value=""  />
                    </div>

                    <div class="form-group col-md-4">
                    	<label for="estado"><b>Estado</b> </label>
                        <input type="text" class="form-control" id="estado"
                               placeholder="estado" autofocus="autofocus" name="estado" value=""  />
                    </div>


                    <div class="form-group col-md-4" >
                    	<label for="gostos"><b>Gostos e hobbies</b> </label>
                        <input type="text" class="form-control" id="gostos"
                               placeholder="gostos" autofocus="autofocus" name="gostos" value=""  />
                    </div>            
                    


                    

                </div>
                 <input type="hidden" id="id" name="id" value="" />
                <button type="submit" name="acao" class="btn btn-primary btn-lg">Entrar</button>
            </form>
        </div>

	        

	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.12.0/jquery.min.js"></script>
	
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<script type="text/javascript"/>

</body>
</html>