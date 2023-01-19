<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/estiloA.css" media="screen">
<link rel="stylesheet" type="text/css" href="css/estilop.css" media="screen">

</head>
<body>

<header class="cabecalho ">
	<div class="cabecalho">
		<nav class="cabecalho-menu">
			<img class="cabecalho-img" src="img/logo_ONG.png"> 
				<a class="cabecalho-menu-inf" href="index.jsp"> Home </a>
				<a class="cabecalho-menu-inf" href="feed1.jsp"> Conheça Nossos Mascotes</a>
				<a class="cabecalho-menu-inf" href="01_Cadastro.jsp"> Venha fazer parte da ONG </a>
				<a class="cabecalho-menu-inf" href="02_Login.jsp"> Login </a>
		</nav>
	 </div>
</header>


<main class="principal">
	<form class="principal_Cadastro" action="ServletProcessar">
	<fieldset>
	<br>
	<br>
		<div class="principal_Cadastro_Pessoal">
		
				<!-- <input type="file"> -->
				
				<h3 class="titulo"> Dados pessoais</h3>
				<p class="input">
					<label for="login">Nome de usuário:</label>
        			<input type="text" id="login" name="txtLogin"/> 
        		</p>
				<p class="input">
					<label for="nome">Nome:</label>
        			<input type="text" id="nome" name="txtNome"/> 
        		</p>
        		<p class="input">
					<label for="senha">Senha:</label>
        			<input type="password" id="senha" name="txtSenha"/> 
        		</p>
        		<p class="input">
					<label for="cpf">CPF:</label>
        			<input type="text" id="cpf" name="txtCPF"/>
        		</p>
        		<p class="input">
					<label for="nasc">Nascimento:</label>
        			<input type="date" id="nasc" placeholder="xx/xx/xxxx" name="txtData"/>
        		</p>
        		<p class="input">
					<label for="email">Email:</label>
        			<input type="email" id="email" name="txtEmail"/>
        		</p>
        		<p class="input">
					<label for="tel">Telefone:</label>
        			<input type="tel" id="tel" name="txtTel"/>
        		</p>
        		
        		<br> <br>
        		<div class="imp"> 
        			<h1> Importante!! </h1>
        				<p> Você deseja ser voluntário ou apenas um usuário comum? </p>
        					<input type="radio" id="usuario" name="rdtipo" value="usuario" >
  							<label for="usuario">Usuário</label>
  							<br>
  							<input type="radio" id="voluntario" name="rdtipo" value="voluntario">
  							<label for="voluntario">Voluntário</label>
  							<br>
  				</div>
        	</div>
        	
        	<br>
        	<hr> <br>
        	<div class="principal_Cadastro_Endereco">
				<h3 class="titulo"> Dados de Endereço</h3>
				<p class="input">
					<label for="rua">Rua:</label>
        			<input type="text" id="rua" name="txtRua"/> 
        		</p>
        		<p class="input">
					<label for="num">N°:</label>
        			<input type="text" id="num" name="txtNum"/>
        		</p>
        		<p class="input">
					<label for="bairro">Bairro:</label>
        			<input type="text" id="bairro" name="txtBairro"/>
        		</p>
        		<p class="input">
					<label for="estado">Estado:</label>
        			<input type="text" id="estado" name="txtEstado"/>
        		</p>
        		<p class="input">
					<label for="">Cidade:</label>
        			<input type="text" id="cidade" name="txtCidade"/>
        		</p>
        		<br>
        		<br>
        	</div>
        	
        	
        	<input type="submit" id="btnOperacao" value="Cadastrar" class="botao">
        	<br>
        </fieldset>
	</form>
		
</main>




<footer class="rodape">
	<div class="rodape">
		<h3 class="rodape-txt"> By @Ale @Souza @Muniz</h3>
	</div>

</footer>

</body>
</html>
