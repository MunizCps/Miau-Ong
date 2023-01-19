<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/estiloA.css" media="screen">
</head>
<body>
<style>
*{
background-position: center;
align-items: center;
}
	cabecalho-img{
		width: 250px;
		height: 250px;
		align-items:center;

		
	}
	
	.principal{
		align-items: center;
		justify-content: center;
		text-align: center;	
		
		margin-left: 25px;
		margin-right: 25px;
		letter-spacing: 0.1em;
		line-height: 2em;
	}
	
	h1{
	border-top: 2px black;
	padding-top: 10px;
	}

</style>
<header id="cabecalho ">
	<div id="cabecalho">
		<nav class="cabecalho-menu">
			<img class="cabecalho-img" src="img/logo_ONG.png"> 
			<!-- centralizar imagem principal  -->
		</nav>
	 </div>
</header>


<main id="principal">
	<fieldset>
		<h1> <legend> Cadastro realizado com sucesso!</legend></h1>
		<a href="index.jsp"> Voltar para página inicial </a> <br>
		<a href="02_Login.jsp"> Ir para Login de Usuário</a>
	</fieldset>
		
</main>


<footer id="rodape">
	<div id="rodape">
		<h3 id="rodape-txt"> By @Ale @Margarida @Muniz</h3>
	</div>

</footer>


</body>
</html>
