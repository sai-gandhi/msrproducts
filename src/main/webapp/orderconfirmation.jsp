<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Confirmation</title>
    <!-- Modern Flipkart-like CSS -->
    <style>
        :root {
            --primary-color: #2874f0;
            --secondary-color: #fb641b;
            --success-color: #388e3c;
            --text-dark: #212121;
            --text-light: #878787;
            --bg-light: #f5f5f5;
            --white: #ffffff;
            --shadow: 0 2px 10px 0 rgba(0, 0, 0, 0.1);
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
        
        .order-details {
            max-width: 600px;
            margin: 30px auto;
            padding: 30px;
            background: var(--white);
            border-radius: 8px;
            box-shadow: var(--shadow);
            text-align: center;
        }
        
        h1 {
            color: var(--primary-color);
            margin-bottom: 20px;
            font-size: 28px;
            font-weight: 600;
        }
        
        p {
            margin: 15px 0;
            font-size: 16px;
        }
        
        strong {
            color: var(--text-dark);
            font-weight: 500;
        }
        
        a {
            display: inline-block;
            margin-top: 25px;
            padding: 12px 30px;
            background-color: var(--primary-color);
            color: white;
            text-decoration: none;
            border-radius: 4px;
            font-weight: 500;
            font-size: 16px;
            transition: all 0.3s ease;
            box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.2);
        }
        
        a:hover {
            background-color: #1a63c4;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
        }
        
        .success-message {
            color: var(--success-color);
            font-weight: 500;
            font-size: 18px;
            margin-bottom: 25px;
            padding: 10px;
            background-color: rgba(56, 142, 60, 0.1);
            border-radius: 4px;
        }
        
        @media (max-width: 768px) {
            .order-details {
                padding: 20px;
                margin: 20px 10px;
            }
            
            h1 {
                font-size: 24px;
            }
        }
        .status-of-order{
         color: red; 
        }
        .order-money{
        color:green;
        }
    </style>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
</head>
<body>
    <div class="order-details">
        <h1>Order Confirmation</h1>
        <c:if test="${not empty message}">
            <p class="success-message">${message}</p>
        </c:if>
        <p><strong>Order ID:</strong> ${order.orderId}</p>   <!-- This shows formatted ID like ORD00001 -->

        <p><strong>Order Date:</strong> ${order.order_date}</p>
        <p class="order-money"><strong>Total Amount:</strong> ₹${order.total_amount}</p>
        <p class="status-of-order"><strong>Status:</strong> ${order.status}</p>
        <a href="myorders">View My Orders</a>
    </div>
</body>
</html>