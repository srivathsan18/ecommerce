/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Operation.Totalcode;
import beans.Addcartbeans;
import conn.Dao;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Integer.parseInt;
import java.sql.Connection;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSession;
/**
 *
 * @author srivathsan
 */
public class Addcartservlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session=request.getSession();
        String productname=request.getParameter("productname");
        int quantity=Integer.parseInt(request.getParameter("quantity"));
         int prize=Integer.parseInt(request.getParameter("prize"));
                    String userid= (String)session.getAttribute("userid");
         int productid=Integer.parseInt(request.getParameter("productid"));
         String catagories=request.getParameter("catagories");
          Addcartbeans ab=new Addcartbeans();
          ab.setProductname(productname);
          ab.setQuantity(quantity);
          ab.setPrize(prize);
          ab.setUserid(userid);
          ab.setProductid(productid);
                     

       Totalcode t=new Totalcode();
       int i=t.addcart(ab,quantity);

       if(i>0){
           if(session.getAttribute("userid")!=null)
           
           {
               response.sendRedirect(catagories+".jsp");
           }
           else{
               out.println("enter corrent quantity ");
               RequestDispatcher rd=request.getRequestDispatcher("index1.jsp");
               rd.forward(request, response);
           }
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
