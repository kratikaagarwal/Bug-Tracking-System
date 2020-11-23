<!DOCTYPE html>
<html>
<head>
    <title>Add Expert</title>
	<link rel="stylesheet" type="text/css" href="style.css">
<link rel="icon"  type="image/png" href="images/bug.png">
</head>
<body>
<div class="container">
		<header id="mainheader">
			<div></div>
			<h1>Add Expert</h1>
			<a href="index.html"><img src="images/home.png"></a>
			<a href="logout.jsp"><img src="images/logout.png"></a>
		</header>
		<section id="main">
		<% 
		if("error".equals((String)request.getParameter("msg"))){
		%>
		<div class="errortext">Password and Re-Enter Password mismatch.</div>
        <%}
		else if ("success".equals((String)request.getParameter("msg"))){
		%>
		<div class="successtext">Expert Added Successfully!</div>
    	<% }
%>
		
			<form action="addexpert.jsp" method="post" class="myform">
				<label for="expertname">Name: </label><input type="text" name="expertname" style="margin-left:9%" required><br>
				<label for="expertemail">Email: </label><input type="text" name="expertemail" style="margin-left:9%" required><br>
				<label for="expertid">Login Id: </label><input type="text" name="expertid" style="margin-left:8%" required><br>
				<label for="expertpw">Password: </label><input type="password" name="expertpw" style="margin-left:8%" required><br>
				<label for="expertrpw">Re-enter Password: </label><input type="password" name="expertrpw" required><br>
				<input type="hidden" name="type" value="expert"/>
				<input type="submit" value="Add Expert" class="submitbtn">
			</form>
		</section>
		<div id="back">
			<a href="admin.jsp">Back</a>
		</div>
	</div>
</body>
</html>