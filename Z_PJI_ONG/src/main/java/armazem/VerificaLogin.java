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


public class VerificaLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public VerificaLogin() {
        super();
        
    }

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Variaveis 
		String senha, login,senhaAntiga,loginAntigo;
		String tipo = "";
		String tipoT = "";
		Boolean con = false;
		int codigoNovo;
		String banco, usuario, senhabd;
		
		//Pegando dados
		senhaAntiga = request.getParameter("senha");
		loginAntigo = request.getParameter("login");
		tipo = request.getParameter("tipo");	
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
		//where login == '"+loginAntigo+"'
		//Consulta
		try{
		cmdSQL = conexaoBD.prepareStatement("SELECT * from usuario ");
		rsAluno = cmdSQL.executeQuery(); //No Select Usar executeQuery()
		if(rsAluno.next()){
			do{
				System.out.println(rsAluno.getInt("codigo")+"<br>");
				codigoNovo = rsAluno.getInt("codigo");
				System.out.println(rsAluno.getString("senha")+"<br>");
				senha = rsAluno.getString("senha");
				login = rsAluno.getString("login");
				tipo = rsAluno.getString("tipo");
				if(senha.equals(senhaAntiga) & login.equals(loginAntigo)) {
					con = true;
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
		}catch(Exception ex){
			System.out.println("<h3>Erro: " + ex.getMessage()  +"</h3>");
		}
		
		
		try{
			cmdSQL = conexaoBD.prepareStatement("SELECT * from usuario where login = '"+loginAntigo+"'");
			rsAluno = cmdSQL.executeQuery(); //No Select Usar executeQuery()
			if(rsAluno.next()){
				do{
					tipoT = rsAluno.getString("tipo");
					
					
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
		
		
		
		
		//Teste para ver se login existe
		if(con.equals(true)) {
			if(tipoT.equals("C") || tipoT.equals("usuario")) {
				System.out.println(tipoT);
				response.sendRedirect("05_UsuarioC.jsp?login="+loginAntigo+"&tipoa="+tipoT);
			}else {
				System.out.println(tipoT);
				response.sendRedirect("06_UsuarioV.jsp?login="+loginAntigo+"&tipoa="+tipoT);
			}
			
		}else {
			response.sendRedirect("ErroLogin.jsp");
			System.out.println("Login invalido");
		}
	}
	

}
