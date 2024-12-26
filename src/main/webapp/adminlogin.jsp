<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
.note{
color:red;
}
</style>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>
</head>
<body align="center">
<%@include file="homenavbar.jsp" %>
<form method="post" action="checkadminlogin">
<div>
<h2>Admin Login</h2>
<label>User Name:</label>
<input type="text" placeholder="Enter user name" name="name" required="required"/><br><br>
<label>Password:</label>
<input type="password" placeholder="Enter Password" name="password" required="required"/><br><br>
<input type="submit" value="Login"/>&nbsp;&nbsp;
<input type="reset" value="clear"/>&nbsp;&nbsp;
<div class="note">
<p>Note: Only admin can login here</p>
</div>
</div>
</form>
</body>
</html>