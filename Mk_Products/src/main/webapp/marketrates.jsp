<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Market Prices</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f5f7fa;
            color: #333;
            line-height: 1.6;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #2c3e50;
            text-align: center;
            margin-bottom: 20px;
            font-size: 28px;
            border-bottom: 2px solid #3498db;
            padding-bottom: 10px;
        }

        .back-link {
            display: inline-block;
            margin-bottom: 20px;
            color: #3498db;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s;
        }

        .back-link:hover {
            color: #2980b9;
            text-decoration: underline;
        }

        .market-notice {
            background-color: lightgreen;
            padding: 15px;
            border-left: 4px solid #ffc107;
            margin: 20px 0;
            font-size: 16px;
            color: red;
            border-radius: 0 4px 4px 0;
        }

        .market-header {
            text-align: center;
            margin: 20px 0;
        }

        .market-header h3 {
            color: #3498db;
            margin-bottom: 5px;
        }

        .market-header h4 {
            color: #e74c3c;
            margin-top: 0;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        }

        th {
            background-color: #3498db;
            color: white;
            padding: 12px;
            text-align: center;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 14px;
            letter-spacing: 0.5px;
        }

        td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #e0e0e0;
            color: #2c3e50;
        }

        tr:nth-child(even) {
            background-color: #f8f9fa;
        }

        tr {
            transition: all 0.3s ease;
            position: relative;
        }

        tr:hover {
            background-color: lightgray;
            transform: translateY(-5px);
        }

        .marquee-container {
            width: 100%;
            overflow: hidden;
            white-space: nowrap;
            padding: 10px;
            background-color: #f8f9fa;
            border-radius: 4px;
            margin-top: 30px;
        }

        .marquee-content {
            display: inline-block;
            animation: marquee 10s linear infinite;
        }

        @keyframes marquee {
            from {
                transform: translateX(50%);
            }
            to {
                transform: translateX(-50%);
            }
        }

        .product-name {
            font-weight: bold;
            color: black;
        }

        .price-high {
            color: green;
            font-weight: bold;
        }

        .price-low {
            color: red;
            font-weight: bold;
        }

        .price-avg {
            color: orange;
            font-weight: bold;
        }

        @media (max-width: 768px) {
            table {
                display: block;
                overflow-x: auto;
            }

            .marquee-content img {
                width: 120px;
                height: 80px;
            }
        }

        footer {
            margin-top: 20px;
            background-color: red;
            color: white;
            text-align: center;
            padding: 0.3px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Current Market Prices</h2>
        <a href="home.jsp" class="back-link">Back to Home</a>

        <div class="market-notice">
            Note: Prices fluctuate based on changes in market supply and demand conditions.
        </div>

        <div class="market-header">
            <h3>Market Prices</h3>
            <h4>Location: Enkoor and Khammam</h4>
        </div>

        <table>
            <thead>
                <tr>
                    <th>Product Name</th>
                    <th>Date</th>
                    <th>Maximum Price</th>
                    <th>Average Price</th>
                    <th>Minimum Price</th>
                </tr>
            </thead>
            <tbody>
                <c:if test="${empty marketrates}">
                    <tr>
                        <td colspan="5">No market data available.</td>
                    </tr>
                </c:if>
                <c:forEach var="marketrate" items="${marketrates}">
                    <tr>
                        <td class="product-name">${marketrate.productname}</td>
                        <td>${marketrate.date}</td>
                        <td class="price-high">Rs. ${marketrate.maxrate}</td>
                        <td class="price-avg">Rs. ${marketrate.avgrate}</td>
                        <td class="price-low">Rs. ${marketrate.minrate}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <div class="marquee-container">
        <div class="marquee-content">
            <img src="${pageContext.request.contextPath}/images/1.png" alt="Image 1">
            <img src="${pageContext.request.contextPath}/images/2.png" alt="Image 2">
            <img src="${pageContext.request.contextPath}/images/3.png" alt="Image 3">
            <img src="${pageContext.request.contextPath}/images/4.png" alt="Image 4">
            <img src="${pageContext.request.contextPath}/images/5.png" alt="Image 5">
            <img src="${pageContext.request.contextPath}/images/6.png" alt="Image 6">
        </div>
    </div>

    <footer>
        <p>&copy; 2019 MSR Products and Services.</p>
    </footer>
</body>
</html>
