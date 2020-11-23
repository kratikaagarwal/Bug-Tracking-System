<html>
<head>
    <title>Report Bug</title>
	<link rel="stylesheet" type="text/css" href="style.css"> 
<link rel="icon"  type="image/png" href="images/bug.png">
</head>
<body>
    <%@page language="java"%>
	<%@page import="java.sql.*,java.io.*,java.util.*"%>
	<%@page import="javax.servlet.http.*,javax.servlet.*"%> 
	<%
	String productid=(String)request.getParameter("productid");
	String productname="";
	String env=(String)request.getParameter("env");
	String type=(String)request.getParameter("type");
	String description=(String)request.getParameter("description");
	String userid=(String)request.getParameter("userid");
	String user=(String)request.getParameter("user");

	if("".equals(description)){
		RequestDispatcher rd=request.getRequestDispatcher("reportbug.jsp?msg=error");
		rd.forward(request, response);
	}

		else{
		try{
		    Class.forName("oracle.jdbc.driver.OracleDriver");
		   	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","admin","admin");
		    Statement stmt = con.createStatement();
		    ResultSet rs=stmt.executeQuery("select max(bugid) from bug");	
		
           	int bugid;
			if(rs.next()){
				bugid=rs.getInt(1);//get max bug id 
			}else{
				bugid=0;
			}
			bugid++;//add 1 to bug id 
			rs.close();
			rs=stmt.executeQuery("select productname, version from product where productid='"+productid+"'");
			if(rs.next()){
				productname=rs.getString(1)+" - "+rs.getString(2);
			}
			rs.close();
			stmt.close();	
			String insertquery = "insert into bug values(?,?,?,?,?,?,?,?,?,?,?,?)" ;
			PreparedStatement prestmt = con.prepareStatement(insertquery);
			prestmt.setInt(1,bugid);
                        prestmt.setString(2,userid);
                        prestmt.setString(3,user);
                        prestmt.setString(4,productid);
                        prestmt.setString(5,productname);
                        prestmt.setString(6,env);
                        prestmt.setString(7,type);
                        prestmt.setString(8,description);	    
		    Calendar cal = new GregorianCalendar();
		    int year = cal.get(Calendar.YEAR);            
		    int mm = cal.get(Calendar.MONTH);           
		    int dd = cal.get(Calendar.DAY_OF_MONTH);
		    String date=dd+"/"+mm+"/"+year;
		    //System.out.println(date);
		    prestmt.setString(9,date);
		    prestmt.setString(10,"-");//bug priority will be set by admin
		    prestmt.setString(11,"New");
		    prestmt.setString(12,"-");//bug will be assigned to expert by admin
		    prestmt.executeUpdate();
		    prestmt.close();
			con.close();		
			RequestDispatcher rd=request.getRequestDispatcher("reportbug.jsp?msg=success");
			rd.forward(request, response);

			
			}
		catch(Exception e){
			out.println(e.getMessage());
		}
		
		}
	%>
</body>
</html>