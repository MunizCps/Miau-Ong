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

public class ServletProcessaClinico extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ServletProcessaClinico() {
        super();
        
    }

		protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String senha, id;
		String idnovo ="";
		String senhanova ="";
		int confLogin;
		senha = request.getParameter("senha");
		id = request.getParameter("id");
		
		String banco, usuario, senhabd;
		Connection conexaoBD = null;
		PreparedStatement cmdSQL = null;
		ResultSet rsAluno = null;
		
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
			cmdSQL = conexaoBD.prepareStatement("SELECT * from clinico where id= '"+id+"'");
			rsAluno = cmdSQL.executeQuery(); //No Select Usar executeQuery()
			
			if(rsAluno.next()){
				do{
					
					idnovo = rsAluno.getString("id");
					senhanova = rsAluno.getString("senha");
					
					System.out.println(id);
					System.out.println(senha);
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
		
		if(id.equals(idnovo) || senha.equals(senhanova)) {
			confLogin = 1;
			System.out.println("Login Valido");
			response.sendRedirect("04_PerfilVet.jsp?id="+id+"&senha="+senha);
		}else {
			System.out.println("Login Invalido");
		}
		
		
		
		
		}

}
