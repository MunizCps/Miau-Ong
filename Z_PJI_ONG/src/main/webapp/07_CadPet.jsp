<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%
    String nome,senha,CPF,dataNasc,email,telefone,tipoFunc,tipoFuncatt,estado,bairro,cidade,rua,login,prontuario,tipo;
    String nome1 = "b";
    String login1= "a"; 
    int num = 0;

    String banco, usuario, senhabd;

    nome = request.getParameter("nome");
    senha = request.getParameter("senha");
    CPF = request.getParameter("CPF");
    email = request.getParameter("email");
    dataNasc = request.getParameter("dataNasc");
    telefone = request.getParameter("telefone");
    tipoFunc = request.getParameter("rdtipo");
    estado = request.getParameter("estado");
    bairro =  request.getParameter("bairro");
    cidade =  request.getParameter("cidade");
    rua =  request.getParameter("rua");
    login = request.getParameter("login");
    tipo = request.getParameter("tipo");
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/estiloA.css" media="screen">
<link rel="stylesheet" type="text/css" href="css/estilo07.css" media="screen">
</head>
<body>

<header class="cabecalho ">
	<div class="cabecalho">
		<nav class="cabecalho-menu">
			<img class="cabecalho-img" src="img/logo_ONG.png"> 
				<a class="cabecalho-menu-inf" href="06_UsuarioV.jsp?nome=<%=nome%>&senha=<%=senha%>&dataNasc=<%=dataNasc%>&telefone=<%=telefone%>&tipoFunc=<%=tipoFunc%>&estado=<%=estado%>&bairro=<%=bairro%>&cidade=<%=cidade%>&rua=<%=rua%>&num=<%=num%>&tipo=<%=tipo%>&CPF=<%=CPF%>&login=<%=login%>&email=<%=email%>"> Home </a>
				<a class="cabecalho-menu-inf" href="07_CadPet.jsp?nome=<%=nome%>&senha=<%=senha%>&dataNasc=<%=dataNasc%>&telefone=<%=telefone%>&tipoFunc=<%=tipoFunc%>&estado=<%=estado%>&bairro=<%=bairro%>&cidade=<%=cidade%>&rua=<%=rua%>&num=<%=num%>&tipo=<%=tipo%>&CPF=<%=CPF%>&login=<%=login%>&email=<%=email%>"> Cadastrar Pet</a> <!-- Cadastrar pet -->
				<a class="cabecalho-menu-inf" href="feed1.jsp?nome=<%=nome%>&senha=<%=senha%>&dataNasc=<%=dataNasc%>&telefone=<%=telefone%>&tipoFunc=<%=tipoFunc%>&estado=<%=estado%>&bairro=<%=bairro%>&cidade=<%=cidade%>&rua=<%=rua%>&num=<%=num%>&tipo=<%=tipo%>&CPF=<%=CPF%>&login=<%=login%>&email=<%=email%>"> Verificar Dados dos Pets</a> <!-- pagina com todos pets cadastrados -->
				
		</nav>
	 </div>
</header>


<main class="principal">
	<div class="principal_Form_Pet">
		<form action="ServletProcessarAnimal" class="FormPet" enctype="multipart/form-data">
			<!--  9 Situacao atual, 1 foto, 8 raça, 2 local encontrado, 6 porte, 4 idade, 7 cor, 3 tipo, 5  nome -->
			
			<h1> Cadastro de Animal </h1>
			<p class="input">
				<label for="foto"> Foto:</label> 
				<input type="file"
		      	 id="avatar" name="avatar"
		      	 accept="image/png, image/jpeg">
			</p>
			<p class="input">
				<label for="LEnc"> Local encontrado:</label>
				
				<input type="text" id="LEnc" name="txtlocalEncontrado">
			</p>
			<p class="input">
				<label for="rdTipo"> Tipo: </label> <br>
				<label for="Selvagem"> Selvagem </label>
				 <input type="radio" id="Selvagem" name="rdtipo" value="Selvagem"> <br>
				<label for="Domestico"> Doméstico </label>
				 <input type="radio" id="Domestico" name="rdtipo" value="Domestico">
			</p> 
			<p class="input">
				<label for="idade">Idade: </label>
				<input type="number" id="idade" name ="txtIdade">
			</p>
			<p class="input">
				<label for="nome"> Nome: </label>
				<input type="text" id="nome" name="txtNome">
			</p>
			<p class="input">
				<label for="porte"> Porte: </label>
				<select id="porte" name="sPorte"> 
					<option value="1"> Pequeno</option>
					<option value="2"> Médio</option>
					<option value="3"> Grande</option>
				</select>
			</p>
			<p class="input">
				<label for="cor"> Cor: </label>
				<input type="text" id="cor" name="txtCor">
			</p>
			<p class="input">
				<label for="raca"> Raça: </label>
				<input type="text" id="raca" name="txtRaca">
			</p>
			<p class="input">
				<label for="SitAt"> Situação Atual: </label>
				<input type="text" id="SitAt" name="txtSitAt">
			</p>
			<br>
			<!-- Css / usar separação de texto e fonte -->
			<p >
				<input type="submit" id="btnOperacao" value="Adicionar" class="botao">
			</p>
		</form>	
	</div>
</main>


<footer class="rodape">
	<div class="rodape">
		<h3 class="rodape-txt"> By @Ale @Margarida @Muniz</h3>
	</div>

</footer>
</body>
</html>
