<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Place Order</title>

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">

<style>
:root {
    --accent-1: #6366f1;
    --accent-2: #22c55e;
    --accent-3: #f97316;
    --danger: #ef4444;
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

.error {
    max-width: 900px;
    margin: 0 auto 24px;
    padding: 16px;
    border-radius: 10px;
    background: rgba(239, 68, 68, 0.15);
    color: #fecaca;
    border: 1px solid rgba(239, 68, 68, 0.4);
    text-align: center;
}

form {
    max-width: 1300px;
    margin: auto;
}

.product-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
    gap: 28px;
}

.product-card {
    background: linear-gradient(
        180deg,
        rgba(255,255,255,0.12),
        rgba(255,255,255,0.02)
    );
    backdrop-filter: var(--glass-blur);
    border: 1px solid var(--border-soft);
    border-radius: 18px;
    padding: 22px;
    transition: all 0.35s ease;
}

.product-card:hover {
    transform: translateY(-6px);
    border-color: rgba(99, 102, 241, 0.6);
}

.product-card h3 {
    font-size: 1.15rem;
    margin-bottom: 14px;
}

.price {
    font-size: 1.1rem;
    font-weight: 600;
    color: #a5b4fc;
}

.stock {
    font-size: 0.9rem;
    color: var(--text-muted);
    margin-top: 6px;
}

.quantity-control {
    display: flex;
    align-items: center;
    margin-top: 22px;
    gap: 10px;
}

.quantity-control button {
    width: 36px;
    height: 36px;
    border-radius: 10px;
    border: none;
    background: linear-gradient(135deg, var(--accent-1), #4f46e5);
    color: white;
    font-size: 18px;
    cursor: pointer;
}

.quantity-control button:hover {
    transform: scale(1.08);
}

.quantity-input {
    width: 70px;
    height: 36px;
    border-radius: 10px;
    border: 1px solid var(--border-soft);
    background: rgba(255,255,255,0.08);
    color: var(--text-main);
    text-align: center;
}

.submit-btn {
    margin: 48px auto 0;
    display: block;
    padding: 14px 46px;
    font-size: 1.05rem;
    font-weight: 500;
    border-radius: 999px;
    border: none;
    color: white;
    cursor: pointer;
    background: linear-gradient(135deg, var(--accent-3), #fb923c);
}

.submit-btn:hover {
    transform: translateY(-3px);
}
</style>

</head>
<body>

<h1>Place Your Order</h1>

<c:if test="${not empty error}">
    <div class="error">${error}</div>
</c:if>

<form action="submitorder" method="post">

    <div class="product-grid">
        <c:forEach items="${products}" var="product">
            <div class="product-card">

                <h3>${product.name}</h3>
                <p class="price">₹ ${product.cost}</p>
                <p class="stock">Available: ${product.productcount}</p>

                <div class="quantity-control">
                    <button type="button" onclick="decreaseQuantity(${product.id})">−</button>

                    <input type="number"
                           name="quantities"
                           id="quantity-${product.id}"
                           class="quantity-input"
                           value="0"
                           min="0"
                           max="${product.productcount}">

                    <button type="button" onclick="increaseQuantity(${product.id})">+</button>
                </div>

                <input type="hidden" name="productIds" value="${product.id}">
            </div>
        </c:forEach>
    </div>

    <button type="submit" class="submit-btn">Place Order</button>
</form>

<script>
function increaseQuantity(id) {
    const input = document.getElementById("quantity-" + id);
    if (parseInt(input.value) < parseInt(input.max)) {
        input.value = parseInt(input.value) + 1;
    }
}

function decreaseQuantity(id) {
    const input = document.getElementById("quantity-" + id);
    if (parseInt(input.value) > 0) {
        input.value = parseInt(input.value) - 1;
    }
}
</script>

</body>
</html>
