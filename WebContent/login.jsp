<html>
<head>

<link rel="icon"  type="image/png" href="images/bug.png">
</head>
    <body>
<%@page language="java"%>
<%@page import="java.sql.*,java.io.*,java.util.*"%>
	<%@page import="javax.servlet.http.*,javax.servlet.*"%>  



<%
    int c=0;
       String  s1=request.getParameter("userId");
        String s2=request.getParameter("pwd");
            String s3=request.getParameter("logintype");
try{
    Class.forName("oracle.jdbc.driver.OracleDriver");
   Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","admin","admin");
    Statement stmt=con.createStatement();
    out.println(s1+","+s2+","+s3);
ResultSet rs=stmt.executeQuery("Select * from user_details");
while(rs.next())
{
if(s1.equals(rs.getString("username"))&&s2.equals(rs.getString("password"))&&s3.equalsIgnoreCase(rs.getString("type")))  
{session.setAttribute("user_name",s1);
    session.setAttribute("login_type", s3);
    if(s3.equalsIgnoreCase("admin"))
    response.sendRedirect("admin.jsp");
else if(s3.equalsIgnoreCase("customer"))
    response.sendRedirect("customer.jsp");
else if(s3.equalsIgnoreCase("expert"))
    response.sendRedirect("expert.jsp");
       ++c;break;}
}if(c==0)

    response.sendRedirect("loginerror.jsp");
con.close();
}
catch(Exception e)
{out.println(e);}



%>
    </body>
</html>