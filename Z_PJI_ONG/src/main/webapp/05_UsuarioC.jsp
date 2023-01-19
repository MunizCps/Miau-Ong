<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
        <%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>

<%
String login;
login = request.getParameter("login");
String nome,senha,CPF,dataNasc,email,telefone,tipoFunc,tipoFuncatt,estado,bairro,cidade,rua,prontuario;
String nome1 = "b";
String login1= "a"; 
int num;

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
%>
<!DOCTYPE html>
<html>
	<head>
	<link rel="stylesheet" type="text/css" href="css/estiloA.css" media="screen">

	<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	
	<header id="cabecalho ">
		<div id="cabecalho">
			<nav class="cabecalho-menu">
				<img class="cabecalho-img" src="img/logo_ONG.png"> 
					<a class="cabecalho-menu-inf" href="05_UsuarioC.jsp"> Home </a>
					<a class="cabecalho-menu-inf" href="feed1.jsp?login=<%=login%>"> Conheça Nossos Mascotes</a>
			</nav>
		 </div>
	</header>
	
	
	<main id="principal">
		<div class="principal_Perfil">
			 <%
			
		   	
		    
		    Connection conexaoBD = null;
			PreparedStatement cmdSQL = null;
			ResultSet rsAluno = null;
			
		  //Conexão
			try{
				banco = "jdbc:mysql://localhost/miau_ong";
				usuario = "root";
				senhabd = "lucas230320";
				
				Class.forName("com.mysql.jdbc.Driver");
				
				conexaoBD = DriverManager.getConnection(banco,usuario,senhabd);
				System.out.println("<h3>Conexão efetuada com sucesso!</h3>");
				
			}
			catch(Exception ex){
				System.out.println("<h3>Erro: " + ex.getMessage()  +"</h3>");
				System.out.println("conexao nao feita");
			
				
			}
		  
		  
			try{
				cmdSQL = conexaoBD.prepareStatement("SELECT * from usuario where login ='"+login+"'");
				rsAluno = cmdSQL.executeQuery(); //No Select Usar executeQuery()
				
				
				if(rsAluno.next()){
					do{
						
						nome1 = rsAluno.getString("nome");
						
						senha = rsAluno.getString("senha");
						CPF = rsAluno.getString("CPF");
						email = rsAluno.getString("email");
						dataNasc = rsAluno.getString("dataNasc");
						telefone = rsAluno.getString("telefone");
						tipoFunc = rsAluno.getString("tipo");
						estado = rsAluno.getString("Estado");
						bairro = rsAluno.getString("Bairro");
						cidade = rsAluno.getString("Cidade");
						num = Integer.parseInt(rsAluno.getString("num"));
						rua = rsAluno.getString("Rua");
						login1 = rsAluno.getString("login");
						
						if(rsAluno.isLast()){
							System.out.println("<br>");
							
							
						}else{
							System.out.println("<hr>");
							System.out.println("<br>");
						}
					}
					while(rsAluno.next());
					
				}else{
					System.out.println("Nenhum dado encontrado");
				} 
				
			}catch(Exception ex){
				System.out.println("<h3>Erro: " + ex.getMessage()  +"</h3>");
				
			}
			
			//out.println("<h3>"+nome1+"<h3>");
			
			%>
			
			
			<style>
				.titulo{
					text-align: center;
				}
				.inf{
					height:100vh;
					width:100vw;
					padding-left:15px;
					padding-right:15px;
					padding:10px;
				}
				h1{
				font-size:45px;
				}
				main{
				
				text-align: left;
				}
				
				ul{
				list-style: none;
				display: inline-block;
				}
				
				
				.imagem{
					width: 50px;
					height: 50px;
					display: inline-block;
				}
				legend{
					font-size:20px;
				}
				
				.botao{
			width: 10%;
			padding: 16px 0px;
			margin: 25px;
			border: none;
			border-radius: 8px;
			outline: none;
			text-transform: uppercase;
			font-weight: 90;
			letter-spacing: 2px;
			background: #987C53;
			cursor: pointer;
			justify-content: center
				
				
			</style>
			
			<div class="titulo">
			<h1>Bem Vindo <%=nome1 %></h1>
			 </div>
			 
			 <div class="inf">
			<fieldset class="perfil">
			<!--  <div class="imagem">
				<img src="img/user (1).png">
			</div>-->
			
			
				<legend> Seus dados pessoais</legend>
				
					<ul>
						<li> Documento: <%=CPF %> </li>
						<li> E-mail: <%=email %> </li>
						<li> Data de Nascimento: <%=dataNasc %> </li>
						<li> Telefone: <%=telefone %> </li>
						<li> Estado: <%=estado %> </li>
						<li> Bairro: <%=bairro %> </li>
						<li> Cidade: <%=cidade %> </li>
						<li> Rua: <%=rua %> </li>
					</ul>
					
						<form action="">
							<input type="submit" value="Alterar" class="botao"> 
						</form>
			</fieldset>
			</div>
	
	</main>
	
	
	<footer id="rodape">
		
			<h3 id="rodape-txt"> By @Ale @Margarida @Muniz</h3>
	</footer>
	<%
	
	%>
	</body>
</html>