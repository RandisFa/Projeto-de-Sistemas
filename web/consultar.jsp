<%-- 
    Document   : consultar.jsp
    Created on : 5 de out. de 2021, 21:31:44
    Author     : Fabio Randis
--%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
        <title>Consultar bd</title>
    </head>
    <body>
        <%
            String  codigo;
            Connection con;
            PreparedStatement st;
            ResultSet rs;
            
            // Recebe Dados vindos do formulario cadastrocliente.html 
            codigo = request.getParameter("codigo");
            
            
        try{               
            // conecta com banco de dados
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/controleclientes","root","randis");
             //Executando o comando SELECT
               st = con.prepareStatement("SELECT * FROM CLIENTE WHERE CODIGO=?");
               st.setString(1, codigo);
               rs = st.executeQuery();
               
               //Se encontrou o cliente
               if(rs.next()){
                    out.print("Nome : " + rs.getString("nome") + "<br>" );
                    out.print("Endereço : " + rs.getString("endereco")+"<br>");
                    out.print(" Renda : " + rs.getString("renda") + "<br>");
               }else{ //se não encontrou
                    out.print("Este cliente não está cadastrado");
               }
            }catch (ClassNotFoundException ex){
                out.print("Driver de conexão não encontrado " + ex.getMessage());
            }catch (SQLException ex){
                out.print ("Erro na consulta. Entre em contato com o administrador do site" + ex.getMessage());
            }
        %>    
    </body>
</html>

