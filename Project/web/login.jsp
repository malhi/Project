<%-- 
    Document   : login
    Created on : 4-Aug-2015, 1:15:04 PM
    Author     : c0653616
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Online Examination</title>
        <link rel="stylesheet" href="css/style.css" type="text/css">
       
    </head>
    <body>
        <div id="header">
		<div>
			<div class="logo">
				<a href="index.html">Online Examination</a>
			</div>
			<ul id="navigation">
				<li>
					<a href="index.html">Home</a>
				</li>
				<li class="active">
					<a href="login.jsp">Login</a>
				</li>
				<li>
					<a href="register.jsp">Register</a>
				</li>
				<li>
					<a href="exam.jsp">Exam</a>
				</li>
				<li>
					<a href="result.jsp">Results</a>
				</li>
			</ul>
		</div>
	</div>
        <div id="adbox">
		<div class="clearfix">
			<img src="Images/box.jpg" alt="Img" height="342" width="368">
                        <p>
          <center><h2>User Login</h2> </center>
               <center>    <table  cellpadding="3" width="40%">
            <form name="f1" method="post" action="loginServlet">
                    <tr>
                    <td>
                        <font size="4" color="black">
                        Username
                        </font>
                    </td>
                    <td><input type="text" name="uname"/></td>
                </tr><br>
            <tr>
                <td>
                    <font size="4" color="black">
                    Password
                    </font>
                </td>
                <td><input type="password" name="upass"/></td>
            </tr><br>
                <tr>
                    <td style="text-align:center;" colspan="2">
                        <input  type="submit" value="Login" name="submit" >
                    </td>
                </tr> 		
            </form>	
                   </table> </center></p>
         </div>
        </div>
	<div id="footer" align="center">
            <h4>© 2015 All Rights Reserved</h4>
	</div>
    </body>
</html>
