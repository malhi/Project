<%-- 
    Document   : AdminRemoveUser
    Created on : 4-Aug-2015, 6:30:38 PM
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Remove User - Administration Console</title>
        <script type="text/javascript">
            function removeUser()
            {
                out.println("inside removeUser..");
                var radioSelect = document.getElementById("User").value;
                out.println("radioSelect : "+radioSelect);
                if(radioSelect==""||radioSelect==null)
                    {
                        document.getElementById("err").innerHtml="Please Select a User before clicking Remove button...";
                        }
                        else
                            {
                                document.getElementById("RemoveUserForm").submit();
                                }
                        
                }
        </script>

    <link href="css/menuStyle.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
              
<%   
HttpSession Usersession = request.getSession(false);
if(Usersession.getAttribute("username") == null || Usersession.getAttribute("Privilage") == null || !(Usersession.getAttribute("Privilage").toString().contains("adminUser")))
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
                            
                            
                            <form action="RemoveUser" id="RemoveUserForm" method="post">

        <h1>LIST OF USERS</h1>
        <br>
         <table cellspacing="0" cellpadding="15" border="1">

           <%
           
           Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
             Connection con=DriverManager.getConnection("jdbc:odbc:onlineexamination","","");
             Statement ps=con.createStatement();

             ResultSet rs=ps.executeQuery("Select uid,username,emailid from users"); %>


       <%     while(rs.next())
            {
%>
     

                  <tr colspan ="8"> <td>
                          <input type="radio" id="User" name="r1" value="<% out.print(rs.getString("uid")); %>">

 </td>
                          


                        <td><b><% out.println(rs.getString("username")); %></b><br>
                      <td><b><% out.println(rs.getString("emailid")); %></b><br>
                       </td>
                       </tr>
                     


<%}
%>

         </table>
          
<br>
<i id="err"></i>
    <br>
     <a href="javascript:removeUser()">
         <img src="Images/Remove-User.png" width="100" height="40" style="margin-top:5px;margin-bottom: 5px"/>
         </a>
          <a href="AdminConsoleHome.jsp">
         <img src="Images/cancel-btn.PNG" width="100" height="40" style="margin-top:5px;margin-bottom: 5px"/></a>
               
        </form>

                            
                             </td>
                    </tr>
                </table>
    <%
   }
%>      
    </body>
</html>

