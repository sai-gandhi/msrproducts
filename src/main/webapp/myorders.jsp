<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Orders</title>
    <style>
        .order-card {
            border: 1px solid #ddd;
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 5px;
        }
        .status-pending { color: orange; }
        .status-approved { color: green; }
        .status-rejected { color: red; }
    </style>
</head>
<body>
    <h1>My Orders</h1>
    
    <c:forEach items="${orders}" var="order">
        <div class="order-card">
            <h3>Order #${order.order_id}</h3>
            <p>Date: ${order.order_date}</p>
            <p>Total: ₹${order.total_amount}</p>
            <p>Status: <span class="status-${order.status}">${order.status}</span></p>
            
            <h4>Items:</h4>
            <ul>
                <c:forEach items="${order.items}" var="item">
                    <li>${item.product.name} - ${item.quantity} x ₹${item.unit_price} = ₹${item.quantity * item.unit_price}</li>
                </c:forEach>
            </ul>
        </div>
    </c:forEach>
</body>
</html>