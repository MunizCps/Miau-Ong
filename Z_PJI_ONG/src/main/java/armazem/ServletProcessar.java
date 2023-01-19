package armazem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;

public class ServletProcessar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ServletProcessar() {
        super();
        
    }
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Variaveis
		String nome,senha,CPF,dataNasc,email,telefone,tipoFunc,tipoFuncatt,estado,bairro,cidade,rua,login;
		int num;
		String tipo1 = "c";
		String tipo2 = "v";
		int codigoNovo = 0;
		int confLogin = 0;
		String loginNovo ="";
		String erro1="SemLogin";
		String banco, usuario, senhabd;
		
		
		//Get Parameters 
		nome = request.getParameter("txtNome");
	    senha = request.getParameter("txtSenha");
	    CPF = request.getParameter("txtCPF");
	    email = request.getParameter("txtEmail");
	    dataNasc = request.getParameter("txtData");
	    telefone = request.getParameter("txtTel");
	    tipoFunc = request.getParameter("rdtipo");
	    estado = request.getParameter("txtEstado");
	    bairro =  request.getParameter("txtBairro");
	    cidade =  request.getParameter("txtCidade");
	    rua =  request.getParameter("txtRua");
	    login =  request.getParameter("txtLogin");
	    num = Integer.parseInt(request.getParameter("txtNum"));
	    if(login.equals(null)) {
	    	response.sendRedirect("semLogin.jsp?erro="+erro1);
	    }
	     
	    
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
		
		
		
		
		
		
		
		
		
		
		
		
		
	// Ver se user já existe
		try{
			cmdSQL = conexaoBD.prepareStatement("SELECT * from usuario");
			rsAluno = cmdSQL.executeQuery(); //No Select Usar executeQuery()
			
		}catch(Exception ex){
			System.out.println("<h3>Erro: " + ex.getMessage()  +"</h3>");
			
		}
	   //Inserindo usuario
		
	    if(tipoFunc.equals("usuario")) {
	    	tipoFuncatt = "usuario";
	    	try{
	    		
	    		if(rsAluno.next()){
					do{
						System.out.println(rsAluno.getString("login")+"<br>");
						loginNovo = rsAluno.getString("login");
						if(login.equals(loginNovo)) {
							confLogin = 1;
							System.out.println("Esse login já existe");
							response.sendRedirect("ErroCadastro.jsp");
						}
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
				
				if(confLogin == 1) {
					
					System.out.println("Esse login já existe");
					
				}else {
					
				
	    		Random alea = new Random();
	    		cmdSQL = conexaoBD.prepareStatement("Insert Into usuario(nome,email,senha,Rua,Bairro,Cidade,Estado,login,Num,dataNasc,telefone,CPF,tipo)" + "values('"+ nome +"','"+email+"','"+senha+"','"+rua+"','"+bairro+"','"+cidade+"','"+estado+"','"+login+"',"+num+",'"+dataNasc+"','"+telefone+"','"+CPF+"','"+tipoFunc+"')");
				cmdSQL.executeUpdate();
				
				//Selecionando para pegar codigo
				cmdSQL = conexaoBD.prepareStatement("SELECT * from usuario where login='"+loginNovo+"'");
				rsAluno = cmdSQL.executeQuery(); //No Select Usar executeQuery()
				if(rsAluno.next()){
					do{
						System.out.println(rsAluno.getInt("codigo")+"<br>");
						codigoNovo = rsAluno.getInt("codigo");
						System.out.println(rsAluno.getString("email")+"<br>");
						System.out.println(rsAluno.getString("nome")+"<br>");
						System.out.println(rsAluno.getString("senha")+"<br>");
						System.out.println(rsAluno.getString("Rua")+"<br>");
						System.out.println(rsAluno.getString("Bairro")+"<br>");
						System.out.println(rsAluno.getString("Cidade")+"<br>");
						System.out.println(rsAluno.getString("Estado")+"<br>");
						System.out.println(rsAluno.getInt("Num")+"<br>");
						System.out.println(rsAluno.getString("login")+"<br>");
						loginNovo = rsAluno.getString("login");
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
				
				
				//Aviso de inserção
				System.out.println("<h3> Inserção efetuada com sucesso!</h3>");
				
				//Inserindo adotante
				
				cmdSQL = conexaoBD.prepareStatement("Insert Into adotante(loginUser,codigoUser,ID)" + "values('"+loginNovo+"',"+codigoNovo+",'"+alea+"')");
				cmdSQL.executeUpdate();
				cmdSQL = conexaoBD.prepareStatement("update usuario set tipo='C' where login = '"+loginNovo+"'");
				System.out.println(login);
				cmdSQL.executeUpdate();
				response.sendRedirect("05_UsuarioC.jsp?nome="+nome+"&senha="+CPF+"&dataNasc="+dataNasc+"&telefone="+telefone+"&tipoFunc="+tipoFunc+"&estado="+estado+"&bairro="+bairro+"&cidade="+cidade+"&rua="+rua+"&num="+num+"&tipo="+tipo1+"&login="+login);
			}
	    	}
	    	//Erro na inserção
			catch(Exception ex){
				System.out.println("<h3>Erroaaa: " + ex.getMessage()  +"</h3>");
				
			}
	    	
	    	//Redirecionando para pagina de usuario
	    	
	   
	    	//Inserindo voluntario
	    }else {
	    	try{
	    		
				cmdSQL = conexaoBD.prepareStatement("Insert Into usuario(nome,email,senha,Rua,Bairro,Cidade,Estado,login,num,tipo,dataNasc,telefone,CPF)" + "values('"+ nome +"','"+email+"','"+senha+"','"+rua+"','"+bairro+"','"+cidade+"','"+estado+"','"+login+"',"+num+",'"+tipo2+"','"+dataNasc+"','"+telefone+"','"+CPF+"')");
				cmdSQL.executeUpdate();
				Random alea2 = new Random();
				
				//Selecionando para pegar codigo
				cmdSQL = conexaoBD.prepareStatement("SELECT * from usuario where login='"+login+"'");
				rsAluno = cmdSQL.executeQuery(); //No Select Usar executeQuery()
				if(rsAluno.next()){
					do{
						System.out.println(rsAluno.getInt("codigo")+"<br>");
						codigoNovo = rsAluno.getInt("codigo");
						System.out.println(rsAluno.getString("email")+"<br>");
						System.out.println(rsAluno.getString("nome")+"<br>");
						System.out.println(rsAluno.getString("senha")+"<br>");
						System.out.println(rsAluno.getString("Rua")+"<br>");
						System.out.println(rsAluno.getString("Bairro")+"<br>");
						System.out.println(rsAluno.getString("Cidade")+"<br>");
						System.out.println(rsAluno.getString("Estado")+"<br>");
						System.out.println(rsAluno.getInt("Num")+"<br>");
						System.out.println(rsAluno.getString("login")+"<br>");
						loginNovo = rsAluno.getString("login");
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
				
				
				//Aviso de inserção
				System.out.println("<h3> Inserção efetuada com sucesso!</h3>");
				
				//Inserção voluntario
				cmdSQL = conexaoBD.prepareStatement("Insert Into voluntario(loginUser,codigoUser,prontuario)" + "values('"+loginNovo+"',"+codigoNovo+",'"+alea2+"')");
				cmdSQL.executeUpdate();
				cmdSQL = conexaoBD.prepareStatement("update usuario set tipo='v' where loginUser = '"+loginNovo+"'");
				cmdSQL.executeUpdate();

			}
	    	//Erro na inserção
			catch(Exception ex){
				System.out.println("<h3>Erro: " + ex.getMessage()  +"</h3>");
				
			}
	    	//Redirencionando para página de voluntário
	    response.sendRedirect("06_UsuarioV.jsp?nome="+nome+"&senha="+senha+"&dataNasc="+dataNasc+"&telefone="+telefone+"&tipoFunc="+tipoFunc+"&estado="+estado+"&bairro="+bairro+"&cidade="+cidade+"&rua="+rua+"&num="+num+"&tipo="+tipo2+"&CPF="+CPF+"&login="+loginNovo+"&email="+email);
	    	tipoFuncatt="voluntario";
	    }
	    
	    
	        
	    
	}

}
