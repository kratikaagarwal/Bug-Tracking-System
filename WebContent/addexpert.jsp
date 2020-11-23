<html>
<head>
    <title>Add Expert</title>
	<link rel="stylesheet" type="text/css" href="style.css">  
	<link rel="icon"  type="image/png" href="images/bug.png">
</head>
<body>
    <%@page language="java"%>
	<%@page import="java.sql.*,java.io.*,java.util.*"%>
	<%@page import="javax.servlet.http.*,javax.servlet.*"%> 
	<%
		String name=(String)request.getParameter("expertname");
		String email=(String)request.getParameter("expertemail");
		String loginid=(String)request.getParameter("expertid");
		String password=(String)request.getParameter("expertpw");
		String repassword=(String)request.getParameter("expertrpw");
		String type=(String)request.getParameter("type");
		if(!(password.equals(repassword))){
	            RequestDispatcher rd=request.getRequestDispatcher("addexpert1.jsp?msg=error");
				rd.forward(request, response);}
		else{
		try{
		    Class.forName("oracle.jdbc.driver.OracleDriver");
		   	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","admin","admin");
		    String query = "insert into expert (expertid,expertname,password,email) values(?,?,?,?)" ;
		    PreparedStatement stmt = con.prepareStatement(query);
		    stmt.setString(1,loginid);
		    stmt.setString(2,name);
		    stmt.setString(3,password);
		    stmt.setString(4,email);
            stmt.executeUpdate();			    
           	query = "insert into user_details values(?,?,?)" ;
            stmt = con.prepareStatement(query);
            stmt.setString(1,loginid);
            stmt.setString(2,password);
            stmt.setString(3,type);
            stmt.executeUpdate();
            stmt.close();
            con.close();
            RequestDispatcher rd=request.getRequestDispatcher("addexpert1.jsp?msg=success");
			rd.forward(request, response);
			
			}
		catch(Exception e){
			out.println(e.getMessage());
		}
		
		}
	%>
</body>
</html>