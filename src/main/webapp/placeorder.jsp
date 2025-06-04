<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Place Order</title>
    <style>
        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
            padding: 20px;
        }
        .product-card {
            border: 1px solid #ddd;
            padding: 15px;
            border-radius: 5px;
        }
        .quantity-control {
            display: flex;
            align-items: center;
            margin-top: 10px;
        }
        .quantity-input {
            width: 60px;
            text-align: center;
            margin: 0 10px;
        }
        .error {
            color: red;
            padding: 10px;
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
                    
                    <p>Price: ₹${product.cost}</p>
                    <p>Available: ${product.productcount} units</p>
                    <div class="quantity-control">
                        <button type="button" onclick="decreaseQuantity(${product.id})">-</button>
                        <input type="number" name="quantities" id="quantity-${product.id}" 
                               class="quantity-input" value="0" min="0" max="${product.productcount}">
                        <button type="button" onclick="increaseQuantity(${product.id})">+</button>
                    </div>
                    <input type="hidden" name="productIds" value="${product.id}">
                </div>
            </c:forEach>
        </div>
        <button type="submit">Place Order</button>
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