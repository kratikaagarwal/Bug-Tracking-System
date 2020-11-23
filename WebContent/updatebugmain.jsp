<html>
<head>
    

	<title>Update Bug Details</title>
	<link rel="icon"  type="image/png" href="images/bug.png">
        <style>
		body{
	background:url('images/background.jpg');
	position: relative;	color:#0a2252;
}
#mainheader{
	display:grid;
	grid-template-columns:1fr 2fr 1fr 1fr;
}
#mainheader a{
	margin:auto;

}
#mainheader h1{
    font-size: 44px;
}
.container{
	position: absolute;
top:40px;
left:25%;
width:55%;
	overflow: hidden;
	background-color: #aec1e6;
	padding: 30px;
}

#back a{
    text-decoration: none;
    border-bottom: 1px black solid;
      border-top: 1px black solid;
      padding: 10px 18px;
     
}
#back{
    margin:30px 0;
    text-align: center;
}
table{
    border:none;
}
td{
    border:none;
}
.key{
    background-color: #d3e0e8;
    text-align: center;
    padding:0 20px;
}
.value1{
    background-color: #bcd9eb;
  
 padding:0 15px;
}
.value{background-color: #bcd9eb;
border:none;
padding:8px 25px;
}
.updatebtn{
padding:10%;
background-color:blue;
}
</style>
</head>
<body>
    <%@page language="java"%>
<%@page import="java.sql.*,java.io.*,java.util.*"%>
	<%@page import="javax.servlet.http.*,javax.servlet.*"%> 
<div class="container">
	<header id="mainheader">
	<div></div>	<h1>Bug Details</h1>
	<a href="index.html"><img src="images/home.png"></a>
<a href="logout.jsp"><img src="images/logout.png"></a>
</header>
<section id="main">
    <%
    String priority=(String)request.getParameter("priority");
  	String status=(String)request.getParameter("status");
    String assignto=(String)request.getParameter("assignto");
    try{
    Class.forName("oracle.jdbc.driver.OracleDriver");
   Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","admin","admin");
    Statement stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery("Select * from bug where bugid='"+request.getParameter("bugid")+"'");
    while(rs.next()){
    if(priority.equals(""))
    	priority=rs.getString("priority");
    if(status.equals(""))
    	status+=rs.getString("status");
    if(assignto.equals(""))
    	assignto+=rs.getString("assignto");}
   
    String query = "Update bug set priority='"+priority+"', status='"+status+"', assignto='"+assignto+"' where bugid='"+request.getParameter("bugid")+"'";
   
    stmt.executeUpdate(query);
   con.close();
   stmt.close();
   rs.close();}
catch(Exception e)
{out.println(e);}
%>  
<%
int bugID=Integer.parseInt(request.getParameter("bugid"));
try{
    Class.forName("oracle.jdbc.driver.OracleDriver");
   Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","admin","admin");
    Statement stmt=con.createStatement();
    
ResultSet rs=stmt.executeQuery("Select * from bug where bugid='"+request.getParameter("bugid")+"'");
while(rs.next())
{%>
<table border="1" align="center" cellpadding="4" cellspacing="6" width="80%" >
    <tr style="background-color:green;color:#fff;">
        <td colspan="4" align="center">Bug Details Updated Successfully!!</td>
    </tr> 
   <tr><td class="key">Bug Id:</td>
        <td class="value1"><%=rs.getInt("bugid")%></td>
        <td class="key">Author:</td>
         <td class="value"><%=rs.getString("username")%></td>
        
    </tr>
    <tr ><td class="key">Product Name:</td>
     <td class="value"> <%=rs.getString("productname")%></td>
        <td class="key">Priority:</td>
    <td class="value"><%=rs.getString("priority")%></td>
       
    </tr>
     <tr><td class="key">Environment:</td>
        <td class="value"><%=rs.getString("env")%></td>
        <td class="key">Type:</td>
        <td class="value"><%=rs.getString("type")%></td>
        </tr>
   <tr>
   <td class="key">Status:</td>
     <td class="value" ><%=rs.getString("status")%></td>
    <td class="key">Responsible:</td>
        <td class="value"><%=rs.getString("assignto")%></td>
    </tr>
     <tr >
     <td class="key">Description:</td>
    <td colspan="3" style="padding-top:2%;padding-bottom:4%;" class="value" ><%=rs.getString("description")%></td>
    </tr>

<%}rs.close();
stmt.close();
   con.close(); }
catch(Exception e)
{out.println(e);}%></table>


<div  id="back"><a href="viewbug.jsp">Back</a><div>
</section>


</div></body>
	</html>