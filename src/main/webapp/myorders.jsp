<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Orders</title>
    <!-- Modern E-commerce CSS -->
    <style>
        :root {
            --primary-color: #2874f0;
            --secondary-color: #fb641b;
            --success-color: #388e3c;
            --warning-color: #ff9f00;
            --error-color: #e53935;
            --text-dark: #212121;
            --text-light: #878787;
            --bg-light: #f5f5f5;
            --white: #ffffff;
            --card-shadow: 0 2px 10px 0 rgba(0, 0, 0, 0.1);
            --hover-shadow: 0 4px 12px 0 rgba(0, 0, 0, 0.15);
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Roboto', Arial, sans-serif;
        }
        
        body {
            background-color: var(--bg-light);
            color: var(--text-dark);
            line-height: 1.6;
            padding: 20px;
        }
        
        h1 {
            color: var(--primary-color);
            margin: 20px 0 30px;
            text-align: center;
            font-size: 28px;
            font-weight: 600;
        }
        
        .orders-container {
            max-width: 800px;
            margin: 0 auto;
        }
        
        .order-card {
            background: var(--white);
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: var(--card-shadow);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border-left: 4px solid var(--primary-color);
        }
        
        .order-card:hover {
            transform: translateY(-3px);
            box-shadow: var(--hover-shadow);
        }
        
        .order-card h3 {
            color: var(--primary-color);
            margin-bottom: 10px;
            font-size: 18px;
            font-weight: 500;
        }
        
        .order-card p {
            margin: 8px 0;
            color: var(--text-dark);
            font-size: 15px;
        }
        
        .order-card h4 {
            margin: 15px 0 10px;
            color: var(--text-dark);
            font-size: 16px;
            font-weight: 500;
        }
        
        .order-card ul {
            list-style-type: none;
            padding-left: 0;
        }
        
        .order-card li {
            padding: 8px 0;
            border-bottom: 1px solid #eee;
            display: flex;
            justify-content: space-between;
        }
        
        .order-card li:last-child {
            border-bottom: none;
        }
        
        .status-pending { 
            color: var(--warning-color);
            font-weight: 500;
        }
        
        .status-approved { 
            color: var(--success-color);
            font-weight: 500;
        }
        
        .status-rejected { 
            color: var(--error-color);
            font-weight: 500;
        }
        
        .order-meta {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
            margin-bottom: 10px;
        }
        
        .order-meta span {
            display: flex;
            align-items: center;
        }
        
        .order-meta span::before {
            content: "•";
            margin-right: 8px;
            color: var(--text-light);
        }
        
        .total-amount {
            font-weight: 600;
            color: var(--text-dark);
        }
        
        @media (max-width: 768px) {
            body {
                padding: 15px;
            }
            
            .order-card {
                padding: 15px;
            }
            
            .order-meta {
                flex-direction: column;
                gap: 5px;
            }
        }
    </style>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;600&display=swap" rel="stylesheet">
</head>
<body>
    <h1>My Orders</h1>
    
    <div class="orders-container">
        <c:forEach items="${orders}" var="order">
            <div class="order-card">
                <h3>Order Id #${order.orderId}</h3>
			<div class="order-meta">
			    <span>Date: ${order.order_date}</span>
			    <span class="total-amount">Total: ₹${order.total_amount}</span>
			    <span>Status: <span class="status-${order.status}">${order.status}</span></span>
			</div>
			
			<h4>Items:</h4>
			<ul>
			    <c:forEach items="${order.items}" var="item">
			        <li>
			            <span>${item.product.name} (${item.quantity} × ₹${item.unit_price})</span>
			            <span>₹${item.quantity * item.unit_price}</span>
			        </li>
			    </c:forEach>
			</ul>
			<a href="generateInvoice?orderId=${order.orderId}"
   style="background:#2874f0;color:white;padding:8px 14px;border-radius:5px;text-decoration:none;">
    View PDF
</a>


			
            </div>
        </c:forEach>
    </div>
</body>
</html>