package controle;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Cliente;
import modelo.ClienteDao;

@WebServlet(name = "ControleClientes", urlPatterns = {"/ControleClientes"})
public class ControleClientes extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String codigo, nome, endereco;
        double renda;
        Cliente cliente;
        ClienteDao cliDao;
        
        //Recebe os dados vidos do formulário cadcli.html
        codigo = request.getParameter("codigo");
        nome = request.getParameter("nome");
        endereco = request.getParameter("endereco");
        renda = Double.parseDouble(request.getParameter("renda"));        

        // Pegar os dados recebidos e encapsular em 
        // um objeto da classe Cliente
        cliente = new Cliente();
        cliente.setCodigo(codigo);
        cliente.setNome(nome);
        cliente.setEndereco(endereco);
        cliente.setRenda(renda);
        
        //Conectar com o banco de dados
        cliDao = new ClienteDao();
        boolean retorno = cliDao.conectar();
        if (retorno==true){ // conectou com BD
             // Salvar os dados
             retorno = cliDao.salvar(cliente);
             if (retorno==true){
               out.print("Cliente salvo com sucesso");
             }else {
                out.print("Erro ao tentar salvar os dados"); 
             }
        }else{
            out.print("Erro na conexão com o banco de dados");
        }
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
