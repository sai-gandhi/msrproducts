<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Market Prices</title>
</head>
<body>
    <h2>View All Market Prices</h2>
    <a href="home.jsp">Back to home</a>
    
    <table border="1">
        <thead>
            <tr>
                <th>Customer ID</th>
                <th>Product Name</th>
                <th>Date</th>
                <th>Maximum Price</th>
                <th>Average Price</th>
                <th>Minimum Price</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="marketrate" items="${marketrates}">
                <tr>
                    <td>${marketrate.id}</td>
                    <td>${marketrate.productname}</td>
                    <td>${marketrate.date}</td>
                    <td>${marketrate.maxrate}</td>
                    <td>${marketrate.avgrate}</td>
                    <td>${marketrate.minrate}</td>
                    <td><a href="<c:url value='/updaterate/${marketrate.id}' />">Update</a> </td>

                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
