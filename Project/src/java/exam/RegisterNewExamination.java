/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package exam;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author khushi
 */
@WebServlet(name = "RegisterNewExamination", urlPatterns = {"/RegisterNewExamination"})
public class RegisterNewExamination extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
     String dbUrl = "jdbc:odbc:onlineexamination";
     String dbClass = "sun.jdbc.odbc.JdbcOdbcDriver";
     String query = "";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession UserSession = request.getSession(false);
        UserSession.setAttribute("ExamCreationError", null);
        String ExamId = "";
        String ExamName = "";
        String ExamDesc="";
        String ExamIdStatus = "";
        try {
            
            ExamId = request.getParameter("examid");
            ExamName = request.getParameter("examname");
            ExamDesc = request.getParameter("examdescription");
            ExamIdStatus = request.getParameter("ExamIdStatus");
           
            StringBuilder text = new StringBuilder(ExamDesc);
  
        int loc = (new String(text)).indexOf('\n');
        while(loc > 0){
            text.replace(loc, loc+1, "<BR>");
            loc = (new String(text)).indexOf('\n');
       }
            //out.println("Textarea value : "+text);
           
            if(ExamId == null || "".equals(ExamId))
            {
                UserSession.setAttribute("ExamCreationError", "Exam ID may not be left blank");
                response.sendRedirect("AddNewExam.jsp");
            }
            else if(!ExamIdStatus.contains("Available"))
            {
                UserSession.setAttribute("ExamCreationError", "Exam ID is not valid or already taken");
                response.sendRedirect("AddNewExam.jsp");
            }
            else if(ExamName == null || "".equals(ExamName))
            {
                UserSession.setAttribute("ExamCreationError", "Exam Name may not be left blank");
                response.sendRedirect("AddNewExam.jsp");
            }
            else if(ExamDesc == null || "".equals(ExamDesc))
            {
                UserSession.setAttribute("ExamCreationError", "Exam Description may not be left blank");
                response.sendRedirect("AddNewExam.jsp");
            }
            else
            {
            
            Connection con = DriverManager.getConnection (dbUrl,"","");
        PreparedStatement insertUserInfo;
        
        String ExamInfoInsertQuery="insert into exam_list (ExamId, ExamName, ExamDescription) "
                + "values(?,?,?);";
        
        insertUserInfo = con.prepareStatement(ExamInfoInsertQuery);
        
        insertUserInfo.setInt(1, Integer.parseInt(ExamId));
        insertUserInfo.setString(2, ExamName);
        insertUserInfo.setString(3, ExamDesc);
                
        int output = insertUserInfo.executeUpdate();
            
        UserSession.setAttribute("NewExamId", ExamId);
        UserSession.setAttribute("RegisterQNo", 1);
            response.sendRedirect("AddQuestions.jsp");
            }
        } 
        catch(Exception e)
        {
            e.printStackTrace(out);
        }
        finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
