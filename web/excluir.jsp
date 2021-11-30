<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Excluir jsp</title>
    </head>
    <body>
        <%
            String codigo;
            
            Connection con;
            PreparedStatement st;
            
            //Recebe os dados vindos do formulário exc_cliente.html
            codigo = request.getParameter("codigo");
            
            try{
               //Conecta com o banco de dados
               Class.forName("com.mysql.jdbc.Driver");
               con = DriverManager.getConnection("jdbc:mysql://localhost:3306/controleclientes","root","randis");
               //Excutando o comando INSERT que insere os dados o Banco de dados
               st = con.prepareStatement("DELETE FROM CLIENTE WHERE codigo = ?");
               st.setString(1, codigo);
               int retorno = st.executeUpdate();
               if(retorno==1){
                   out.print("Dados excluidos com sucesso");
               }else{
                   out.print("Este codigo não existe");
               }
               
               
            }catch (ClassNotFoundException ex){
                out.print("Erro ao tentar excluir " + ex.getMessage());
            }catch (SQLException ex){
                
                  out.print ("Erro no cadastro. Entre em contato com o administrador do site" + ex.getMessage());
                
            }
        %>    
    </body>
</html>
