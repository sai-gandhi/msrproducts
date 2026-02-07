<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Place Order</title>

<!-- Modern E-commerce CSS -->
<style>
:root {
    --primary-color: #2874f0;
    --secondary-color: #fb641b;
    --success-color: #388e3c;
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

.error {
    color: var(--error-color);
    background-color: rgba(229, 57, 53, 0.1);
    padding: 15px;
    border-radius: 4px;
    margin: 20px auto;
    max-width: 800px;
    text-align: center;
    font-weight: 500;
    border-left: 4px solid var(--error-color);
}

form {
    max-width: 1200px;
    margin: 0 auto;
}

.product-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
    gap: 25px;
    padding: 20px 0;
}

.product-card {
    background: var(--white);
    border-radius: 8px;
    padding: 20px;
    box-shadow: var(--card-shadow);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    border-top: 4px solid var(--primary-color);
}

.product-card:hover {
    transform: translateY(-3px);
    box-shadow: var(--hover-shadow);
}

.product-card h3 {
    color: var(--text-dark);
    margin-bottom: 15px;
    font-size: 18px;
    font-weight: 500;
}

.product-card p {
    margin: 8px 0;
    color: var(--text-dark);
    font-size: 15px;
}

.price {
    font-weight: 600;
    color: var(--primary-color);
    font-size: 16px;
}

.stock {
    color: var(--text-light);
}

.quantity-control {
    display: flex;
    align-items: center;
    margin-top: 20px;
}

.quantity-control button {
    width: 32px;
    height: 32px;
    background-color: var(--primary-color);
    color: white;
    border: none;
    border-radius: 4px;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.2s;
}

.quantity-control button:hover {
    background-color: #1a63c4;
}

.quantity-input {
    width: 60px;
    height: 32px;
    text-align: center;
    margin: 0 10px;
    border: 1px solid #ddd;
    border-radius: 4px;
    font-size: 15px;
}

.submit-btn {
    display: block;
    width: 200px;
    margin: 30px auto;
    padding: 12px 20px;
    background-color: var(--secondary-color);
    color: white;
    border: none;
    border-radius: 4px;
    font-size: 16px;
    font-weight: 500;
    cursor: pointer;
    transition: all 0.3s ease;
    box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.2);
}

.submit-btn:hover {
    background-color: #e55b17;
    transform: translateY(-2px);
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
}

@media (max-width: 768px) {
    body { padding: 15px; }
    .product-grid { grid-template-columns: 1fr; gap: 15px; }
    .product-card { padding: 15px; }
}
</style>

<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;600&display=swap" rel="stylesheet">

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
                <p class="price">Price: ₹${product.cost}</p>
                <p class="stock">Available: ${product.productcount} units</p>

                <div class="quantity-control">
                    <button type="button" onclick="decreaseQuantity(${product.id})">-</button>

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
function increaseQuantity(productId) {
    const input = document.getElementById(`quantity-${productId}`);
    const max = parseInt(input.max);

    if (parseInt(input.value) < max) {
        input.value = parseInt(input.value) + 1;
    }
}

function decreaseQuantity(productId) {
    const input = document.getElementById(`quantity-${productId}`);

    if (parseInt(input.value) > 0) {
        input.value = parseInt(input.value) - 1;
    }
}
</script>

</body>
</html>
