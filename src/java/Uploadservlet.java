/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import conn.Dao;
import static java.lang.Integer.parseInt;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
@MultipartConfig(maxFileSize = 16177215)   

/**
 *
 * @author srivathsan
 */
public class Uploadservlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
     
            String productname = request.getParameter("productname");
            int quantity=parseInt(request.getParameter("quantity"));
                   

            int prize=parseInt(request.getParameter("prize"));
        
                 String catagories=request.getParameter("catagories");

        InputStream inputStream = null; // input stream of the upload file
         
        Part filePart = request.getPart("photo");
        String productdesc = request.getParameter("productdesc");
     
            inputStream = filePart.getInputStream();     
            out.println(inputStream);
                    Dao d=new Dao();

        try{
        
        Connection con=d.getConnection();
         PreparedStatement statement = con.prepareStatement("insert into product values(?,?,?,?,SEQ1.nextval,?,?)");
            statement.setString(1,productname);
            statement.setInt(2,quantity);
            statement.setInt(3,prize);
                 
             
            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(4, inputStream);
            }
            statement.setString(5,productdesc);
            statement.setString(6,catagories);
            int i=statement.executeUpdate();
            if(i>0)
            out.println("success");
            response.sendRedirect("admin.jsp");
        }
       catch(Exception e){
           out.println("failure");
           
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
        processRequest(request, response);
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
        processRequest(request, response);
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
