<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Login</title>
</head>
<body align="center">
<%@include file="homenavbar.jsp" %>
<h2>Customer Login</h2>

<form method="post" action="checkcustomerlogin">
<div>
<label >Email:</label>
<input type="text" placeholder="Enter your email" name="email" /><br><br>
<label >Password:</label>
<input type="password" placeholder="Enter your password" name="password" /><br><br>
<input type="submit" value="Login"/>&nbsp;&nbsp;
<input type="reset" value="clear"/>&nbsp;&nbsp;
<p>if you are new user?<a href="customerregister.jsp"> Register here</a></p>
</div>
</form>

</body>
</html>