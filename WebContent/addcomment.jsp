<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Comment</title>
<link rel="icon"  type="image/png" href="images/bug.png">
</head>
<body>
  <%@page language="java"%>
	<%@page import="java.sql.*,java.io.*,java.util.*"%>
	<%@page import="javax.servlet.http.*,javax.servlet.*"%> 
	<%
	String bugid=(String)request.getParameter("bugid");
	String expertid=(String)request.getParameter("expertid");
	String expertname=(String)request.getParameter("expertname");
	String solution=(String)request.getParameter("solution");
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
	    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","admin","admin");
		PreparedStatement prestmt = con.prepareStatement("insert into solution values(?,?,?,?,?)");

		prestmt.setString(1,bugid);
	    prestmt.setString(2,expertid);
	    prestmt.setString(3,expertname);
	    prestmt.setString(4,solution);
	   
	    Calendar cal = new GregorianCalendar();
	    int year = cal.get(Calendar.YEAR);            
	    int mm = cal.get(Calendar.MONTH);           
	    int dd = cal.get(Calendar.DAY_OF_MONTH);
	    String date=dd+"/"+mm+"/"+year;
	    prestmt.setString(5,date);
	    prestmt.executeUpdate();
	    prestmt.close();
		con.close();			
		RequestDispatcher rd=request.getRequestDispatcher("bugcomment.jsp?bugid="+bugid);
		rd.forward(request, response);

	}
	catch(Exception e)
	{
		out.println(e.getMessage());
	}
	%>
</body>
</html>