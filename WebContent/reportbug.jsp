<!DOCTYPE html>
<html>
<head>
    <title>Report Bugs</title>
	<link rel="stylesheet" type="text/css" href="style.css">
	<link rel="icon"  type="image/png" href="images/bug.png">
	<style>
	.heading{
		width:50%;
		left:0%;
		}
		.inputtext{
	margin-left:0%;
	}
	.successtext{
	margin:2%;
	margin-left:0%;
	width:50%;
	}
	</style>
</head>
<body><%!String user=""; %>
<%@page language="java"%>
<%@page import="java.sql.*,java.io.*,java.util.*"%>
<%@page import="javax.servlet.http.*,javax.servlet.*"%>  
<div class="container">
		<header id="mainheader">
			<div></div>
			<h1 >Report Bugs</h1>
			<a href="index.html"><img src="images/home.png"></a>
			<a href="logout.jsp"><img src="images/logout.png"></a>
		</header>
		<section id="main">
	<form action="reportbug1.jsp" method="post" class="myform">
			<p class="heading">Reporting New Bugs</p>
<% 
		if("error".equals((String)request.getParameter("msg"))){
		%>
		<div class="errortext">Error</div>
        <%}
		else if ("success".equals((String)request.getParameter("msg"))){
		%>
		<div class="successtext">Bug Added Successfully!</div>
    	<% }
%>

<% try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
		    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","admin","admin");
		   	
		   	String query = "select * from buguser where userid='"+((String)session.getAttribute("user_name"))+"'";
            Statement stmt1 = con.createStatement();
            ResultSet rs1=stmt1.executeQuery(query);
            if(rs1.next())
                {user=rs1.getString("username");  }
            Statement stmt = con.createStatement();
		   	ResultSet rs = stmt.executeQuery("select * from product");%>
		   	<label for="productid">Product: </label>
		   	<select name="productid" class="value">
		   	<option value="0" selected disabled>Product</option>
			<%
			while(rs.next()){
			%>
			<option value='<%=rs.getString("productid")%>'><%=rs.getString("productname")%>
			</option>
			<%
			}
		   	rs.close();
           	stmt.close();
           	rs1.close();
           	stmt1.close();
           %>
		 </select><br><br>
		<% }
           catch(Exception e){}%>
         
							
				<label for="env">Environment: </label>
				<select name="env" class="value">
				<option value="0" selected disabled>Environment</option>
		  <option value="Windows XP">Windows XP</option>
		  <option value="Windows 2000">Windows 2000</option>
		  <option value="Solaris">Solaris</option>
		  <option value="Linux">Linux</option>
		  </select><br><br>
		  <label for="type">Type:</label>
		  <select name="type" class="value">
		  <option value="0" selected disabled>Type</option>
		  <option value="GUI">GUI</option>
		  <option value="Server">Server</option>
		  <option value="Database">Database</option>
		  <option value="Network">Network</option>
		  </select><br><br>
		  Description:<br><br>
		  <textarea cols="40" rows="6" class="inputtext" name="description"></textarea><br>
		    <input type="hidden" name="userid" value="<%=(String)session.getAttribute("user_name")%>" />
  		  <input type="hidden" name="user" value="<%=user%>" />
		
		 <input type="submit" value="Add Bug" class="submitbtn">
			
			  
			</form>
		</section>
		<div id="back">
			<a href="customer.jsp">Back</a>
		</div>
	</div>
</body>
</html>