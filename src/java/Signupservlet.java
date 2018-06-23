
import java.io.IOException;
import conn.Dao;
import beans.Signupbeans;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Operation.Totalcode;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
/**
 *
 * @author srivathsan
 */
public class Signupservlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try{
        String user=request.getParameter("Name");
        String email=request.getParameter("Email");
        String pass1=request.getParameter("Password1");
        String pass2=request.getParameter("Password2");
        String address=request.getParameter("address");
                String state=request.getParameter("state");
        String pincode=request.getParameter("pincode");


        if(pass1.equals(pass2)){
       Totalcode t=new Totalcode();
       
       Date dNow = new Date( );
      SimpleDateFormat ft =new SimpleDateFormat ("yyMMddHHmmss");
     String id1=ft.format(dNow);
     Random rand = new Random();
     int  n = rand.nextInt(50) + 1;
      int i;
       Signupbeans s=new Signupbeans();
       s.setUser(user);
       s.setPass(pass1);
       s.setEmail(email);
       s.setUserid(id1+n);
       s.setAddress(address);
       s.setState(state);
       s.setPincode(pincode);
       out.println("working");
       i=t.signup(s);
      if(i>0)
      {    
          response.sendRedirect("index.jsp");
      }
      else{
          out.println("signup unsuccessfull");
      }
        }
    
    else{
            out.println("SignUp UnSuccessfull");
           
    
}
        }
        catch(Exception e){
            out.println("unsuccesfull");
        }
    
}
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Signupservlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Signupservlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
