<html>
<head>
    <title>Configure Experts</title>
	<link rel="stylesheet" type="text/css" href="style.css">  
	<link rel="icon"  type="image/png" href="images/bug.png">
	<style>
	#mainheader h1{font-size:2.3em;
	}
	</style>
</head>
<body>
    <%@page language="java"%>
	<%@page import="java.sql.*,java.io.*,java.util.*"%>
	<%@page import="javax.servlet.http.*,javax.servlet.*"%> 
	<div class="container">
		<header id="mainheader">
			<div></div>	
			<h1>Configure Experts</h1>
			<a href="index.html"><img src="images/home.png"></a>
			<a href="logout.jsp"><img src="images/logout.png"></a>
		</header>
		<section id="main">
		<form action="configureexpert1.jsp" method="post" name="myform">
			<table>
		<%
			if("success".equals((String)request.getParameter("msg"))){
		%>
		<tr>
			<td class="successtext">Expert Configured Successfully!</td>
		</tr>
		<%}
		
			else if("error".equals((String)request.getParameter("msg"))){
		%>
		
		<tr>
			<td colspan=2 class="errortext">Expert already configured for this Product.</td>
		</tr>
		
		
		<%}
		
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","admin","admin");
			Statement stmt = con.createStatement();
		%><tr>
        <td colspan="3" bgcolor="#F2F2F2" height="25" ><b>Configuring Experts for Software Teams.</b> </td>
      </tr>
      <tr>
		<td><h2>Product</h2></td>
		<td><select name="productid" class="value">
		<% 
			String query = "select * from product";
			ResultSet rs = stmt.executeQuery(query);
			while(rs.next()){
		%>
		<option value="<%=rs.getString("productid")%>">
			<%=rs.getString("productname")%>-<%=rs.getString("version")%>
	    </option>
		<% }
		rs.close();
		%>
		
		</select>
		</td>
		</tr>
		<tr>	
		<td><h2>Technical Expert</h2></td>
		<td><select name="expertid" class="value">
		<% 
			query = "select * from Expert";
			rs = stmt.executeQuery(query);
			while(rs.next()){
		%>
		<option value="<%=rs.getString("expertid")%>"><%=rs.getString("expertname")%></option>
		<% }
			rs.close();
			con.close();
		%>
		</select></td></tr>	
		<tr>
        <td colspan="3" align="center" height="25"><input type="submit" class="submitbtn" name="Submit" value="Submit"/></td>
        </tr>
		
		</table>
		</form>
	</section>
	<div  id="back">
		<a href="admin.jsp">Back</a>
	</div>
	</div>
</body>
</html>