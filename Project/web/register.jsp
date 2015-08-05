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
					<a href="Examination.jsp">Examination</a>
				</li>
				<li>
					<a href="result.jsp">Contact Us</a>
				</li>
			</ul>
		</div>
	</div>
        <div><br>
            <center><h2>Register Here</h2> </center>
            <center> <form action="signup" method="post">
                <label for="fname">First Name:</label>
                <input type="text" name="fname" style="margin-left: 50px"><br/><br/>
                <label for="lname">Last name:</label>
                <input type="text" name="lname" style="margin-left: 55px"><br><br/>
                <label for="username">Username:</label>
                <input type="text" name="username" style="margin-left: 55px"><br><br/>
                <label for="password">Password:</label>
                <input type="password" name="password" style="margin-left: 60px"><br><br/>
                <label for="cpassword">Confirm Password:</label>
                <input type="password" name="cpassword" ><br><br/>
                <label for="email">Email Id:</label>     
                <input type="email" name="email" style="margin-left: 70px"><br><br/>  
                     
                <input type="submit" value="Submit" id="submit">        
                </form><br/><br/><br/> </cenetr>
            </div>  
        <br>
	<div id="footer" align="center">
            <h4>© 2015 All Rights Reserved</h4>
	</div>
    </body>
</html>
