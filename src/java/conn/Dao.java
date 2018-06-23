package conn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author srivathsan
 */
public class Dao {
    
    
   public static Connection getConnection(){  
        Connection con=null;  
        try{  
            if(con==null)
            {
            Class.forName("oracle.jdbc.driver.OracleDriver");  
            con=DriverManager.getConnection("url","username","password");  
        }
            
        }
        catch(Exception e)
        {System.out.println(e);}  
        
   return con;
   }
}
   


