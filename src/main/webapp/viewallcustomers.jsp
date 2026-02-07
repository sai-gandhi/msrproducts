<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOME</title>
</head>
<body>
<a href="adminhome">Back</a><br>
Total Customers:<c:out value="${count }"></c:out>

<h3 align="center">View All Customers</h3>
<table align="center" border="2" class="table table-stripped">
<tr>
<th>Id</th>
<th>Name</th>
<th>Email</th>
<th> Password</th>
<th>Location</th>
<th>Contact</th>

</tr>
<c:forEach items="${customerlist}" var="customer">
<tr>
<td><c:out value="${customer.id }"></c:out></td>
<td><c:out value="${customer.name }"></c:out></td>
<td><c:out value="${customer.email }"></c:out></td>
<td><c:out value="${customer.password }"></c:out></td>
<td><c:out value="${customer.location }"></c:out></td>
<td><c:out value="${customer.contact }"></c:out></td>



</tr>
</c:forEach>
</table>
</body>
</html>