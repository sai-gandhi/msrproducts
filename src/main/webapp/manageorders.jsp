<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Orders</title>
    <style>
        :root {
            --primary-color: #3498db;
            --success-color: #2ecc71;
            --warning-color: #f39c12;
            --danger-color: #e74c3c;
            --dark-color: #2c3e50;
            --light-color: #ecf0f1;
            --border-color: #dfe6e9;
            --shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            --transition: all 0.3s ease;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f7fa;
            color: #333;
            line-height: 1.6;
            padding: 0;
            margin: 0;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        h1, h2, h3, h4 {
            color: var(--dark-color);
            margin-bottom: 20px;
        }

        h1 {
            font-size: 28px;
            font-weight: 600;
            padding-bottom: 10px;
            border-bottom: 2px solid var(--primary-color);
        }

        h2 {
            font-size: 22px;
            margin-top: 30px;
            color: var(--primary-color);
        }

        .order-card {
            background: white;
            border-radius: 8px;
            box-shadow: var(--shadow);
            margin-bottom: 25px;
            overflow: hidden;
            transition: var(--transition);
            border-left: 4px solid var(--warning-color);
        }

        .order-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }

        .order-card.approved {
            border-left-color: var(--success-color);
            opacity: 0.8;
        }

        .order-card.rejected {
            border-left-color: var(--danger-color);
            opacity: 0.8;
        }

        .order-header {
            padding: 20px;
            background-color: var(--light-color);
            border-bottom: 1px solid var(--border-color);
        }

        .order-body {
            padding: 20px;
        }

        .order-footer {
            padding: 15px 20px;
            background-color: #f8f9fa;
            border-top: 1px solid var(--border-color);
        }

        .status {
            display: inline-block;
            padding: 4px 10px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
            text-transform: uppercase;
        }

        .status-pending {
            background-color: rgba(243, 156, 18, 0.1);
            color: var(--warning-color);
        }

        .status-approved {
            background-color: rgba(46, 204, 113, 0.1);
            color: var(--success-color);
        }

        .status-rejected {
            background-color: rgba(231, 76, 60, 0.1);
            color: var(--danger-color);
        }

        ul {
            list-style: none;
            padding: 0;
            margin: 15px 0;
        }

        ul li {
            padding: 8px 0;
            border-bottom: 1px dashed var(--border-color);
            display: flex;
            justify-content: space-between;
        }

        ul li:last-child {
            border-bottom: none;
        }

        .action-form {
            display: flex;
            gap: 15px;
            flex-wrap: wrap;
            align-items: center;
        }

        .form-group {
            flex: 1;
            min-width: 200px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: 500;
            font-size: 14px;
        }

        input[type="text"] {
            width: 100%;
            padding: 8px 12px;
            border: 1px solid var(--border-color);
            border-radius: 4px;
            font-size: 14px;
        }

        button {
            padding: 8px 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: 500;
            transition: var(--transition);
        }

        .btn-approve {
            background-color: var(--success-color);
            color: white;
        }

        .btn-approve:hover {
            background-color: #27ae60;
        }

        .btn-reject {
            background-color: var(--danger-color);
            color: white;
        }

        .btn-reject:hover {
            background-color: #c0392b;
        }

        .customer-info {
            display: flex;
            gap: 20px;
            margin-bottom: 10px;
            flex-wrap: wrap;
        }

        .info-item {
            background-color: rgba(52, 152, 219, 0.1);
            padding: 6px 12px;
            border-radius: 4px;
            font-size: 14px;
        }

        .info-item strong {
            color: var(--primary-color);
        }

        @media (max-width: 768px) {
            .action-form {
                flex-direction: column;
                align-items: stretch;
            }
            
            .form-group {
                min-width: 100%;
            }
        }
    </style>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
</head>
<body>
    <div class="container">
        <h1>Manage Orders</h1>
        
        <h2>Pending Orders</h2>
        <c:forEach items="${pendingOrders}" var="order">
            <div class="order-card">
                <div class="order-header">
                    <h3>Order #${order.orderId}</h3>
                    <div class="customer-info">
                        <div class="info-item"><strong>Customer:</strong> ${order.customer.name}</div>
                        <div class="info-item"><strong>Contact:</strong> ${order.customer.contact}</div>
                        <div class="info-item"><strong>Date:</strong> ${order.order_date}</div>
                        <div class="info-item"><strong>Total:</strong> ₹${order.total_amount}</div>
                    </div>
                    <p>Status: <span class="status status-${order.status}">${order.status}</span></p>
                </div>
                
                <div class="order-body">
                    <h4>Order Items</h4>
                    <ul>
                        <c:forEach items="${order.items}" var="item">
                            <li>
                                <span>${item.product.name} (${item.quantity} × ₹${item.unit_price})</span>
                                <span>₹${item.quantity * item.unit_price}</span>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                
                <div class="order-footer">
                    <div class="action-form">
                        <form action="updateorderstatus" method="post" class="form-group">
                            <input type="hidden" name="orderId" value="${order.id}">
                            <input type="hidden" name="status" value="APPROVED">
                            <button type="submit" class="btn-approve">Approve Order</button>
                        </form>
                        
                        <form action="updateorderstatus" method="post" class="form-group">
                            <input type="hidden" name="orderId" value="${order.id}">
                            <input type="hidden" name="status" value="REJECTED">
                            <label>Reason for rejection:</label>
                            <input type="text" name="message" required>
                            <button type="submit" class="btn-reject">Reject Order</button>
                        </form>
                    </div>
                </div>
            </div>
        </c:forEach>
        
        <h2>Processed Orders</h2>
        <c:forEach items="${processedOrders}" var="order">
            <div class="order-card ${order.status}">
                <div class="order-header">
                    <h3>Order #${order.orderId}</h3>
                    <div class="customer-info">
                        <div class="info-item"><strong>Customer:</strong> ${order.customer.name}</div>
                        <div class="info-item"><strong>Contact:</strong> ${order.customer.contact}</div>
                        <div class="info-item"><strong>Date:</strong> ${order.order_date}</div>
                        <div class="info-item"><strong>Total:</strong> ₹${order.total_amount}</div>
                    </div>
                    <p>Status: <span class="status status-${order.status}">${order.status}</span></p>
                </div>
                
                <div class="order-body">
                    <h4>Order Items</h4>
                    <ul>
                        <c:forEach items="${order.items}" var="item">
                            <li>
                                <span>${item.product.name} (${item.quantity} × ₹${item.unit_price})</span>
                                <span>₹${item.quantity * item.unit_price}</span>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </c:forEach>
    </div>
</body>
</html>