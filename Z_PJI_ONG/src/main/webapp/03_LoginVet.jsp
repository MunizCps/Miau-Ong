<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/estiloA.css" media="screen">
</head>
<style>
.botao{
	width: 10%;
	padding: 16px 0px;
	margin: 25px;
	border: none;
	border-radius: 8px;
	outline: none;
	text-transform: uppercase;
	font-weight: 100;
	letter-spacing: 2px;
	background: #987C53;
	cursor: pointer;
	
	justify-content: center
	
	
}


</style>
<body>
<header class="cabecalho ">
	<div class="cabecalho">
		<nav class="cabecalho-menu">
			<img class="cabecalho-img" src="img/logo_ONG.png"> 
				<a class="cabecalho-menu-inf" href="index.jsp"> Home </a>
				<a class="cabecalho-menu-inf" href="feed1.jsp"> Conheça Nossos Mascotes</a>
				<a class="cabecalho-menu-inf" href="02_Login.jsp"> Login </a>
				<a class="cabecalho-menu-inf" href="03_LoginVet.jsp"> Login Veterinário </a>
		</nav>
	 </div>
</header>


<main class="principal">

	<h3> </h3>
	<fieldset>
	<legend> Login Veterinário</legend>
	<form class="" action="ServletProcessaClinico">
		
		<br> 
		<p>
			<label for="id"> Identificação: </label>
			<input type="text" id="id" name="id"/>
		</p>                 
		<br>
			        
		<p>
			<label for="nome"> Senha: </label>
			<input type="password" id="senha" name="senha">
		</p>
		<br> 
			<input type="submit" class="botao"> 
	</form>				
	</fieldset>
</main>


<footer class="rodape">
	<div class="rodape">
		<h3 class="rodape-txt"> By @Ale @Margarida @Muniz</h3>
	</div>

</footer>

</body>
</html>