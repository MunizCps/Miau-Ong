 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%
String nome,senha,CPF,dataNasc,email,telefone,tipoFunc,tipoFuncatt,estado,bairro,cidade,rua,login,prontuario,tipo;
String nome1 = "b";
String login1= "a"; 
int num = 0;
String testeTipo;

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
testeTipo = request.getParameter("tipoa");

%>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="css/estiloA.css" media="screen">
		<link rel="stylesheet" type="text/css" href="css/estilo01.css" media="screen">
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<header class="cabecalho ">
			<div class="cabecalho">
				<nav class="cabecalho-menu">
					<img class="cabecalho-img" src="img/logo_ONG.png"> 
						<a class="cabecalho-menu-inf" href="06_UsuarioV.jsp?nome=<%=nome%>&senha=<%=senha%>&dataNasc=<%=dataNasc%>&telefone=<%=telefone%>&tipoFunc=<%=tipoFunc%>&estado=<%=estado%>&bairro=<%=bairro%>&cidade=<%=cidade%>&rua=<%=rua%>&num=<%=num%>&tipo=<%=tipo%>&CPF=<%=CPF%>&login=<%=login%>&email=<%=email%>"> Home </a>
						<a class="cabecalho-menu-inf" href="07_CadPet.jsp?nome=<%=nome%>&senha=<%=senha%>&dataNasc=<%=dataNasc%>&telefone=<%=telefone%>&tipoFunc=<%=tipoFunc%>&estado=<%=estado%>&bairro=<%=bairro%>&cidade=<%=cidade%>&rua=<%=rua%>&num=<%=num%>&tipo=<%=tipo%>&CPF=<%=CPF%>&login=<%=login%>&email=<%=email%>"> Cadastrar Pet</a> <!-- Cadastrar pet -->
						<a class="cabecalho-menu-inf" href="08_VerficaDPets.jsp?nome=<%=nome%>&senha=<%=senha%>&dataNasc=<%=dataNasc%>&telefone=<%=telefone%>&tipoFunc=<%=tipoFunc%>&estado=<%=estado%>&bairro=<%=bairro%>&cidade=<%=cidade%>&rua=<%=rua%>&num=<%=num%>&tipo=<%=tipo%>&CPF=<%=CPF%>&login=<%=login%>&email=<%=email%>"> Verificar Dados dos Pets</a> <!-- pagina com todos pets cadastrados -->
						<a class="cabecalho-menu-inf" href="index.jsp"> Sair </a>
				</nav>
			 </div>
		</header>
		
		
		<main class="principal">
			
		
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
			
			out.println("<h3>"+nome1+"<h3>");
			
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
		
			}
				
				
			</style>
			
			<div class="titulo">
			<h1>Bem Vindo <%=nome1 %></h1>
			 </div>
			 
			 <div class="inf">
			<fieldset class="perfil">
			
			
			
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
			
	
		
		
		<footer class="rodape">
			<div class="rodape">
				<h3 class="rodape-txt"> By @Ale @Margarida @Muniz</h3>
			</div>
		
		</footer>
	
	
	</body>
</html>
