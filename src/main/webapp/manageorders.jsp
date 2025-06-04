<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Orders</title>
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
        .action-form {
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <h1>Manage Orders</h1>
    
    <h2>Pending Orders</h2>
    <c:forEach items="${pendingOrders}" var="order">
        <div class="order-card">
            <h3>Order #${order.order_id} - ${order.customer.name}</h3>
            <p>Contact: ${order.customer.contact}</p>
            <p>Date: ${order.order_date}</p>
            <p>Total: ₹${order.total_amount}</p>
            <p>Status: <span class="status-${order.status}">${order.status}</span></p>
            
            <h4>Items:</h4>
            <ul>
                <c:forEach items="${order.items}" var="item">
                    <li>${item.product.name} - ${item.quantity} x ₹${item.unit_price} = ₹${item.quantity * item.unit_price}</li>
                </c:forEach>
            </ul>
            
            <div class="action-form">
                <form action="updateorderstatus" method="post">
                    <input type="hidden" name="orderId" value="${order.order_id}">
                    <input type="hidden" name="status" value="approved">
                    <button type="submit">Approve</button>
                </form>
                
                <form action="updateorderstatus" method="post">
                    <input type="hidden" name="orderId" value="${order.order_id}">
                    <input type="hidden" name="status" value="rejected">
                    <label>Reason for rejection:</label>
                    <input type="text" name="message" required>
                    <button type="submit">Reject</button>
                </form>
            </div>
        </div>
    </c:forEach>
    
    <h2>Processed Orders</h2>
    <c:forEach items="${processedOrders}" var="order">
        <div class="order-card">
            <h3>Order #${order.order_id} - ${order.customer.name}</h3>
            <p>Contact: ${order.customer.contact}</p> 
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