<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Products</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #3498db;
            --primary-dark: #2980b9;
            --secondary: #2ecc71;
            --dark: #2c3e50;
            --light: #ecf0f1;
            --gray: #95a5a6;
            --white: #ffffff;
            --shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
            color: #333;
            line-height: 1.6;
            padding: 30px;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        h2 {
            color: var(--dark);
            margin-bottom: 20px;
            font-weight: 600;
            text-align: center;
            position: relative;
            padding-bottom: 10px;
        }

        h2::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 3px;
            background: linear-gradient(to right, var(--primary), var(--secondary));
        }

        .back-link {
            display: inline-block;
            margin-bottom: 25px;
            color: var(--primary);
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .back-link:hover {
            color: var(--primary-dark);
            transform: translateX(-3px);
        }

        .back-link i {
            margin-right: 5px;
        }

        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            background-color: var(--white);
            box-shadow: var(--shadow);
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 15px;
            text-align: center;
            border-bottom: 1px solid rgba(0, 0, 0, 0.05);
        }

        th {
            background: linear-gradient(135deg, var(--primary), var(--primary-dark));
            color: var(--white);
            font-weight: 500;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            position: sticky;
            top: 0;
        }

        tr:nth-child(even) {
            background-color: rgba(52, 152, 219, 0.05);
        }

        tr:hover {
            background-color: rgba(52, 152, 219, 0.1);
            transition: background-color 0.3s ease;
        }

        .description {
            max-width: 300px;
            text-align: left;
        }

        .desc-text {
            overflow: hidden;
            display: block;
            max-height: 3em;
            line-height: 1.5em;
            position: relative;
            transition: max-height 0.3s ease;
        }

        .desc-text.expanded {
            max-height: 500px;
        }

        .toggle-btn {
            background: none;
            color: var(--primary);
            border: none;
            padding: 5px 0;
            cursor: pointer;
            font-size: 14px;
            font-weight: 500;
            display: flex;
            align-items: center;
            margin-top: 5px;
            transition: all 0.3s ease;
        }

        .toggle-btn:hover {
            color: var(--primary-dark);
        }

        .toggle-btn i {
            margin-left: 5px;
            font-size: 12px;
            transition: transform 0.3s ease;
        }

        .toggle-btn.expanded i {
            transform: rotate(180deg);
        }

        .product-image {
            width: 90px;
            height: 90px;
            object-fit: cover;
            border-radius: 4px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .product-image:hover {
            transform: scale(1.05);
        }

        .availability {
            display: inline-block;
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 500;
        }

        .available {
            background-color: rgba(46, 204, 113, 0.2);
            color: var(--secondary);
        }

        .low-stock {
            background-color: rgba(241, 196, 15, 0.2);
            color: #f1c40f;
        }

        .out-of-stock {
            background-color: rgba(231, 76, 60, 0.2);
            color: #e74c3c;
        }

        /* Responsive styles */
        @media (max-width: 768px) {
            body {
                padding: 15px;
            }

            table {
                display: block;
                overflow-x: auto;
            }

            th, td {
                padding: 10px;
                font-size: 14px;
            }

            .desc-text {
                max-width: 200px;
            }
        }

        @media (max-width: 480px) {
            h2 {
                font-size: 1.5rem;
            }

            .back-link {
                font-size: 14px;
            }
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
<div class="container">
    <h2>View All Products</h2>
    <a href="customerhome.jsp" class="back-link"><i class="fas fa-arrow-left"></i> Back to Home</a>
    
    <table>
        <thead>
            <tr>
                <th>Name</th>
                <th>Cost</th>
                <th>Availability</th>
                <th>Image</th>
                <th>Description</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="product" items="${products}">
                <tr>
                    <td>${product.name}</td>
                    <td>Rs.${product.cost}</td>
                    <td>
                        <span class="availability 
                            <c:choose>
                                <c:when test="${product.productcount > 10}">available</c:when>
                                <c:when test="${product.productcount > 0 && product.productcount <= 10}">low-stock</c:when>
                                <c:otherwise>out-of-stock</c:otherwise>
                            </c:choose>">
                            ${product.productcount} available
                        </span>
                    </td>
                    <td>
                        <c:choose>
                            <c:when test="${product.image != null}">
                                <img src="displayproductimage?id=${product.id}" alt="Product Image" class="product-image"/>
                            </c:when>
                            <c:otherwise>
                                <img src="default-image.jpg" alt="Default Image" class="product-image"/>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td class="description">
                        <span class="desc-text">${product.description}</span>
                        <button class="toggle-btn" onclick="toggleDesc(this)">
                            Show More <i class="fas fa-chevron-down"></i>
                        </button>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<script>
    function toggleDesc(btn) {
        const desc = btn.previousElementSibling;
        desc.classList.toggle('expanded');
        btn.classList.toggle('expanded');
        btn.innerHTML = desc.classList.contains('expanded') 
            ? 'Show Less <i class="fas fa-chevron-up"></i>' 
            : 'Show More <i class="fas fa-chevron-down"></i>';
    }
</script>
</body>
</html>