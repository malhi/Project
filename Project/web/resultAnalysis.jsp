<%-- 
    Document   : resultAnalysis
    Created on : 4-Aug-2015, 6:54:02 PM
    Author     : c0653616
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
       <%
        HttpSession UserSession = request.getSession(false);
        if(UserSession.getAttribute("username") == null || UserSession.getAttribute("Privilage") == null)
       {
   response.sendRedirect("index.html");
      

}
else
       {
        int currentQuestionNo = 0;
        String currentAnswer = "";
        String UserSelection = "";
        String Question = "";
        
        String dbUrl = "jdbc:odbc:onlineexamination";
        String dbClass = "com.mysql.jdbc.Driver";
        String query = "";
        %>
        <title><% out.print(UserSession.getAttribute("ExamName")+" : "+UserSession.getAttribute("UEID")); %> - Online Examination</title>
    
    </head>
    <body>
    <center>  
        <h1>Let's take a look at how you answered our test....</h1>
        <br/>
        <table border="1" cellpadding="10" cellspacing ="0" width="950">
        <%
        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
               
        Connection con = DriverManager.getConnection (dbUrl,"","");
        Statement stmt = con.createStatement();
        
        query="select QuestionNo, Question, Answer, OptionA, OptionB, OptionC, OptionD from Exam_Question_Bank where ExamId="
                +UserSession.getAttribute("ExamID");
        ResultSet rs = stmt.executeQuery(query);
        
        //-- Checking user answers and generating test score
        while(rs.next())
        {
            String qno = rs.getString("QuestionNo");
            Question = rs.getString("Question");
            //out.print("Question : <br><br> "+Question+"<br><br>");
            currentAnswer = rs.getString("Answer");
            String optionA = rs.getString("OptionA");
             String optionB = rs.getString("OptionB");
              String optionC = rs.getString("OptionC");
               String optionD = rs.getString("OptionD");
               //out.print(optionA+"<br><br>");
            //out.print("currentAnswer : <br><br>"+currentAnswer+"<br><br>");
            //out.print("Answer Value : <br><br>");
           // out.print(correctAnswer+"<br><br>");
            
            String OptionName= "Question"+qno+"SelectedOption";
        if(UserSession.getAttribute(OptionName)!=null)
                   {
            UserSelection = UserSession.getAttribute(OptionName).toString();
            //out.print(UserSelection);
                   }
            else
                               {
                UserSelection = null;
            }
            
            if(UserSelection == null)
                               {
                out.print("<tr>");
           out.print("<td rowspan = '2'>");
           out.print("<img src='images/no.png'/>"
                   + "</td>");
           out.print("<td>"
                   + "<b>Q."+qno+".</b> ");
           out.print(Question+"</td></tr>"
                   + "<tr><td><b>A. </b>");
           if(currentAnswer.contains("OptionA"))
                             {
               out.print(optionA);
           }
                     else if(currentAnswer.contains("OptionB"))
                                                {
                         out.print(optionB);
                     }
                     else if(currentAnswer.contains("OptionC"))
                                                {
                         out.print(optionC);
                     }
                     else if(currentAnswer.contains("OptionD"))
                                                {
                         out.print(optionD);
                     }
           out.print("</td></tr>");
           
           
                
                               }
      else if(currentAnswer.contains(UserSelection))
        {
           out.print("<tr>");
           out.print("<td rowspan = '2'>");
           out.print("<img src='images/yes.png'/>"
                   + "</td>");
           out.print("<td>"
                   + "<b>Q."+qno+".</b> ");
           out.print(Question+"</td></tr>"
                   + "<tr><td><b>A. </b>");
                   //+ rs.getString(currentAnswer));
           if(currentAnswer.contains("OptionA"))
               out.print(optionA);
                     else if(currentAnswer.contains("OptionB"))
                         out.print(optionB);
                     else if(currentAnswer.contains("OptionC"))
                         out.print(optionC);
                     else if(currentAnswer.contains("OptionD"))
                         out.print(optionD);
                   out.print("</td></tr>");
        }
                    
            else
                               {
                out.print("<tr>");
           out.print("<td rowspan = '3'>");
           out.print("<img src='images/no.png'/>"
                   + "</td>");
           out.print("<td>"
                   + "<b>Q."+qno+". </b>");
           out.print(Question+"</td></tr>"
                   + "<tr><td><b>A. </b>");
           if(currentAnswer.contains("OptionA"))
               out.print(optionA);
                     else if(currentAnswer.contains("OptionB"))
                         out.print(optionB);
                     else if(currentAnswer.contains("OptionC"))
                         out.print(optionC);
                     else if(currentAnswer.contains("OptionD"))
                         out.print(optionD);
           out.print("</td></tr><tr><td><b>You Answered : </b><br>");
           if(UserSelection.contains("OptionA"))
               out.print(optionA);
                     else if(UserSelection.contains("OptionB"))
                         out.print(optionB);
                     else if(UserSelection.contains("OptionC"))
                         out.print(optionC);
                     else if(UserSelection.contains("OptionD"))
                         out.print(optionD);
                                 //out.print(UserSelection);
                   
                  // + rs.getString(currentAnswer)+"</td></tr>"
                  // + "<tr><td><b>You Answered: </b><br>"
                   //+ rs.getString(UserSelection));
                               }
            
            out.print("<tr><td colspan='2' style='border-left:0px;border-right:0px'></td></tr>");
        }
               }
        catch(Exception e)
        {
        out.print(e.getMessage());  
        e.printStackTrace(response.getWriter());
        }
               }
        %>
        </table>
        <a href="ExaminationResult.jsp" style="position: absolute; top: 0; right: 0">Back</a>
    </center>
    </body>
</html>
