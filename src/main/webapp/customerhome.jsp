<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Home</title>
</head>

<script>
setTimeout(function() {
    alert("Your session has expired. You will be logged out.");
    window.location.href = "/logout"; // Redirect to logout
}, 1 * 60 * 1000); // 5 minutes timeout
</script>


<body>
<%@include file="customernavbar.jsp" %>

<div>

<h3>Welcome Customer</h3>
</div>



</body>
</html>