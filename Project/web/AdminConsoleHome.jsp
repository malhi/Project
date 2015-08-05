<%-- 
    Document   : AdminConsoleHome
    Created on : 4-Aug-2015, 6:27:13 PM
    Author     : c0653616
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <title>Administration Console - Online Examination</title>
        <link href="css/menuStyle.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
              
<%   
HttpSession Usersession = request.getSession(false);
if(Usersession.getAttribute("Username") == null || Usersession.getAttribute("Privilage") == null || !(Usersession.getAttribute("Privilage").toString().contains("adminUser")))
       {
   response.sendRedirect("index.html");
      

}
else
       {
    %>
    <h2 class="Page-Heading">Online Examination Portal</h2>  
    <%
    out.println("<b>Welcome "+Usersession.getAttribute("Username")+"...</b>");
%>
<div id="navigation">
			<ul>
            	<li><a href="home.jsp">Home</a></li>
                <%
                if(Usersession.getAttribute("Privilage").toString().contains("adminUser"))
         {
     out.println("<li id='active'><a href = 'AdminConsoleHome.jsp'>Administration Console</a></li>");
 }
                %>
                <li><a href="main.jsp">Available Exams</a></li>
                <li><a href="PreviousResults.jsp">Previous Results</a></li>
                <li><a href="ContactUs.jsp">Contact Us</a></li>
                <li><a href="Logout.jsp">Logout</a></li>
		</ul>
	</div>    

                <table border="0" width="950">
                    <tr>
                        <td align ="center">
                    <h1 style="color: #4778e3">Administration Console</h1>
    <br>
    <table cellpadding ="15" border="0">
        <tr>
            <td> 
                <a href="AddNewExam.jsp">
                    <img src="images/Add-Exam.png" width="160" height="42" style="margin-top:5px; margin-bottom: 5px" />
                </a>
            </td>
        </tr>
        <tr>
            <td>
                <a href="AdminRemoveExam.jsp">
                    <img src="images/Remove-Exam.png" width="160" height="42" style="margin-top:5px;  margin-bottom: 5px" />
                </a>
            </td>
        </tr>
        <tr>
            <td>
                <a href="AdminRemoveUser.jsp">
                    <img src="images/Remove-User.png" width="160" height="42" style="margin-top:5px;  margin-bottom: 5px" />
                </a>
            </td>
        </tr>
        <tr>
            <td>
                <a href="AdminChangeUserPrivileges.jsp">
                    <img src="images/User-Privilages.png" width="160" height="42" style="margin-top:5px;  margin-bottom: 5px" />
                </a>
            </td>
        </tr>
</table>
                        </td>
                    </tr>
                </table>
    <%
   }
%>      
    </body>
</html>

