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
        <title>Consultar por Renda</title>
    </head>
    <body>
        <%
            String  renda;
            Connection con;
            PreparedStatement st;
            ResultSet rs;
            
            // Recebe Dados vindos do formulario consulta_nome.html 
            renda = request.getParameter("renda");
            
            
        try{               
            // conecta com banco de dados
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/controleclientes","root","randis");
             //Executando o comando SELECT
               st = con.prepareStatement("SELECT * FROM CLIENTE WHERE RENDA < ? ");
               st.setString(1,renda);
               rs = st.executeQuery();
               
               //Se encontrou o cliente
               out.print("<table border='1'>");
               out.print("<tr><th>codigo</th><th>Nome</th><th>Endereço</th><th>Renda</th></tr>");
               while(rs.next()){
                   out.print("<tr>");
                        out.print("<td>" + rs.getString("codigo") + "</td>" );
                        out.print("<td>" + rs.getString("nome") + "</td>" );
                        out.print("<td>" + rs.getString("endereco")+"</td>");
                        out.print("<td>" + rs.getString("renda")+"</td>");
                        
                        out.print("</tr>");
                            
              }             
               out.print("</table>");
        
            }catch (ClassNotFoundException ex){
                out.print("Driver de conexão não encontrado " + ex.getMessage());
            }catch (SQLException ex){
                out.print ("Erro na consulta. Entre em contato com o administrador do site" + ex.getMessage());
            }
        %>    
    </body>
</html>

