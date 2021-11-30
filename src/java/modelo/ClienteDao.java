package modelo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.SQLException;

        
public class ClienteDao {
 Connection con;    
 PreparedStatement st;
 
 public boolean conectar(){
     try {
         Class.forName("com.mysql.jdbc.Driver");
         con = DriverManager.getConnection("jdbc:mysql://localhost:3306/controlecliente","root","randis");
         return true;
     } catch (ClassNotFoundException | SQLException ex) {
         return false;
     }
 }
 
    public boolean salvar (Cliente cliente){
        try {
            st = con.prepareStatement("INSERT INTO cliente values (?,?,?,?)");
            st.setString(1,cliente.getCodigo());
            st.setString(2,cliente.getNome());
            st.setString(3,cliente.getEndereco());
            st.setDouble(4,cliente.getRenda());
            //Execução do comando SQL
            st.executeUpdate();
            return true;
        } catch (SQLException ex) {
           return false;
        }
    } 

}
