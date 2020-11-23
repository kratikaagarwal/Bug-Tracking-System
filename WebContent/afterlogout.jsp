<%-- 
    Document   : afterlogout
    Created on : 28 Aug, 2019, 11:23:17 AM
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
        <link rel="icon"  type="image/png" href="images/bug.png">
        <style>
        body{
	background: url('images/background.jpg');

	position: relative;
}
h1{
	text-align: center;
	padding-top: 30px;
	
	color: #0a2252;
}
.container{
	position: absolute;
top:80px;
left:20%;
width:60%;
padding: 50px;
	overflow: hidden;
	background-color: #ccc;
        }
        a{
            text-decoration: none;
            
        }
        a:hover{
            color:coral;
        }
        </style>
    </head>
    <body>
        <div class="container">
        	<img src="images/bye1.gif" style="margin-left:35%;">
            <h1>Logout successful!!  <a href="index.html">Click here</a>  to return to home</h1>
        </div>
    </body>
</html>
