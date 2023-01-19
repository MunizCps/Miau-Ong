<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/estiloA.css" media="screen">
<title>Insert title here</title>
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

<header id="cabecalho ">
	<div id="cabecalho">
		<nav class="cabecalho-menu">
			<img class="cabecalho-img" src="img/logo_ONG.png"> 
				<a class="cabecalho-menu-inf" href="index.jsp"> Home </a>
				<a class="cabecalho-menu-inf" href=""> Conheça Nossos Mascotes</a>
				<a class="cabecalho-menu-inf" href="02_Login.jsp"> Login </a>
				<a class="cabecalho-menu-inf" href="03_LoginVet.jsp"> Login Veterinário </a>
		</nav>
	 </div>
</header>


<main id="principal">
	<div >
	<fieldset>
	<legend> Login </legend>
		<div id="principal_form"> 
			<form action="VerificaLogin">
				<br> 
				<p class="input">
					<label for="senha"> Senha: </label>
					<input type="password" id="senha" name="senha"/>
				</p>                 
				<br>
			        
				<p class="input">
					<label for="login"> Login: </label>
					<input type="text" id="login" name="login">
				</p>
				<br> 
				<input type="submit" id="btnOperacao" value="Entrar" class="botao">
			</form>
		</div>
	</fieldset> 
	</div>
</main>


<footer id="rodape">
	<div id="rodape">
		<h3 id="rodape-txt"> By @Ale @Margarida @Muniz</h3>
	</div>

</footer>

	

</body>
</html>
