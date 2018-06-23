/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import beans.Productbeans;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Base64;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import conn.Dao;
import java.sql.Blob;
/**
 *
 * @author srivathsan
 */
public class Descservlet extends HttpServlet {

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
        Dao d=new Dao();
        PrintWriter out=response.getWriter();
        String productid=request.getParameter("productid");
        try {
            Connection con=d.getConnection();
        PreparedStatement p=con.prepareStatement("select * from product where catagories=?");
        p.setString(1,productid);
             ResultSet rs=p.executeQuery();
             while(rs.next()){
                  Productbeans pb=new Productbeans();
                 pb.setProductname(rs.getString(1));
                 pb.setQuantity(rs.getInt(2));
                 pb.setPrize(rs.getInt(3));
                Blob blob = rs.getBlob(4);  
                int size=(int)blob.length();
                 byte[] bloarr=blob.getBytes(1,size);
                       String   imgDataBase64=new String(Base64.getEncoder().encode(bloarr));
                 pb.setImage(imgDataBase64);
                 pb.setProductid(rs.getInt(5));
                 pb.setProductdesc(rs.getString(6));
                 pb.setCatagories(rs.getString(7));
        }
        }
        catch(Exception e){
            
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
