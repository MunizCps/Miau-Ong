<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String nome, telefone, nomeAnimal;
    nome = request.getParameter("nome");
    telefone  = request.getParameter("telefone");
    nomeAnimal  = request.getParameter("nomeAnimal");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/estiloA.css" media="screen">
</head>
<body>

<header class="cabecalho ">
		<nav class="cabecalho-menu">
			<img class="cabecalho-img" src="img/logo_ONG.png"> 
				<a class="cabecalho-menu-inf" href="index.jsp"> Home </a>
				<a class="cabecalho-menu-inf" href="feed1.jsp"> Conheça Nossos Mascotes</a>
		</nav>
</header>

<main>
<style>
				.dados{
					text-align: center;
					justify-content: center;
					display: inline-block;
					font-size: 30px;
				}
				
				h1{
					font-size: 60px;
				}
				
				h4{
					font-style: italic;
				}
 			
				.principal{
					display: grid;
					text-align: center;
					justify-content: space-around;
        			margin-top: 50px;
        			text-indent: 2em;
				}
			</style>
	<div class="principal">
			<h1>Agradecemos pela adoção!! </h1>
			
			
			
			<p class="dados"> Nome: <%=nome %>, Dados de contato: <%=telefone %> </p>
			<p class="dados"> Você adotou nosso pequen@ <%=nomeAnimal %> </p>
			<br>
			<h4> Logo entraremos em contato com você para confirmar o local de encontro e a ficha de adoção! </h4>
			
			<br> 
			<p> .... Com certeza irei ficar muito feliz com meu novo dono, cuide bem de mim ....</p>
			 
			<br> 
		
	</div>

</main>


<footer class="rodape">
		<h3 class="rodape-txt"> By @Ale @Margarida @Muniz</h3>
</footer>


</body>
</html>