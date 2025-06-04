<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Confirmation</title>
</head>
<body>
    <h1>Order Confirmation</h1>
    <p>${message}</p>
    <p>Order ID: ${order.order_id}</p>
    <p>Order Date: ${order.order_date}</p>
    <p>Total Amount: ₹${order.total_amount}</p>
    <p>Status: ${order.status}</p>
    <a href="myorders">View My Orders</a>
</body>
</html>