<html>
<head>
  <title>Bug Details</title>
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
			<h1>Bug Details</h1>
			<a href="index.html"><img src="images/home.png"></a>
			<a href="logout.jsp"><img src="images/logout.png"></a>
		</header>
		<section id="main">
  	<%
    	try{
    		Class.forName("oracle.jdbc.driver.OracleDriver");
   			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","admin","admin");
    		Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery("Select * from bug where bugid='"+request.getParameter("bugid")+"'");
			while(rs.next())
			{%>
			<table border="1" align="center" cellpadding="4" cellspacing="6" width="80%" >
    			<tr style="background-color:blue;color:#fff;">
        			<td colspan="4" align="center">Your Bug Detail</td>
    			</tr> 
   				<tr>
   					<td class="key">Bug Id:</td>
       				<td class="value"><%=rs.getInt("bugid")%></td>
        			<td class="key">Author:</td>
        			<td class="value"><%=rs.getString("username")%></td>
   				</tr>
    			<tr >
    				<td class="key">Product Name:</td>
        			<td class="value" colspan="3"><%=rs.getString("productname")%></td>
   				</tr>
     			<tr>
     				<td class="key">Environment:</td>
        			<td class="value"><%=rs.getString("env")%></td>
        			<td class="key">Type:</td>
        			<td class="value"><%=rs.getString("type")%></td>
    			</tr>
    			<tr >
    				<td class="key">Description:</td>
        			<td class="value" colspan="3"><%=rs.getString("description")%></td>
   				</tr>
    			<tr >
    				<td class="key">Priority:</td>
        			<td class="value" colspan="3"><%=rs.getString("priority")%></td>
   				</tr>
     			<tr>
     				<td class="key">Status:</td>
        			<td class="value"><%=rs.getString("status")%></td>
        			<td class="key">Responsible:</td>
        			<td class="value"><%=rs.getString("assignto")%></td>
    			</tr>
     
     <%}rs.close();
		stmt.close();
   		con.close();
   	}
		catch(Exception e)
		{out.println(e);}%>
		
	</table>
	
	<table border="1" align="center" cellpadding="4" cellspacing="6" width="80%" >
    	<tr style="background-color:blue;color:#fff;">
       	 	<td colspan="2" align="center">Audit Trail</td>
    	</tr>
    	<tr >
        	<td class="key">Expert</td>
        	<td class="key">Comments</td>
    	</tr>
   	<%
 	try{
    	Class.forName("oracle.jdbc.driver.OracleDriver");
   		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","admin","admin");
    	Statement stmt=con.createStatement();
    	ResultSet rs=stmt.executeQuery("Select * from solution where bugid='"+request.getParameter("bugid")+"'");
		while(rs.next())
		{%>
			<tr>
    			<td class="value" style="text-align:center;"><%=rs.getString("expertname")%></td>
    			<td class="value"><%=rs.getString("solution")%></td>
			</tr>
		<%}
   		con.close(); }
		catch(Exception e){
		out.println(e);}
		%>

	</table>
	<div id="back">
		<a href="viewbug.jsp">Back</a>
	</div>
	</section>
	</div>
</body>
</html>