<%-- 
    Document   : Logout
    Created on : 4-Aug-2015, 6:42:18 PM
    Author     : c0653616
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Online Examination</title>
        
    </head>
    <body>
         <%
            session.setAttribute("username", null);
            session.setAttribute("uid", null);
            session.invalidate();
            %>
        <h2>You have been logged out successfully</h2>
            <br/>
            <a href="index.html">Click here to login again...</a>
    </body>
</html>
