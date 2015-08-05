<%-- 
    Document   : home
    Created on : 4-Aug-2015, 6:49:56 PM
    Author     : c0653616
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home - Online Examination Portal</title>
        <link href="css/menuStyle.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
      <%   
HttpSession Usersession = request.getSession(false);
if(Usersession.getAttribute("Username") == null || Usersession.getAttribute("Privilage") == null)
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
            	<li id="active"><a href="home.jsp">Home</a></li>
                <%
                if(Usersession.getAttribute("Privilage").toString().contains("adminUser"))
         {
     out.println("<li><a href = 'AdminConsoleHome.jsp'>Administration Console</a></li>");
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
                        <td>
                            
              
 <h4 style="color: #4778e3"><font size="5"><b> Assessments</b></font></h4>

<p>On the online examination portal, we provide students and teachers with a collaborative environment to 
   conduct knowledge assessment tests that are quality assured by a dedicated moderating committee. The 
   environment also provides provisions for creating custom examinations by authorized users.</p>
  
                        </td>
                    </tr>
                </table>
                  <%
   }
%>      
    </body>
</html>

