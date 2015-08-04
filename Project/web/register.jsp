<%-- 
    Document   : register
    Created on : 4-Aug-2015, 4:14:34 PM
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
				<li>
					<a href="login.jsp">Login</a>
				</li>
				<li class="active">
					<a href="register.jsp">Register</a>
				</li>
				<li>
					<a href="E.jsp">Examination</a>
				</li>
				<li>
					<a href="result.jsp">Contact Us</a>
				</li>
			</ul>
		</div>
	</div>
        <div><br>
            <center><h2>Register Here</h2> </center>
            <center> <form  id="register_form" class="cmxform">
               
                    <tr>
                        <td> <label for="firstName"><b>Name:</b>
                <input id="name" name="name"></label></td>
                    </tr>
                     <br><br>
                    <tr>
                        <td> <label for="firstName"><b>Email:</b>
                <input id="email" name="email"></label></td>
                    </tr><br><br>
                    <tr>
                        <td><label for="firstName"><b>Password:</b>
                <input id="password" name="password"></label></td>
                </tr><br><br>
                    <tr>
                        <td> <label for="firstName"><b>Age:</b>
                <input id="age" name="age"></label></td>
                    </tr><br><br>
                    <tr>
                        <td><button id="register" type="submit"><b>Register</b</button></td>
                    </tr>
               </table></center>

</form> </center> 
            </div>  
        <br>
	<div id="footer" align="center">
            <h4>© 2015 All Rights Reserved</h4>
	</div>
    </body>
</html>
