<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Registration</title>
</head>
<body align="center">
<%@include file="homenavbar.jsp" %>
<h2>Customer Registration</h2>
<form action="customerregistration" method="post">
<div>
<label>User Name:</label>
<input type="text" placeholder="Enter User name" name="uname" required="required"/><br><br>
<label>Email:</label>
<input type="email" placeholder="Enter email id" name="email" required="required"/><br><br>
<label>Password:</label>
<input type="password" placeholder="Enter Password" name="password" required="required"/><br><br>
<label>Location:</label>
<input type="text" placeholder="Enter Your Location" name="location" required="required"/><br><br>
<label>Contact:</label>
<input type="text" placeholder="Enter Contact number" name="contact" required="required"/><br><br>
<button type="submit" >Register</button>&nbsp;&nbsp;
<button type="reset" >Clear</button>&nbsp;&nbsp;
<p>if you already a user?<a href="customerlogin.jsp"> login here</a></p>
</div>
</form>
</body>
</html>