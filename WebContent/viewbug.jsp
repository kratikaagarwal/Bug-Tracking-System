<html>
<head>
    

	<title>View Bug Details</title>
	<link rel="stylesheet" type="text/css" href="style.css" />
	<link rel="icon"  type="image/png" href="images/bug.png">
        <style>
		

#mainheader a{
	margin:10px;
}
.container{
	top:80px;
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
#links a{
   text-decoration: none;
   padding:0 6px;     
}
#links{
	margin:20px 0; 
	text-align: left;}
td,th{
    border:1px solid black;
}
</style>
</head>
<body>
    <%! int c=0,bugid; %>
    <%@page language="java"%>
<%@page import="java.sql.*,java.io.*,java.util.*"%>
	<%@page import="javax.servlet.http.*,javax.servlet.*"%> 
<div class="container">
	<header id="mainheader">
	<div></div>	<h1>Bug List</h1>
	<a href="index.html"><img src="images/home.png"></a>
<a href="logout.jsp"><img src="images/logout.png"></a>
</header>
<section id="main">
   
<%
    
try{ c=0;
    Class.forName("oracle.jdbc.driver.OracleDriver");
   Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","admin","admin");
    Statement stmt=con.createStatement();
    
ResultSet rs=stmt.executeQuery("Select * from bug order by bugid");
while(rs.next())
	{bugid=rs.getInt("bugid");%>
	 <table border="1" class="table_bug">
	<thead>
		<th>Bug Id</th>
		<th>Product</th>
		<th>Environment</th>
		<th>Type</th>
		<th>Priority</th>
		<th>Description</th>
		<th>Status</th>
	</thead>
		<tr>
			<td><%=bugid%></td>
			<td><%=rs.getString("productname")%></td>
                        <td><%=rs.getString("env")%></td>
                        <td><%=rs.getString("type")%></td>
                        <td><%=rs.getString("priority")%></td>
                        <td><%=rs.getString("description")%></td>
                        <td><%=rs.getString("status")%></td>
		</tr>
               
               
              <tr><td  colspan="9" style="border:none;"> <section id="links">
                                <a href="updatebug.jsp?bugid=<%=bugid%>" style="border-right:1px black solid;">Update Bug</a>
                                <a href="delbug.jsp?bugid=<%=bugid%>" style="border-right:1px black solid;">Delete Bug</a>
                                <a href="detailbug.jsp?bugid=<%=bugid%>">Details</a></section></td></tr></table>
                    <%++c;}
   con.close(); }
catch(Exception e)
{out.println(e);}

out.println("<b>Total bugs : </b>"+c);

%>
<div id="back"><a href="admin.jsp">Back</a></div>
</section>


</div></body>
	</html>