<%-- 
    Document   : main
    Created on : 4-Aug-2015, 5:55:12 PM
    Author     : c0653616
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Online Examination</title>
        <%@page language="java" %>
         <%@page import="java.io.*" %>
          <%@page import="java.sql.*" %>
          <%@page import="javax.servlet.*"%>
<link href="css/menuStyle.css" rel="stylesheet" type="text/css" />
          
    </head>
    <body>
        

        
<%   
HttpSession Usersession = request.getSession(false);
if(Usersession.getAttribute("username") == null)
       {
   response.sendRedirect("index.html");
      

}
else
       {
    
%>
<h2 class="Page-Heading">Online Examination</h2>  
<%
 out.println("<b>Welcome "+Usersession.getAttribute("username")+"...</b>");
 
 %>
  <div id="navigation">  
			<ul>
            	<li><a href="home.jsp">Home</a></li>
                <%
                if(Usersession.getAttribute("Privilage").toString().contains("adminUser"))
         {
     out.println("<li><a href = 'AdminConsoleHome.jsp'>Administration Console</a></li>");
 }
                %>
                <li id="active"><a href="main.jsp">Available Exams</a></li>
                <li><a href="PreviousResults.jsp">Previous Results</a></li>
                <li><a href="ContactUs.jsp">Contact Us</a></li>
                <li><a href="Logout.jsp">Logout</a></li>
		</ul>
	</div>    


    <table border="0" width="950">
        <tr>
            <td align ="center">
<h2 style="color: #4778e3;">Here is the list of exams we have chosen for You...</h2>
<br>
Select one and click on View Details to begin the test.<br><br>
<form id="ExamListForm" action="BeginTest.jsp" method="post">

    <table cellspacing="0" cellpadding="10" width="900" align="center" border="1">
<%
try
{
 Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
 Connection con=DriverManager.getConnection("jdbc:odbc:onlineexamination","","");
 Statement ps=con.createStatement();

             ResultSet rs=ps.executeQuery("Select * from Exam_List");
             String examID = "";
              while(rs.next())
            {
                  examID= rs.getString("ExamId");
%>
 <tr colspan ="2">
    <td colspan ="2">
     <input type="radio" id="examListRadio" name="examListRadio" value="<% out.print(examID); %>">
    </td>
         <td>
         <b>
             <% 
             String ExamName = rs.getString("ExamName");
             out.println(ExamName); 
             %>
         </b>
         <input type="hidden" name="Name-<% out.print(examID); %>" value="<% out.print(ExamName); %>" />
         <br>
         <% out.println(rs.getString("ExamDescription")); %>
     </td>
  </tr>
  
 <%
              }
              }
             catch(Exception e)
             {
                 out.println("Error : <br>"+e.getMessage());
                 //e.printStackTrace();
             }
              }
%>                    


<tr>
</table>

        <a href="javascript:void(0)" onClick="javascript:document.getElementById('ExamListForm').submit()"><!--Login</a>-->
    <img src="Images/View_Details.png" width="160" height="42" style="margin-top:10px; border: 0" /></a>
        </form>

            </td>
        </tr>
    </table>
<br><br>
          
       
    </body>
</html>

