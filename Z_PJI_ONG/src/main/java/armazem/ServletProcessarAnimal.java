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

public class ServletProcessarAnimal extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ServletProcessarAnimal() {
        super();
        
    }

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String foto,locEnc,tipo,nome,porte,cor,raca,situAtual;
		int idade;
		String seDo,PorteD = "";
		String banco, usuario, senhabd;
		String animalNovo;
		
		idade = Integer.parseInt(request.getParameter("txtIdade"));  
		nome = request.getParameter("txtNome");
		cor = request.getParameter("txtCor");
		raca = request.getParameter("txtRaca");
		situAtual = request.getParameter("txtSitAt");
		locEnc = request.getParameter("txtlocalEncontrado");
		tipo = request.getParameter("rdtipo");
		porte = request.getParameter("sPorte");	
		if(tipo.equals("Selvagem")) {
			seDo = "Selvagem";
		}else {
			seDo = "Domestico";
		}
		
		switch(porte) {
		case "1":
			PorteD = "Pequeno";
			break;
		case "2":
			PorteD = "Medio";
			break;
		case "3":
			PorteD = "Grande";
			break;
		}
		foto = request.getParameter("avatar");
	
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
		try{
			cmdSQL = conexaoBD.prepareStatement("Insert Into animal(nome, idade, cor, porte, LocalEncontrado, Raca, situacao, foto,tipo)" + "values('"+nome+"',"+idade+",'"+cor+"','"+PorteD+"','"+locEnc+"','"+raca+"','"+situAtual+"','"+foto+"','"+seDo+"')");
			cmdSQL.executeUpdate();
			response.sendRedirect("05_UsuarioC.jsp?");
			
		}catch(Exception ex){
			System.out.println("<h3>Erro: " + ex.getMessage()  +"</h3>");
			
		}
		
		
    		
    		
		
		
		
		
		
		
		
		
		
		
	}
}
