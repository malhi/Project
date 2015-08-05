<%-- 
    Document   : checkUser
    Created on : 4-Aug-2015, 6:48:02 PM
    Author     : c0653616
--%>

<%@ page import="java.sql.*" %> 
<%
String name = request.getParameter("name").toString();
System.out.println(name);
String data ="";
String dbUrl = "jdbc:odbc:onlineexamination";
//String dbClass = "com.mysql.jdbc.Driver";
try{
           Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
               
        Connection con = DriverManager.getConnection (dbUrl,"","");
        Statement stmt = con.createStatement();
           ResultSet rs=stmt.executeQuery("select * from users where username='"+name+"'");
int count=0;
          while(rs.next())
          {

                   count++;
          }

                    if(count>0)
          {
             data="Not Available";
          }
          else
          {
                      data="Available";
          }
out.println(data);
//System.out.println(data);
}
catch (Exception e) {
System.out.println(e);
}
%>