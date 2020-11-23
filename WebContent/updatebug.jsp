<html>
<head>
	<title>Update Bug Details</title>
	<link rel="stylesheet" type="text/css" href="style.css"> 
	<link rel="icon"  type="image/png" href="images/bug.png">
    <style>
		.value1{
    		background-color: #bcd9eb;
  			padding:0 15px;}
		.value{background-color: #bcd9eb;
				border:none;
				padding:8px 25px;}
		.submitbtn{
		position:relative;
		left:13.5em;
		padding:0.5em 2em;}
	</style>
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
				int bugID=Integer.parseInt(request.getParameter("bugid"));
				while(rs.next())
		{String productid=rs.getString("productid");%>
	<form action="updatebugmain.jsp?bugid=<%=bugID%>" method="post">
		<table border="1" align="center" cellpadding="4" cellspacing="6" width="80%" >
    		<tr style="background-color:blue;color:#fff;">
        		<td colspan="4" align="center">Update Bug Details</td>
    		</tr> 
  			<tr>
  				<td class="key">Bug Id:</td>
        		<td class="value1"><%=rs.getInt("bugid")%></td>
       			<td class="key">Author:</td>
         		<td class="value"><%=rs.getString("username")%></td>
   			</tr>
    		<tr>
    		<td class="key">Product Name:</td>
     		<td class="value"> <%=rs.getString("productname")%></td>
        	<td class="key">Priority:</td>
    		<td >
    		<select name="priority" class="value">
    		<option value="<%=rs.getString("priority")%>" selected><%=rs.getString("priority")%></option>
    		<option value="low">Low</option>
    		<option value="medium">Medium</option>
    		<option value="high">High</option>
    		</select>
    		
    		</td>
 			</tr>
      		<tr>
      			<td class="key">Environment:</td>
        		<td class="value"><%=rs.getString("env")%></td>
        		<td class="key">Type:</td>
        		<td class="value"><%=rs.getString("type")%></td>
        	</tr>
   		
     	<tr>
     			<td class="key">Description:</td>
    			<td colspan="3" style="padding-top:2%;padding-bottom:4%;" class="value" >
    			<%=rs.getString("description")%></td>
    		</tr>
    			<tr>
   				<td class="key">Status:</td>
   				<td><select name="status" class="value">
    		<option value="<%=rs.getString("status")%>" selected><%=rs.getString("status")%></option>
    		<option value="assigned">Assigned</option>
    		<option value="fixed">Fixed</option>
    		<option value="closed">Closed</option>
    		</select>
     	</td>
    			<td class="key">Responsible:</td>
    			<td><select name="assignto" class="value">
    			<option value="<%=rs.getString("assignto")%>" selected><%=rs.getString("assignto")%></option>
    			
        		<%ResultSet rs1 = stmt.executeQuery("select expertname from expert where productid='"+productid+"'");
			while(rs1.next())
		        {
		            String expertname=rs1.getString("expertname");%>
		            <option value='<%= expertname%>'><%= expertname%></option>		
			<% }rs1.close();
        		%>
        		</select>
        		</td>
        		
    		</tr>
      		
    		
			<tr colspan="3">
    			<td><input type="submit" value="Update" class="submitbtn"></td>
    		</tr>

			<%
			
		}
				rs.close();
				stmt.close();
   				con.close(); }
				catch(Exception e)
				{out.println(e);}%>
		</table>
	</form>
	<div id="back">
		<a href="viewbug.jsp">Back</a>
	</div>
</section>
</div>
</body>
</html>