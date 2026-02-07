<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>View All Products</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            padding: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        th, td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ccc;
        }

        th {
            background-color: #2196F3;
            color: white;
        }

        .description {
            max-width: 300px;
            text-align: left;
        }

        .desc-text {
            overflow: hidden;
            display: block;
            max-height: 3em; /* approx. 2 lines */
            line-height: 1.5em;
            position: relative;
        }

        .desc-text.expanded {
            max-height: none;
        }

        .toggle-btn {
            background: none;
            color: #007bff;
            border: none;
            padding: 0;
            cursor: pointer;
            font-size: 14px;
            margin-top: 5px;
            text-align: left;
        }

        .toggle-btn:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<h2>List of all Products</h2>
<a href="adminhome.jsp" class="backbutton">Back to Home</a><br><br>

<table>
    <thead>
        <tr>
            <th>Product ID</th>
            <th>Name</th>
            <th>Cost</th>
            <th>Available Products</th>
            <th>Image</th>
            <th>Description</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="product" items="${products}">
            <tr>
                <td>${product.id}</td>
                <td>${product.name}</td>
                <td>${product.cost}</td>
                <td>${product.productcount}</td>
                <td>
                    <c:choose>
                        <c:when test="${product.image != null}">
                            <img src="displayproductimage?id=${product.id}" alt="Product Image" width="100" height="100"/>
                        </c:when>
                        <c:otherwise>
                            <img src="default-image.jpg" alt="Default Image" width="100" height="100"/>
                        </c:otherwise>
                    </c:choose>
                </td>
                <td class="description">
                    <span class="desc-text">${product.description}</span>
                    <button class="toggle-btn" onclick="toggleDesc(this)">Show More</button>
                </td>
                <td>
                    <a href="updateproduct?id=${product.id}">Edit</a>

                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<script>
    function toggleDesc(btn) {
        const desc = btn.previousElementSibling;
        desc.classList.toggle('expanded');
        btn.textContent = desc.classList.contains('expanded') ? "Show Less" : "Show More";
    }
</script>

</body>
</html>
