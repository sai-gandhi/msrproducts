<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<style>
.note {
	color: red;
}

title {
	background-color: green;
}

.submitbutton {
	background-color: green;
	color: white;
}

.clearbutton {
	background-color: red;
	color: white;
}
.container{
background-position: 2em;
    background: lightgray;
    height: 100px;
    width: 100%;
   
}
</style>
<title>Customer Login</title>
</head>
<body class="login">
	<%@include file="homenavbar.jsp"%>
	<h2>Customer Login</h2>

	<form method="post" action="checkcustomerlogin">
		<div class="container" align="center">
			<label>Email:</label> <input type="text"
				placeholder="Enter your email" name="email" required="required" /><br><br>
			    <label>Password:</label> <input type="password"
				placeholder="Enter your password" name="password"
				required="required" /><br>
			<br> <input class="submitbutton" type="submit" value="Login" />&nbsp;&nbsp;
			<input class="clearbutton" type="reset" value="clear" />&nbsp;&nbsp;
			<p class="note">
				if you are new user?<a href="customerregister.jsp"> Register
					here</a>
			</p>
		</div>
	</form>

</body>
</html>