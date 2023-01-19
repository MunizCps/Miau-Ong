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
   String banco, usuario, senhabd;
   String nome,cor,porte,locEnc,Raca,sit,foto,tipo;
   int idade, num_ident;
 //PreparandoConexão
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
 	  
 	  
 	  
 	  
 	  
 	  
 	  
 	  
 	  
 	  
 	  
 	  //Select animal
 		try{
			cmdSQL = conexaoBD.prepareStatement("SELECT * from animal");
			rsAluno = cmdSQL.executeQuery(); //No Select Usar executeQuery()
			
		}catch(Exception ex){
			System.out.println("<h3>Erro: " + ex.getMessage()  +"</h3>");
			
		}
 		
	   //Pegando dados
		
	    	try{
	    		
	    		if(rsAluno.next()){
					do{
						nome = rsAluno.getString("nome");
						idade = rsAluno.getInt("idade");
						cor = rsAluno.getString("cor");
						porte = rsAluno.getString("porte");
						locEnc = rsAluno.getString("LocalEncontrado");
						Raca = rsAluno.getString("Raca");
						sit = rsAluno.getString("situacao");
						foto = rsAluno.getString("foto");
						num_ident = rsAluno.getInt("num_ident");
						tipo = rsAluno.getString("tipo");
						
						
						if(rsAluno.isLast()){
							System.out.println("<br>");
							
							
						}else{
							System.out.println("<hr>");
							System.out.println("<br>");
						}
					}
					while(rsAluno.next());
	    		
	    		}
	    	}catch(Exception ex){
	    		System.out.println("<h3>Erro: " + ex.getMessage()  +"</h3>");
	    	}
%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="css/new.css" media="screen">
		<link rel="stylesheet" type="text/css" href="css/estiloA.css" media="screen">
		<title>Feed</title>
	</head>
	<body>
	
	<header class="cabecalho ">
		<nav class="cabecalho-menu">
			<img class="cabecalho-img" src="img/logo_ONG.png"> 
				<a class="cabecalho-menu-inf" href="index.jsp"> Home </a>
				<a class="cabecalho-menu-inf" href="feed1.jsp"> Conheça Nossos Mascotes</a>
				<a class="cabecalho-menu-inf" href="01_Cadastro.jsp"> Venha fazer parte da ONG </a>
				<a class="cabecalho-menu-inf" href="02_Login.jsp"> Login </a>
				<a class="cabecalho-menu-inf" href="03_LoginVet.jsp"> Login Veterinário </a>
			
		</nav>
	</header>
	
	<style>
	li{
		padding-top:1px;
		padding-bottom: 1px;
		margin-top:10px;
		margin-bottom: 5px;
		margin-left:5px;
		margin-right:5px;
		
		
	}
	
	.imgp1{
		position: absolute;
		left: 700px; /* posiciona a 90px para a esquerda */ 
		top: 200px; 
		border-radius: 100%;
		
	}
	.imgp2{
		position: absolute;
		left: 900px; /* posiciona a 90px para a esquerda */ 
		top: 600px; 
		border-radius: 100%;
		
	}
	</style>

		
		<div class="principal1"> 
			<ul>
				<li>
				<img class=" imgp1" width="700vw" height="500vh" src="img/img1.jpeg">
				</li>
				<li>
				<img class=" imgp2" width="700vw" height="500vh" src="img/img3.jpeg">
				</li>
			</ul>
		<div class="flex">
		
				
					
			
				<%
				try{
					cmdSQL = conexaoBD.prepareStatement("SELECT * from animal");
					rsAluno = cmdSQL.executeQuery(); //No Select Usar executeQuery()
					
				}catch(Exception ex){
					System.out.println("<h3>Erro: " + ex.getMessage()  +"</h3>");
					
				}
				
				if(rsAluno.next()){
					do{
						
						nome = rsAluno.getString("nome");
						idade = rsAluno.getInt("idade");
						cor = rsAluno.getString("cor");
						porte = rsAluno.getString("porte");
						locEnc = rsAluno.getString("LocalEncontrado");
						Raca = rsAluno.getString("Raca");
						sit = rsAluno.getString("situacao");
						foto = rsAluno.getString("foto");
						num_ident = rsAluno.getInt("num_ident");
						tipo = rsAluno.getString("tipo");
						%>
						<form action="ServletProcessarAdotar">
						<% 
						out.println("<ul>");
						out.println("<li id='nome' name='nome'> " +"Nome: "+ nome +" </li");
						out.println("<li id='"+idade+"' name='"+idade+"'> " +"Idade: "+ idade + " </li>");
						out.println("<li id='"+cor+"' name='"+cor+"'> " +"Cor: "+ cor + " </li>");
						out.println("<li id='"+porte+"' name='"+porte+"'> " +"Porte: "+ porte + " </li>");
						out.println("<li id='"+locEnc+"' name='"+locEnc+"'> " +"Local que foi encontrado: "+ locEnc + " </li>");
						out.println("<li id='"+Raca+"' name='"+Raca+"'> " +"Raca: " +Raca + " </li>");
						out.println("<li id='"+sit+"' name='"+sit+"'> " + "Situação do animal: "+sit + " </li>");
						out.println("<li id='"+num_ident+"' name='"+num_ident+"'> " + "Numero de identificação do animal: "+num_ident  + " </li>");
						out.println("<li id='"+tipo+"' name='"+tipo+"'> " + "Tipo do animal: "+tipo + " </li>");
						out.println("<a href='ServletProcessarAdotar?numident="+num_ident+"&login="+login+"'>Clique Aqui para Adotar</a>");
						out.println("</ul>");
						out.println("<br>");
						out.println("<hr>");
						%>
						</form>
						<% 
						if(rsAluno.isLast()){
							System.out.println("<br>");
							
							
						}else{
							System.out.println("<hr>");
							System.out.println("<br>");
						}
					}
					while(rsAluno.next());
	    		
	    		}
				%>
			
			</div>
			
		</div>
		
		<footer class="rodape">
			<h3 class="rodape-txt"> By @Ale @Margarida @Muniz</h3>

		</footer>
	</body>
</html>