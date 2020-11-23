<html>
<head>
 	<title>Delete Bug</title>
	<link rel="stylesheet" type="text/css" href="style.css">   
	<link rel="icon"  type="image/png" href="images/bug.png">
</head>
<body>
    <%@page language="java"%>
	<%@page import="java.sql.*,java.io.*,java.util.*"%>
	<%@page import="javax.servlet.http.*,javax.servlet.*"%> 
	<div class="container">
		<header id="mainheader">
			<div></div>
			<h1>Bug Deletion</h1>
			<a href="index.html"><img src="images/home.png"></a>
			<a href="logout.jsp"><img src="images/logout.png"></a>
		</header>
		<section id="main">
   		<%
    		try{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","admin","admin");
				Statement stmt=con.createStatement();
				stmt.executeUpdate("Delete from bug where bugid='"+request.getParameter("bugid")+"'");
		%>
		<h1>Bug deleted successfully</h1>
		<%
   			con.close(); }
			catch(Exception e)
			{out.println(e);}
		%>
		<div id="back"><a href="viewbug.jsp">Back</a>
		</div>
		</section>
	</div>
</body>
</html>