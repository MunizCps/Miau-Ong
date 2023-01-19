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


public class ServletProcessarAdotar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ServletProcessarAdotar() {
        super();
       
    }

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String banco, usuario, senhabd;
		Connection conexaoBD = null;
		PreparedStatement cmdSQL = null;
		ResultSet rsAluno = null;
		String login = "";
		String nome = "";
		String telefone = "";
		String nomeAnimal = "";
		login = request.getParameter("login");
		String animal;
		animal = request.getParameter("numident");
	
		
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
			cmdSQL = conexaoBD.prepareStatement("SELECT * from usuario where login= '"+login+"'");
			rsAluno = cmdSQL.executeQuery(); //No Select Usar executeQuery()
			
			if(rsAluno.next()){
				do{
					
					nome = rsAluno.getString("nome");
					telefone = rsAluno.getString("telefone");
					System.out.println(telefone);
					System.out.println(nome);
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
		
		
		
		try{
			cmdSQL = conexaoBD.prepareStatement("SELECT * from animal where num_ident= '"+animal+"'");
			rsAluno = cmdSQL.executeQuery(); //No Select Usar executeQuery()
			
			if(rsAluno.next()){
				do{
					
					nomeAnimal = rsAluno.getString("nome");
					
					System.out.println(nomeAnimal);
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
		
		
		try{
			cmdSQL = conexaoBD.prepareStatement("Insert Into adotei(nomeUser,nomeAnimal,telefoneUser)" + "values('"+nome+"','"+nomeAnimal+"','"+telefone+"')");
			cmdSQL.executeUpdate(); //No Select Usar executeQuery()
			
			
		}catch(Exception ex){
			System.out.println("<h3>Erro: " + ex.getMessage()  +"</h3>");
			
		}
		
		
		response.sendRedirect("adotei.jsp?nome="+nome+"&telefone="+telefone+"&nomeAnimal="+nomeAnimal);
		System.out.println("b"+animal);
		System.out.println("aab"+login);
		
		
	}

}
