
<html><head>
    </head>
    <body>
        <%@page import="java.sql.*,java.sql.DriverManager,java.io.*,java.util.*"%>
	<%@page import="javax.servlet.http.*,javax.servlet.*"%>  
<%
String s1,s2,s3,s4,s5; int s;



    s3=(String)request.getParameter("type");
    PreparedStatement stmt=null;
        
       try{
        Class.forName("oracle.jdbc.driver.OracleDriver"); 
   java.sql.Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","admin","admin");
   if(s3.equals("admin")){ 
s1=request.getParameter("userId");
   s2=request.getParameter("pwd");
   s3=request.getParameter("type");
   stmt=con.prepareStatement("insert into user_details values(?,?,?)");
    stmt.setString(2,s2);
    stmt.setString(3,s3);  
    stmt.setString(1,s1);

    
stmt.executeUpdate();


   stmt.close();}
   else if(s3.equals("customer")){
	   s1=request.getParameter("userId");
	   s2=request.getParameter("bugusername");
	   s4=request.getParameter("buguseremail");
	   s5=request.getParameter("pwd");
	stmt=con.prepareStatement("insert into user_details values(?,?,?)");
	    stmt.setString(2,s5);
	    stmt.setString(3,s3);  
	    stmt.setString(1,s1);
stmt.executeUpdate();
stmt=con.prepareStatement("insert into buguser values(?,?,?,?)");
stmt.setString(2,s2);
stmt.setString(4,s5);
stmt.setString(3,s4);  
stmt.setString(1,s1);
stmt.executeUpdate();
stmt.executeUpdate();

   }stmt.close();
        con.close();
        RequestDispatcher rd=request.getRequestDispatcher("signup.jsp?msg=success");
		rd.forward(request, response);}
      
       catch(Exception e)
       {out.println(e);
       RequestDispatcher rd=request.getRequestDispatcher("signup.jsp?msg=error");
		rd.forward(request, response);}
       
 %>
    </body></html>