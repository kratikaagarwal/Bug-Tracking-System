<!DOCTYPE html>
<html>
<head>
	<title>Sign Up</title>
	<link rel="icon"  type="image/png" href="images/bug.png">
	<style type="text/css">
				body{
	background:url('images/background.jpg');
	position: relative;
}
.container{
	position: absolute;
top:80px;
left:25%;
width:50%;
	overflow: hidden;
	background-color: #aec1e6;
	padding: 30px;
}
#image{margin-left: 40%;
}
.box{
	border-radius: 1em;
	background:#19448a;
color:#fff;
	min-width:50%;
	margin:0 10%;
	position: relative;

}
.box h4{
background:#aaa2f5;
	
	color:#181063;
	font-size: 20px;
	
	text-align: center;
	padding: 10px;

	border-radius: .6em 0.6em 0em 0em;
}
.box1{
	padding: 10px;
	text-align: center;
	font-size: 20px;
}
select{
	background:#c9cff2;
	text-align: center;
	color:#181063;
}

.myform input[type="text"],input[type="password"],input[type="email"]{
	margin:3%;
	border:none;
	background:none;
	border-bottom: 1px #fff solid;
	color:#fff;
	font-size: 16px;
	margin-right:6%;
}
.successtext{
	text-align:center;
	background-color:green;
	color:white;
	padding:0.2em;
	margin:2%;
}
.btn{
border-radius: .7em;
background:#aaa2f5;
	color:#181063;
	padding:10px 30px;
	margin:3%;
	font-size: 17px;
}
.btn:hover{
	background-color: pink;
}
a{
	text-decoration: none;
	color:#ccc;
}
a:hover{color:coral;}
</style>

</head>
<body><% 
		if("error".equals((String)request.getParameter("msg"))){
		%>
		<div class="errortext">Error</div>
        <%}
		else if ("success".equals((String)request.getParameter("msg"))){
		%>
		<div class="successtext">Account Created Successfully!You can now Login...</div>
    	<% }
%>	
<div class="container">
	
	
	<div id="image"><a href="index.html"><img src="images/home.png"></a></div>
	<div class="box">
		<h4>Sign Up</h4>
		<div class="box1">
		
		<label>Register as</label>
			<select name="logintype" id='myselection'>
				<option selected disabled>User</option>
				<option value="admin">Admin</option>
				<option value="customer">Customer</option>
				
			</select>
			
<form class="myform" id="admin" method="post" action="register.jsp" style="display:none;">
			<div><label>User Id:</label>
		<input type="text" name="userId" placeholder="user123" required></div>
		<div><label>Password:</label>
		<input type="password" name="pwd" required></div>
		<input type="hidden" name="type" value="admin" >
		<input type="submit" name="login" value="Sign Up" class="btn">
		<h3>Already Registered? Please <a href="login.html">Sign In here..</a></h3>
		</form>
<form class="myform" id="customer" method="post" action="register.jsp" style="display:none;">
			<div><label>User Id:</label>
		<input type="text" name="userId" placeholder="user123" required></div>
		<div><div><label>User Name:</label>
		<input type="text" name="bugusername" required></div>
		<div></div><label>Email:</label>
		<input type="email" name="buguseremail" placeholder="abc@xyz.com" required></div>
		<div><label>Password:</label>
		<input type="password" name="pwd" required></div>
		<input type="hidden" name="type" value="customer" >
		<input type="submit" name="login" value="Sign Up" class="btn">
		<h3>Already Registered? Please <a href="login.html">Sign In here..</a></h3>
		</form>		
		<h3>Already Registered? Please <a href="login.html">Sign In here..</a></h3>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
			<script type="text/javascript">
  
   $("#myselection").on("change", function() {
		    $("#" + $(this).val()).show().siblings().hide();
		})
   
</script>
</div>

	</div>


</div>
</body>
</html>