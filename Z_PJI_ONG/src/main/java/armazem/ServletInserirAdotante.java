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


public class ServletInserirAdotante extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ServletInserirAdotante() {
        super();
        
    }

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nome,senha,CPF,dataNasc,email,telefone,tipoFunc,tipoFuncatt,estado,bairro,cidade,rua,login,codigoNovo;
		int num;
		String banco, usuario, senhabd;
		nome = request.getParameter("nome");
	    senha = request.getParameter("senha");
	    CPF = request.getParameter("CPF");
	    email = request.getParameter("EMAIL");
	    dataNasc = request.getParameter("dataNasc");
	    telefone = request.getParameter("telefone");
	    tipoFunc = request.getParameter("tipoFunc");
	    estado = request.getParameter("estado");
	    bairro =  request.getParameter("bairro");
	    cidade =  request.getParameter("cidade");
	    rua =  request.getParameter("rua");
	    login =  request.getParameter("login");
	    num = Integer.parseInt(request.getParameter("num"));
	    codigoNovo = request.getParameter("codigo");
	    Random alea = new Random();
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
		try {
			cmdSQL = conexaoBD.prepareStatement("Insert Into adotante(loginUser,codigoUser,ID)" + "values('"+login+"',"+codigoNovo+",'"+alea+"')");
			cmdSQL.executeUpdate();
			cmdSQL = conexaoBD.prepareStatement("update usuario set tipo='C' where login = '"+login+"'");
			cmdSQL.executeUpdate();
			response.sendRedirect("05_UsuarioC.jsp");
		}catch(Exception ex) {
			System.out.println("<h3>Erroaaa: " + ex.getMessage()  +"</h3>");
		}
	}

}
