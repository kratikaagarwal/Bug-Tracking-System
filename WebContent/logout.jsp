<%-- 
    Document   : logout
    Created on : 23 Aug, 2019, 4:20:58 PM
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
        <link rel="icon"  type="image/png" href="images/bug.png">
    </head>
    <body>
        <% 
        session.invalidate();
response.sendRedirect("afterlogout.jsp");%>
    </body>
</html>
