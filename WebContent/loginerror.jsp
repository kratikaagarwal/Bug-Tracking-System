<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Error</title>
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
            <h1>Oops!! Authentication Failed.<a href="login.html">Click here </a>to try to login again...</h1>
        </div>
    </body>
</html>
