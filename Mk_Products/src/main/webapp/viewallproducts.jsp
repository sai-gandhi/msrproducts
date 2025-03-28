<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>View All Products</title>
</head>
<body>
    <h2>All Products</h2>
    <a href="adminhome.jsp">Back to Home</a><br><br>
    
    <table border="1">
        <thead>
            <tr>
                <th>Product ID</th>
                <th>Name</th>
                <th>Cost</th>
                <th>Description</th>
                <th>Image</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="product" items="${products}">
                <tr>
                    <td>${product.id}</td>
                    <td>${product.name}</td>
                    <td>${product.cost}</td>
                    <td>${product.description}</td>

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
                    <td>
                     <a href="<c:url value='/productdelete?id=${product.id}' />">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
