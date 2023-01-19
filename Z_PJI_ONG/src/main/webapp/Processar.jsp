<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<%
		 	System.out.println("nome");
			String nome,senha,CPF,dataNasc,email,telefone,tipoFunc,tipoFuncatt;
			nome = request.getParameter("txtNome");
		    senha = request.getParameter("txtSenha");
		    CPF = request.getParameter("txtCPF");
		    dataNasc = request.getParameter("txtData");
		    telefone = request.getParameter("txtTel");
		    tipoFunc = request.getParameter("rdtipo");
		    
		    if(tipoFunc.equals("usuario")) {
		    	tipoFuncatt = "usuario";
		    }else {
		    	tipoFuncatt="voluntario";
		    }
		%>
	</body>
</html>