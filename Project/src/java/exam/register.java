/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package exam;

import exam.Users;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 *
 * @author c0653616
 */
@WebServlet(name = "register", urlPatterns = {"/register"})
public class register extends HttpServlet {

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
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet register</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet register at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
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
       String emailid = request.getParameter("emailid");
         String firstname =request.getParameter("firstname");
         String lastname =request.getParameter("lastname");
         String password = request.getParameter("password");
         String cpassword = request.getParameter("cpassword");
         String username = request.getParameter("username");
    
          PrintWriter out=response.getWriter();
        if(emailid != null && firstname != null && lastname != null && password != null && username != null) {
           if(password.equals(cpassword)){
                  Users c = new Users(emailid,firstname,lastname,password,username);
                  DatabaseConnection  conn=new DatabaseConnection();
                  Connection con=conn.getConnection();
             try {
               if(con != null){
                String query="INSERT INTO users(emailid,firstname,lastname,password,username) VALUES(?,?,?,?,?)";
                PreparedStatement stmt=con.prepareStatement(query);
                stmt.setString(1, c.getLastName());
                stmt.setString(2, c.getFirstName());
                stmt.setString(3, c.getUserName());
                stmt.setString(4, c.getPassword());
                stmt.setString(5, c.getEmailId());
                stmt.executeUpdate();
                response.sendRedirect("login.jsp");
                out.println("You have been successfully signed up");
                
                } else {
                out.println("Error in database connection");
                }
             } catch (SQLException e) { 
                 out.println("Something is wrong");
               }
           }
           else {
             out.println("Password do not match");
           }
        }
        else {
        
            out.println("Please enter the values before submit");
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
