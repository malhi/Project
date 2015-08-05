<%-- 
    Document   : ContactUs
    Created on : 4-Aug-2015, 6:34:57 PM
    Author     : c0653616
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact Us - Online Examination</title>
   <link href="css/menuStyle.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
      <%   
HttpSession Usersession = request.getSession(false);
if(Usersession.getAttribute("username") == null || Usersession.getAttribute("Privilage") == null)
       {
   response.sendRedirect("index.html");
      

}
else
       {
    %>
    <h2 class="Page-Heading">Online Examination Portal</h2>  
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
                <li><a href="main.jsp">Available Exams</a></li>
                <li><a href="PreviousResults.jsp">Previous Results</a></li>
                <li id="active"><a href="ContactUs.jsp">Contact Us</a></li>
                <li><a href="Logout.jsp">Logout</a></li>
		</ul>
	</div>    

                <table border="0" width="950">
                    <tr>
                        <td>
                           
				
				<h2 class="Page-Heading" style="font-size: 34px;padding-bottom: 15px">Contact Us</h2>
                                Feel free to reach out us at any time to clear your queries at...<br/><br/>
                     
                     <b> Our Email : </b>khushi_malhi@gmail.com<br>
                     <b> Phone : </b>519-440-8765

				  <br />
				  	
					
					</p>
 
                            
                        </td>
                    </tr>
                </table>
                  <%
   }
%>      
    </body>
</html>
