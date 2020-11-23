<html>
<head>
	<title>Configure Expert</title>
	<link rel="stylesheet" type="text/css" href="mystyl.css">
	<link rel="icon" type="image/png" href="images/bug.png">
</head>
<body>
  <%@page import="java.sql.*,java.sql.DriverManager,java.io.*,java.util.*"%>
	<%@page import="javax.servlet.http.*,javax.servlet.*"%>  

<% String productid=(String)request.getParameter("productid");
		String expertid=(String)request.getParameter("expertid");
		try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","admin","admin");
		Statement stmt = con.createStatement();
		String query = "update expert set productid='"+productid+"'where expertid='"+expertid+"'";
	    stmt.executeUpdate(query);
		RequestDispatcher rd=request.getRequestDispatcher("configureexpert.jsp?msg=success");
		rd.forward(request, response);
	}catch(Exception e){
		RequestDispatcher rd=request.getRequestDispatcher("configureexpert.jsp?msg=error");
		rd.forward(request,response);
	}	
%>

</body>
	</html>