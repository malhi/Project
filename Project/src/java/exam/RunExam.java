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
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author khushi
 */
@WebServlet(name = "RunExam", urlPatterns = {"/RunExam"})
public class RunExam extends HttpServlet {

    String dbUrl = "jdbc:odbc:onlineexamination";
    String dbClass = "sun.jdbc.odbc.JdbcOdbcDriver";
    String query = "";
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
            int iQuestionNo=0;
            String Direction = "";
            String SelectedOption = "";
            HttpSession UserSession = request.getSession(false);
            /* TODO output your page here
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RunExam</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RunExam at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
             */
            Cookie[] ExamCookies = request.getCookies();
            for(int cookieCount = 0; cookieCount < ExamCookies.length; cookieCount++)
            {
                if(ExamCookies[cookieCount].getName().equals("QuestionNo"))
                {
                    iQuestionNo = Integer.parseInt(ExamCookies[cookieCount].getValue());
                }
                if(ExamCookies[cookieCount].getName().equals("MoveDirection"))
                {
                    Direction = ExamCookies[cookieCount].getValue();
                }
            }
            
            if(Direction.equals("Next"))
            {
                iQuestionNo= iQuestionNo-1;
            SelectedOption = request.getParameter("OptionsRadio");
            String OptionName= "Question"+iQuestionNo+"SelectedOption";
            UserSession.setAttribute(OptionName, SelectedOption);
            iQuestionNo++;
            }
            else
            {
                iQuestionNo= iQuestionNo+1;
            SelectedOption = request.getParameter("OptionsRadio");
            String OptionName= "Question"+iQuestionNo+"SelectedOption";
            UserSession.setAttribute(OptionName, SelectedOption);
                iQuestionNo--;
            }
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
               
        Connection con = DriverManager.getConnection (dbUrl,"","");
        Statement stmt = con.createStatement();
        
        query="select Question, OptionA, OptionB, OptionC, OptionD from exam_question_bank where ExamId="
                +UserSession.getAttribute("ExamID")+" and QuestionNo = "+iQuestionNo;
        ResultSet rs = stmt.executeQuery(query); 
        
        if(rs.next())
        {
            UserSession.setAttribute("CurrentQuestion", rs.getString("Question"));
            UserSession.setAttribute("OptionA", rs.getString("OptionA"));
            UserSession.setAttribute("OptionB", rs.getString("OptionB"));
            UserSession.setAttribute("OptionC", rs.getString("OptionC"));
            UserSession.setAttribute("OptionD", rs.getString("OptionD"));
        }
        
            
            response.sendRedirect("QuestionPaper.jsp");
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
