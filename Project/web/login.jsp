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
        <link rel="stylesheet" href="login-box.css" type="text/css" />
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
           <img src="images/examCap.png" alt="Title Image" align="right" style="position: fixed; top: 0; left: 0"/>
    <form name="LoginForm" id="LoginForm" method="post" action="AuthenticateLogin">

<div style="padding: 100px 0 0 330px;">


<div id="login-box">

<H2>User Login</H2>
Please enter the username and password to enter the examination portal
<br />
<br />
<div id="login-box-name" style="margin-top:20px;">Username:</div><div id="login-box-field" style="margin-top:20px;">
    <input name="Username" class="form-login" title="Username" onkeydown="if (event.keyCode == 13) document.getElementById('LoginForm').submit()" value="" size="30" maxlength="2048" /></div>
<div id="login-box-name">Password:</div><div id="login-box-field">
    <input name="Password" type="password" class="form-login" onkeydown="if (event.keyCode == 13) document.getElementById('LoginForm').submit()" title="Password" value="" size="30" maxlength="2048" /></div>
<br />
<span class="login-box-options">
<!--<input type="checkbox" name="1" value="1"> Remember Me --><a href="register.jsp" style="margin-left:0px;">New User?... Register Here</a></span>
<br />
<br />
<a href="javascript:void(0)" onClick="javascript:document.getElementById('LoginForm').submit()"><!--Login</a>-->
    <img src="images/login-btn.png" width="103" height="42" style="margin-left:90px;" /></a>

</div>
 
</div>
    </form>

	<div id="footer" align="center">
            <h4>© 2015 All Rights Reserved</h4>
	</div>
    </body>
</html>
