<html>
<head>
	<title>Welcome Expert</title>
	<link rel="stylesheet" type="text/css" href="mystyl.css">
	<link rel="icon"  type="image/png" href="images/bug.png">
	<style>
#mainheader a{
	margin:10px;
}
.container{
	top:80px;
	width:60%;
	left:20%;
}
.table_bug {
   border-collapse: collapse;
   border: none; 
} 
td{
    text-align: center;
}
th{
  padding: 0 20px;
}
td,th{
    border:1px solid black;
}</style>
</head>
<body>
    <%! int c=0,bugid; %>
    <%@page language="java"%>
<%@page import="java.sql.*,java.io.*,java.util.*"%>
	<%@page import="javax.servlet.http.*,javax.servlet.*"%> 
<div class="container">
	<header id="mainheader">
		<div align="right">
			<a href="index.html"><img src="images/home.png"></a>
			<a href="logout.jsp"><img src="images/logout.png"></a>
		</div>
		<h1>Welcome Expert</h1>
	</header>

	<section id="showcase">
		<ul>
			<li>This is List of all Reported Bugs assigned to you.  </li>
	        <li>Find out the possible causes, try to fix it and provide satisfactory comments.</li>
        </ul>
        <%
    
try{ c=0;
    Class.forName("oracle.jdbc.driver.OracleDriver");
   Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","admin","admin");
    Statement stmt=con.createStatement();%>
    <table border="1" class="table_bug">
 		<thead>
 			<th>Bug Id</th>
 			<th>Product</th>
 			<th>Environment</th>
 			<th>Priority</th>
 			<th>Description</th>
 			<th>Status</th>
 			<th>Add Comment</th>
 		</thead>
<%
	ResultSet rs1=stmt.executeQuery("select * from expert where expertid='"+(String)session.getAttribute("user_name")+"'");
	ResultSet rs2;
	if(rs1.next())
        {
            String expertname=rs1.getString("expertname");
            rs2 = stmt.executeQuery("select * from bug where assignto='"+rs1.getString("expertname")+"'");
			while(rs2.next()){
			bugid=rs2.getInt("bugid");
%>
     
		<tr>
			<td><%=bugid%></td>
			<td><%=rs2.getString("productname")%></td>
            <td><%=rs2.getString("env")%></td>          
            <td><%=rs2.getString("priority")%></td>
            <td><%=rs2.getString("description")%></td>
            <td><%=rs2.getString("status")%></td>
            <td><a href='bugcomment.jsp?bugid=<%=bugid%>'>Comment</a></td>
		</tr>
		
<%
		++c;}
   con.close(); }}
catch(Exception e)
{out.println(e);}%>
        </table>
        <br>
<% out.println("<b>Total bugs : </b>"+c);

%>
	
	</section>
</div>
</body>
</html>