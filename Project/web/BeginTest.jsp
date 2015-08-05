<%-- 
    Document   : BeginTest
    Created on : 4-Aug-2015, 6:32:31 PM
    Author     : c0653616
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Examination Summary</title>
        <link href="css/menuStyle.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
       <%   
HttpSession Usersession = request.getSession(false);
if(Usersession.getAttribute("Username") == null)
       {
   response.sendRedirect("index.html");
      

}
else
       {
    
%>
<h2 class="Page-Heading">Online Examination</h2>  
<%
 out.println("<b>Welcome "+Usersession.getAttribute("Username")+"...</b>");
 
 %>
  <div id="navigation">  
			<ul>
            	<li id="active"><a href="main.jsp">Home</a></li>
                <%
                if(Usersession.getAttribute("Privilage").toString().contains("adminUser"))
         {
     out.println("<li><a href = 'AdminConsoleHome.jsp'>Administration Console</a></li>");
 }
                %>
                
                <li><a href="ContactUs">Contact Us</a></li>
                <li><a href="Logout.jsp">Logout</a></li>
		</ul>
	</div>    


    <table border="0" width="950">
        <tr>
            <td align ="center">
        <form name="testSummary" id="testSummary" action="StartNewExam" method="POST">
        <table cellpadding ="10" cellspacing="0" border ="0" style="padding-top: 40px; border: none">
            <th colspan ="3"><h2 style="color: #4778e3;">Examination Details</h2></th>
            <tr>
                <td style="color: #4778e3; font-size:20px;">
                    Exam Code
                </td>
                <td>:</td>
                <td>
                    <%
            String exam = "";
            exam = request.getParameter("examListRadio");
            out.println(exam);
%>
<input type="hidden" id="ExamCode" name="ExamCode" value="<% out.print(exam); %>"/>
<input type="hidden" id="ExamName" name="ExamNamePassOn" value="<% out.print(request.getParameter("Name-"+exam)); %>"/>
                </td>
            </tr>
            <tr>
                <td style="color: #4778e3;font-size:20px;">
                    Duration
                </td>
                <td>:</td>
                <td>
                    1 Hour
                </td>
            </tr>
            <tr>
                <td style="color: #4778e3;font-size:20px;">
                    Total no. of Questions
                </td>
                <td>:</td>
                <td>
                    25
                </td>
            </tr>
            <tr>
                <td style="color: #4778e3;font-size:20px;">
                    Maximum Marks
                </td>
                <td>:</td>
                <td>
                    100
                </td>
            </tr>
            <tr>
                <td colspan="3" align ="center">
                    
                    <a href="javascript:void(0)" onClick="javascript:document.getElementById('testSummary').submit()">
                        <img src="images/Start-Test.png" width="160" height="42" style="margin-top:10px; border: 0" /></a>
                    <a href="main.jsp">
                        <img src="Images/Cancel-Exam-Start.png" width="160" height="42" style="margin-top:10px; border: 0" /></a>
                </td>
            </tr>
        </table>         
        </form>  
            </td>
        </tr>
    </table>
            <%
                       }
            %>

    </body>
</html>

