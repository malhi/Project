<%-- 
    Document   : AdminRemoveExam
    Created on : 4-Aug-2015, 6:28:42 PM
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
        <title>Online Examination</title>
    <link href="css.menuStyle.css" rel="stylesheet" type="text/css" />
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
                            
                            <form action="RemoveExam" method="post">
      <form action="RemoveExamination" id="RemoveExamForm" method="post">

        <h2>Active Exam Directory</h2>
        Please select an exam below and click Remove to clear Examination Data<br/><br/> 
         <table cellspacing="0" cellpadding="15" border="1" width="600" >
             <th>
             
             <td><b>Exam ID</b></td>
             <td><b>Exam Name</b></td>
             </th>
           <%
           
           Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
             Connection con=DriverManager.getConnection("jdbc:odbc:onlineexamination","","");
             Statement ps=con.createStatement();

             ResultSet rs=ps.executeQuery("Select * from exam_list"); 
             int ExamId;


           while(rs.next())
            {
           ExamId = rs.getInt("ExamId");
%>
     

                  <tr> <td>
                          <input type="radio" id="ExamIdToRemoveRadio" name="r1" value="<% out.print(ExamId); %>">

 </td>
                          


                        <td><b><% out.println(ExamId); %></b><br>
                      <td><% out.println(rs.getString("ExamName")); %><br>
                       </td>
                       </tr>
                     


<%
           }
%>

         </table>
          
<br>
<!--<i id="err"></i> -->
<a href="javascript:void(0)" onclick="javascript:document.getElementById('RemoveExamForm').submit()">
    <img src="Images/Remove-Exam.png" style="margin-top:5px;margin-bottom: 5px"/></a>

    
   <!--  <a href="javascript:removeUser()">
         <img src="images/Remove.PNG" width="100" height="40" style="margin-top:5px;margin-bottom: 5px"/>
         </a>-->
          <a href="AdminConsoleHome.jsp">
         <img src="Images/Cancel-Exam-Registration-btn.png" style="margin-top:5px;margin-bottom: 5px"/></a>
               
        </form>

                            
                             </td>
                    </tr>
                </table>
    <%
   }
%>      
    </body>
</html>

