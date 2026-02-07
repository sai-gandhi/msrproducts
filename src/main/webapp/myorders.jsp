<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Orders</title>

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">

<style>
:root {
    --accent-1: #6366f1;   /* indigo */
    --accent-2: #22c55e;   /* green */
    --accent-3: #f97316;   /* orange */
    --danger: #ef4444;
    --warning: #facc15;

    --bg-main: #020617;
    --bg-card: rgba(255, 255, 255, 0.08);
    --border-soft: rgba(255, 255, 255, 0.15);

    --text-main: #e5e7eb;
    --text-muted: #94a3b8;

    --glass-blur: blur(14px);
}

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Inter', 'Segoe UI', sans-serif;
}

body {
    min-height: 100vh;
    background: radial-gradient(circle at top left, #1e293b, #020617);
    color: var(--text-main);
    padding: 24px;
}

h1 {
    text-align: center;
    font-size: 2.2rem;
    margin-bottom: 36px;
    font-weight: 600;
    background: linear-gradient(90deg, var(--accent-1), var(--accent-2));
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
}

.orders-container {
    max-width: 1000px;
    margin: auto;
}

.order-card {
    background: linear-gradient(
        180deg,
        rgba(255,255,255,0.12),
        rgba(255,255,255,0.03)
    );
    backdrop-filter: var(--glass-blur);
    border: 1px solid var(--border-soft);
    border-radius: 18px;
    padding: 22px;
    margin-bottom: 26px;
    transition: all 0.35s ease;
}

.order-card:hover {
    transform: translateY(-6px);
    border-color: rgba(99, 102, 241, 0.6);
}

.order-card h3 {
    font-size: 1.15rem;
    margin-bottom: 14px;
    font-weight: 500;
}

.order-meta {
    display: flex;
    flex-wrap: wrap;
    gap: 18px;
    margin-bottom: 18px;
    font-size: 0.95rem;
    color: var(--text-muted);
}

.total-amount {
    color: #a5b4fc;
    font-weight: 600;
}

/* Order Status Colors */
.status {
    font-weight: 600;
    padding: 6px 14px;
    border-radius: 999px;
    font-size: 0.85rem;
    text-transform: uppercase;
    letter-spacing: 0.4px;
}

/* APPROVED – Green */
.status-APPROVED {
    background: rgba(34, 197, 94, 0.2);
    color: #22c55e;
    border: 1px solid #22c55e;
}

/* REJECTED – Red */
.status-REJECTED {
    background: rgba(239, 68, 68, 0.2);
    color: #ef4444;
    border: 1px solid #ef4444;
}

/* PENDING – Yellow */
.status-PENDING {
    background: rgba(250, 204, 21, 0.25);
    color: #facc15;
    border: 1px solid #facc15;
}

h4 {
    margin: 16px 0 10px;
    font-size: 1rem;
    font-weight: 500;
}

ul {
    list-style: none;
}

li {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px 0;
    border-bottom: 1px solid rgba(255,255,255,0.1);
    font-size: 0.95rem;
}

li:last-child {
    border-bottom: none;
}

.item-total {
    color: #c7d2fe;
    font-weight: 500;
}

.invoice-btn {
    margin-top: 18px;
    display: inline-block;
    padding: 10px 18px;
    border-radius: 999px;
    text-decoration: none;
    font-size: 0.9rem;
    font-weight: 500;
    color: white;
    background: linear-gradient(135deg, var(--accent-1), #4f46e5);
    transition: all 0.3s ease;
}

.invoice-btn:hover {
    transform: translateY(-2px);
    box-shadow: 0 10px 25px rgba(99, 102, 241, 0.5);
}

@media (max-width: 768px) {
    h1 {
        font-size: 1.8rem;
    }

    .order-meta {
        flex-direction: column;
        gap: 8px;
    }
}
</style>

</head>
<body>

<h1>My Orders</h1>

<div class="orders-container">

    <c:forEach items="${orders}" var="order">
        <div class="order-card">

            <h3>Order #${order.orderId}</h3>

            <div class="order-meta">
                <span>Date: ${order.order_date}</span>
                <span class="total-amount">Total: ₹${order.total_amount}</span>
                <span class="status status-${order.status}">
				    ${order.status}
				</span>

            </div>

            <h4>Items</h4>
            <ul>
                <c:forEach items="${order.items}" var="item">
                    <li>
                        <span>
                            ${item.product.name}
                            (${item.quantity} × ₹${item.unit_price})
                        </span>
                        <span class="item-total">
                            ₹${item.quantity * item.unit_price}
                        </span>
                    </li>
                </c:forEach>
            </ul>

            <a class="invoice-btn"
               href="generateInvoice?orderId=${order.orderId}">
                View Invoice (PDF)
            </a>

        </div>
    </c:forEach>

</div>

</body>
</html>
